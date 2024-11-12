-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: aurora_contable_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1

--
-- Dumping routines for database 'aurora_contable_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_stock_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_stock_factura`(
    IN p_cabFactura_id INT,
    IN p_producto_id INT,
    IN p_codigoEmpresa INT,
    IN p_tipo_factura VARCHAR(10),
    IN p_cantidad INT,
    IN p_tipo_op VARCHAR(10)
)
BEGIN
    DECLARE old_stock_actual INT;
    DECLARE new_stock_actual INT;
    DECLARE tipo_movimiento VARCHAR(10);
    DECLARE old_cantidad_producto INT;

    -- Obtener la cantidad actual del producto en la tabla stocks
    SELECT IFNULL(cantidad, 0) INTO old_stock_actual
    FROM stocks
    WHERE producto_id = p_producto_id AND codigoEmpresa = p_codigoEmpresa;

    -- Realizar las operaciones según el tipo de operación y tipo de factura
    IF p_tipo_op = 'insert' THEN
		IF p_tipo_factura = 'Venta' THEN
			SET new_stock_actual = old_stock_actual - p_cantidad;
		ELSEIF p_tipo_factura = 'Compra' THEN
			SET new_stock_actual = old_stock_actual + p_cantidad;
		END IF;
    ELSEIF p_tipo_op = 'update' THEN
        SELECT IFNULL(sum(df.cantidad), 0) INTO old_cantidad_producto
        FROM detFacturas df
        WHERE df.producto_id = p_producto_id AND df.cabFactura_id = p_cabFactura_id 
        LIMIT 1;

        IF p_tipo_factura = 'Venta' THEN
            SET new_stock_actual = old_stock_actual + old_cantidad_producto - p_cantidad;
        ELSEIF p_tipo_factura = 'Compra' THEN
            SET new_stock_actual = old_stock_actual - old_cantidad_producto + p_cantidad;
        END IF;
	ELSEIF p_tipo_op = 'delete' THEN
        IF p_tipo_factura = 'Venta' THEN
            SET new_stock_actual = old_stock_actual + p_cantidad;
        ELSEIF p_tipo_factura = 'Compra' THEN
            SET new_stock_actual = old_stock_actual - p_cantidad;
        END IF;
    END IF;
    
    -- Actualizar el registro en la tabla stocks
    UPDATE stocks
    SET cantidad = new_stock_actual, updated_at = NOW()
    WHERE producto_id = p_producto_id AND codigoEmpresa = p_codigoEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_stock_inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_stock_inventario`(
    IN p_cabMovimiento_id INT,
    IN p_producto_id INT,
    IN p_codigoEmpresa INT,
    IN p_movimiento_tipo INT,
    IN p_cantidad INT,
    IN p_tipo_op VARCHAR(10)
)
BEGIN
    DECLARE old_stock_actual INT;
    DECLARE new_stock_actual INT;
    DECLARE tipo_movimiento VARCHAR(10);
    DECLARE old_cantidad_producto INT;
    DECLARE mensaje_error VARCHAR(255) DEFAULT '';
    
    -- Obtener tipo de movimiento
    SELECT mt.movimiento INTO tipo_movimiento
    FROM movimientos mt
    WHERE mt.id = p_movimiento_tipo;

    -- Obtener la cantidad actual del producto en la tabla stocks
    SELECT IFNULL(cantidad, 0) INTO old_stock_actual
    FROM stocks
    WHERE producto_id = p_producto_id AND codigoEmpresa = p_codigoEmpresa;

    -- Realizar las operaciones según el tipo de operación y tipo de movimiento
    IF p_tipo_op = 'insert' THEN
		 -- Verificar si el registro de stock existe
		IF (SELECT IFNULL(COUNT(*), 0) FROM stocks WHERE producto_id = p_producto_id AND codigoEmpresa = p_codigoEmpresa) = 0 THEN
			-- Insertar un nuevo registro si no existe
            SET new_stock_actual = p_cantidad;
			INSERT INTO stocks (producto_id, cantidad, estado, usrCreador, usrEditor, created_at, updated_at, codigoEmpresa)
			VALUES (p_producto_id, new_stock_actual, 'Activo', NULL, NULL, NOW(), NOW(), p_codigoEmpresa);
		ELSE
			IF tipo_movimiento = 'Ingreso' THEN
				SET new_stock_actual = old_stock_actual + p_cantidad;
			ELSEIF tipo_movimiento = 'Egreso' THEN
				-- Validar si el stock es suficiente para el egreso
                IF (old_stock_actual - p_cantidad) < 0 THEN
                    SET mensaje_error = CONCAT('No se puede hacer un egreso al producto con código: ', p_producto_id, ' porque supera la cantidad en stock actual');
                ELSE
                    SET new_stock_actual = old_stock_actual - p_cantidad;
                END IF;
			END IF;
		END IF;
    ELSEIF p_tipo_op = 'update' THEN
        SELECT IFNULL(sum(dm.cantidad), 0) INTO old_cantidad_producto
        FROM detMovimientos dm
        WHERE dm.producto_id = p_producto_id AND dm.cabMovimiento_id = p_cabMovimiento_id 
        LIMIT 1;
    
        IF tipo_movimiento = 'Ingreso' THEN
            SET new_stock_actual = old_stock_actual - old_cantidad_producto + p_cantidad;
        ELSEIF tipo_movimiento = 'Egreso' THEN
            -- Validar si el stock es suficiente para el egreso tras actualizar
            IF (old_stock_actual + old_cantidad_producto - p_cantidad) < 0 THEN
                SET mensaje_error = CONCAT('No se puede actualizar el egreso del producto con código: ', p_producto_id, ' porque supera la cantidad en stock');
            ELSE
                SET new_stock_actual = old_stock_actual + old_cantidad_producto - p_cantidad;
            END IF;
        END IF;
	ELSEIF p_tipo_op = 'delete' THEN
        IF tipo_movimiento = 'Ingreso' THEN
            SET new_stock_actual = old_stock_actual - p_cantidad;
        ELSEIF tipo_movimiento = 'Egreso' THEN
            SET new_stock_actual = old_stock_actual + p_cantidad;
        END IF;
    END IF;
    
     -- Verificación final: Si hay un mensaje de error, no se aplica la actualización
    IF mensaje_error = '' THEN
        -- Actualizar el registro en la tabla stocks
		UPDATE stocks
		SET cantidad = new_stock_actual, updated_at = NOW()
		WHERE producto_id = p_producto_id AND codigoEmpresa = p_codigoEmpresa;
    ELSE
        -- Si hay error, se puede devolver con SELECT o dejar que el sistema lo maneje como una advertencia
        SELECT mensaje_error AS error;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_gestionar_abonos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gestionar_abonos`(
    IN p_abono_id BIGINT,
    IN p_cabFactura_id BIGINT,
    IN p_monto DECIMAL(10, 2),
    IN p_fecha DATE,
    IN p_descripcion VARCHAR(100),
    IN p_user VARCHAR(25),
    IN p_codigoEmpresa VARCHAR(10),
    IN p_tipo_op VARCHAR(10)
)
BEGIN
    DECLARE v_totalFactura DECIMAL(10, 2);
    DECLARE v_totalAbonos DECIMAL(10, 2);
    DECLARE v_saldo DECIMAL(10, 2);
    DECLARE v_montoOriginal DECIMAL(10, 2);
    DECLARE v_insert_id BIGINT;
    DECLARE v_status INT;
    DECLARE v_message VARCHAR(255);

    -- Inicializar variables
    SET v_status = 200; -- Default status for success
    SET v_message = '';

    -- Obtener el total de la factura
    SELECT total INTO v_totalFactura
    FROM cabFacturas
    WHERE id = p_cabFactura_id;

    -- Obtener el total de los abonos ya realizados excluyendo el abono actual si es una actualización
    IF p_tipo_op IN ('update', 'delete') THEN
        SELECT monto INTO v_montoOriginal
        FROM abonos
        WHERE id = p_abono_id;
    ELSE
        SET v_montoOriginal = 0;
    END IF;

    -- Calcular el total de abonos
    SELECT IFNULL(SUM(monto), 0) - v_montoOriginal INTO v_totalAbonos
    FROM abonos
    WHERE cabFactura_id = p_cabFactura_id;

    -- Calcular el saldo restante
    SET v_saldo = v_totalFactura - v_totalAbonos;

    -- Verificar si el monto del nuevo abono supera el saldo pendiente
    IF (p_tipo_op IN ('insert', 'update')) AND p_monto > v_saldo THEN
        SET v_status = 422;
        SET v_message = 'El monto del abono supera el saldo pendiente.';
    ELSE
        -- Manejar las operaciones según el tipo de operación
        IF p_tipo_op = 'insert' THEN
            -- Insertar el nuevo abono
            INSERT INTO abonos (cabFactura_id, monto, saldo, fecha, descripcion, estado, usrCreador, created_at, codigoEmpresa)
            VALUES (p_cabFactura_id, p_monto, v_saldo - p_monto, p_fecha, p_descripcion, 'Abonado', p_user, NOW(), p_codigoEmpresa);
            
            -- Obtener el ID del nuevo abono
            SET v_insert_id = LAST_INSERT_ID();
        ELSEIF p_tipo_op = 'update' THEN
            -- Actualizar el abono existente
            UPDATE abonos
            SET monto = p_monto, saldo = v_saldo - p_monto, fecha = p_fecha, descripcion = p_descripcion, usrEditor = p_user, updated_at = NOW()
            WHERE id = p_abono_id;
        END IF;

        -- Actualizar el estado de la factura si el saldo es cero
        IF v_saldo = 0 THEN
            UPDATE cabFacturas
            SET estado = 'Pagada'
            WHERE id = p_cabFactura_id;
            
            SET v_status = 201;
            SET v_message = CONCAT(v_message, ' La factura ha sido pagada en su totalidad.');
        END IF;
    END IF;
    
    -- Verificar si hay un ID válido para buscar en la tabla abonos
	IF v_insert_id > 0 OR p_abono_id > 0 THEN
		SELECT *, v_status AS status FROM abonos WHERE id = IFNULL(v_insert_id, p_abono_id);
	ELSE
		SELECT v_status AS status, v_message AS message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_reporte_contable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reporte_contable`(
    IN p_codigoEmpresa INT, 
    IN p_fecha_inicio DATE, 
    IN p_fecha_fin DATE,
    IN p_tipo_op VARCHAR(15)
)
BEGIN
    DECLARE ventas INT;
    DECLARE compras INT;
    DECLARE cuentasPorCobrar INT;
    DECLARE cuentasPorPagar INT;
    DECLARE ventasPagadas INT;
    DECLARE comprasPagadas INT;
    DECLARE abonosCuentasPorCobrar INT;
    DECLARE abonosCuentasPorPagar INT;
    DECLARE ingresosMovimientosContables INT;
    DECLARE egresosMovimientosContables INT;

    DECLARE totalVentas DECIMAL(10, 2);
    DECLARE totalCompras DECIMAL(10, 2);
    
    DECLARE totalPagadasVenta DECIMAL(10, 2);
    DECLARE totalPorCobrarVenta DECIMAL(10, 2);

    DECLARE totalPagadasCompra DECIMAL(10, 2);
    DECLARE totalPorPagarCompra DECIMAL(10, 2);

    DECLARE totalCuentasPorCobrar DECIMAL(10, 2);
    DECLARE totalCuentasPorPagar DECIMAL(10, 2);

    DECLARE totalVentasPagadas DECIMAL(10, 2);
    DECLARE totalComprasPagadas DECIMAL(10, 2);
    
    DECLARE totalIngresos DECIMAL(10, 2);
    DECLARE totalEgresos DECIMAL(10, 2);

    DECLARE totalSaldoPendienteAbonosFacturaVenta DECIMAL(10, 2);
    DECLARE totalSaldoPendienteAbonosFacturaCompra DECIMAL(10, 2);
    
    DECLARE totalAbonosCuentasPorCobrar DECIMAL(10, 2);
    DECLARE totalAbonosCuentasPorPagar DECIMAL(10, 2);
    
    DECLARE totalIngresosMovimientosContables DECIMAL(10, 2);
    DECLARE totalEgresosMovimientosContables DECIMAL(10, 2);

    DECLARE fecha_inicio DATE;
    DECLARE fecha_fin DATE;

    IF p_tipo_op = 'Dia' OR p_tipo_op = 'Semana' OR p_tipo_op = 'Mes' OR p_tipo_op = 'Año' OR p_tipo_op = 'Personalizado' THEN
        IF p_tipo_op = 'Dia' THEN
            -- Se define las fechas con el mismo día
            SET fecha_inicio = p_fecha_inicio;
            SET fecha_fin = p_fecha_inicio;
        ELSEIF p_tipo_op = 'Semana' THEN
            -- Se define el inicio y fin de la semana para la fecha dada
            SET fecha_inicio = DATE_SUB(p_fecha_inicio, INTERVAL WEEKDAY(p_fecha_inicio) DAY);
            SET fecha_fin = DATE_ADD(fecha_inicio, INTERVAL 6 DAY);
        ELSEIF p_tipo_op = 'Mes' THEN
            -- Se define el mes a partir de cualquier fecha dentro de ese mes
            SET fecha_inicio = DATE_FORMAT(p_fecha_inicio, '%Y-%m-01');
            SET fecha_fin = LAST_DAY(p_fecha_inicio);
        ELSEIF p_tipo_op = 'Año' THEN
            -- Se define el año a partir de cualquier fecha
            SET fecha_inicio = CONCAT(YEAR(p_fecha_inicio), '-01-01');
            SET fecha_fin = CONCAT(YEAR(p_fecha_inicio), '-12-31');
		ELSEIF p_tipo_op = 'Personalizado' THEN
            -- Se define el rango de fecha personalizado
            SET fecha_inicio = p_fecha_inicio;
            SET fecha_fin = p_fecha_fin;
        END IF;

        /* TOTALES DE VENTA */
        -- Se obtiene la cantidad de ventas
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO ventas, totalVentas
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Venta' AND estado = 'Pagada';

        -- Se obtiene el total de las facturas de venta pagadas 
        SELECT IFNULL(SUM(total), 0) INTO totalPagadasVenta
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND estado = 'Pagada' AND tipoFactura = 'Venta';

        -- Se obtiene el total de las facturas de venta por cobrar 
        SELECT IFNULL(SUM(total), 0) INTO totalPorCobrarVenta
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND estado = 'Por cobrar' AND tipoFactura = 'Venta';

        -- Se obtiene el total de los abonos de las facturas que estan por cobrar
		SELECT IFNULL(SUM(cf.total - IFNULL((SELECT SUM(ab.monto)FROM abonos ab WHERE ab.cabFactura_id = cf.id), 0)), 0)
		INTO totalSaldoPendienteAbonosFacturaVenta
		FROM cabFacturas cf
		WHERE cf.fechaEmision BETWEEN fecha_inicio AND fecha_fin 
		 AND cf.codigoEmpresa = p_codigoEmpresa
		 AND cf.estado = 'Por cobrar' 
		 AND cf.tipoFactura = 'Venta';
        
        /* TOTALES DE COMPRA */
        -- Se obtiene la cantidad de compra
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO compras, totalCompras
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Compra' AND estado = 'Pagada';

        -- Se obtiene el total de las facturas de compra pagadas
        SELECT IFNULL(SUM(total), 0) INTO totalPagadasCompra
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND estado = 'Pagada' AND tipoFactura = 'Compra';

        -- Se obtiene el total de las facturas de compra por pagar 
        SELECT IFNULL(SUM(total), 0) INTO totalPorPagarCompra
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND estado = 'Por pagar' AND tipoFactura = 'Compra';

        -- Se obtiene el total de los abonos de las facturas que estan por pagar
        SELECT IFNULL(SUM(cf.total - IFNULL((SELECT SUM(ab.monto)FROM abonos ab WHERE ab.cabFactura_id = cf.id), 0)), 0)       
		 INTO totalSaldoPendienteAbonosFacturaCompra
		FROM cabFacturas cf
		WHERE cf.fechaEmision BETWEEN fecha_inicio AND fecha_fin 
		 AND cf.codigoEmpresa = p_codigoEmpresa
		 AND cf.estado = 'Por pagar' 
		 AND cf.tipoFactura = 'Compra';


        /* TOTALES CUENTAS POR COBRAR */
        -- Se obtiene la cantidad de cuentas por cobrar
        SELECT IFNULL(COUNT(id), 0) INTO cuentasPorCobrar
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Venta' AND estado = 'Por cobrar';

        /* TOTALES CUENTAS POR PAGAR */
        -- Se obtiene la cantidad de cuentas por pagar
        SELECT IFNULL(COUNT(id), 0) INTO cuentasPorPagar
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Compra' AND estado = 'Por pagar';

        /* TOTALES VENTAS PAGADAS */
        -- Se obtiene la cantidad de ventas pagadas y total de ventas pagadas
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO ventasPagadas, totalVentasPagadas
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Venta' AND estado = 'Pagada';

        /* TOTALES COMPRAS PAGADAS */
        -- Se obtiene la cantidad de compras pagadas y total de compras pagadas
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO comprasPagadas, totalComprasPagadas
        FROM cabFacturas
        WHERE fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Compra' AND estado = 'Pagada';
        
        /* TOTALES DE ABONOS DE CUENTAS POR COBRAR */
        SELECT IFNULL(COUNT(ab.id), 0), IFNULL(SUM(ab.monto), 0) INTO abonosCuentasPorCobrar, totalAbonosCuentasPorCobrar  
        FROM abonos ab INNER JOIN cabFacturas cf ON (ab.cabFactura_id = cf.id)
        WHERE cf.fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND cf.codigoEmpresa = p_codigoEmpresa AND cf.tipoFactura = 'Venta' AND cf.estado = 'Por cobrar';
        
        /* TOTALES DE ABONOS DE CUENTAS POR PAGAR */
        SELECT IFNULL(COUNT(ab.id), 0), IFNULL(SUM(ab.monto), 0) INTO abonosCuentasPorPagar, totalAbonosCuentasPorPagar  
        FROM abonos ab INNER JOIN cabFacturas cf ON (ab.cabFactura_id = cf.id)
        WHERE cf.fechaEmision BETWEEN fecha_inicio AND fecha_fin 
        AND cf.codigoEmpresa = p_codigoEmpresa AND cf.tipoFactura = 'Compra' AND cf.estado = 'Por pagar';
        
        /* TOTALES DE MOVIMIENTOS CONTABLES INGRESOS */
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(monto), 0) INTO ingresosMovimientosContables, totalIngresosMovimientosContables  
        FROM movimientosContables
        WHERE fecha BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipo = 'Ingreso' AND estado != 'Eliminado';
        
        /* TOTALES DE MOVIMIENTOS CONTABLES EGRESOS */
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(monto), 0) INTO egresosMovimientosContables, totalEgresosMovimientosContables  
        FROM movimientosContables
        WHERE fecha BETWEEN fecha_inicio AND fecha_fin 
        AND codigoEmpresa = p_codigoEmpresa AND tipo = 'Egreso' AND estado != 'Eliminado';

    ELSEIF p_tipo_op = 'General' THEN
        /* TOTALES DE VENTA */
        -- Se obtiene la cantidad de ventas
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO ventas, totalVentas
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Venta';

        -- Se obtiene el total de las facturas de venta pagadas 
        SELECT IFNULL(SUM(total), 0) INTO totalPagadasVenta
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND estado = 'Pagada' AND tipoFactura = 'Venta';

        -- Se obtiene el total de las facturas de venta por cobrar 
        SELECT IFNULL(SUM(total), 0) INTO totalPorCobrarVenta
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND estado = 'Por cobrar' AND tipoFactura = 'Venta';

        -- Se obtiene el total de los abonos de las facturas que estan por cobrar
        SELECT IFNULL(SUM(cf.total - IFNULL((SELECT SUM(ab.monto)FROM abonos ab WHERE ab.cabFactura_id = cf.id), 0)), 0)       
		 INTO totalSaldoPendienteAbonosFacturaVenta
		FROM cabFacturas cf
		WHERE cf.codigoEmpresa = p_codigoEmpresa
		 AND cf.estado = 'Por cobrar' 
		 AND cf.tipoFactura = 'Venta';

        /* TOTALES DE COMPRA */
        -- Se obtiene la cantidad de compra
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO compras, totalCompras
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Compra';

        -- Se obtiene el total de las facturas de compra pagadas
        SELECT IFNULL(SUM(total), 0) INTO totalPagadasCompra
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND estado = 'Pagada' AND tipoFactura = 'Compra';

        -- Se obtiene el total de las facturas de compra por pagar 
        SELECT IFNULL(SUM(total), 0) INTO totalPorPagarCompra
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND estado = 'Por pagar' AND tipoFactura = 'Compra';

        -- Se obtiene el total de los abonos de las facturas que estan por pagar
		SELECT IFNULL(SUM(cf.total - IFNULL((SELECT SUM(ab.monto)FROM abonos ab WHERE ab.cabFactura_id = cf.id), 0)), 0)       
		 INTO totalSaldoPendienteAbonosFacturaCompra
		FROM cabFacturas cf
		WHERE cf.codigoEmpresa = p_codigoEmpresa
		 AND cf.estado = 'Por pagar' 
		 AND cf.tipoFactura = 'Compra';

        /* TOTALES CUENTAS POR COBRAR */
        -- Se obtiene la cantidad de cuentas por cobrar
        SELECT IFNULL(COUNT(id), 0) INTO cuentasPorCobrar
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Venta' AND estado = 'Por cobrar';

        /* TOTALES CUENTAS POR PAGAR */
        -- Se obtiene la cantidad de cuentas por pagar
        SELECT IFNULL(COUNT(id), 0) INTO cuentasPorPagar
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Compra' AND estado = 'Por pagar';

        /* TOTALES VENTAS PAGADAS */
        -- Se obtiene la cantidad de ventas pagadas y total de ventas pagadas
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO ventasPagadas, totalVentasPagadas
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Venta' AND estado = 'Pagada';

        /* TOTALES COMPRAS PAGADAS */
        -- Se obtiene la cantidad de compras pagadas y total de compras pagadas
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(total), 0) INTO comprasPagadas, totalComprasPagadas
        FROM cabFacturas
        WHERE codigoEmpresa = p_codigoEmpresa AND tipoFactura = 'Compra' AND estado = 'Pagada';
        
        /* TOTALES DE ABONOS DE CUENTAS POR COBRAR */
        SELECT IFNULL(COUNT(ab.id), 0), IFNULL(SUM(ab.monto), 0) INTO abonosCuentasPorCobrar, totalAbonosCuentasPorCobrar  
        FROM abonos ab INNER JOIN cabFacturas cf ON (ab.cabFactura_id = cf.id)
        WHERE cf.codigoEmpresa = p_codigoEmpresa AND cf.tipoFactura = 'Venta' AND cf.estado = 'Por cobrar';
        
        /* TOTALES DE ABONOS DE CUENTAS POR PAGAR */
        SELECT IFNULL(COUNT(ab.id), 0), IFNULL(SUM(ab.monto), 0) INTO abonosCuentasPorPagar, totalAbonosCuentasPorPagar  
        FROM abonos ab INNER JOIN cabFacturas cf ON (ab.cabFactura_id = cf.id)
        WHERE cf.codigoEmpresa = p_codigoEmpresa AND cf.tipoFactura = 'Compra' AND cf.estado = 'Por pagar';
        
        /* TOTALES DE MOVIMIENTOS CONTABLES INGRESOS */
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(monto), 0) INTO ingresosMovimientosContables, totalIngresosMovimientosContables  
        FROM movimientosContables
        WHERE codigoEmpresa = p_codigoEmpresa AND tipo = 'Ingreso' AND estado != 'Eliminado';
        
        /* TOTALES DE MOVIMIENTOS CONTABLES EGRESOS */
        SELECT IFNULL(COUNT(id), 0), IFNULL(SUM(monto), 0) INTO egresosMovimientosContables, totalEgresosMovimientosContables  
        FROM movimientosContables
        WHERE codigoEmpresa = p_codigoEmpresa AND tipo = 'Egreso' AND estado != 'Eliminado';

    END IF;

    -- Se calcula el total de ingresos
    SET totalIngresos = totalPagadasVenta + totalPorCobrarVenta - totalSaldoPendienteAbonosFacturaVenta + totalIngresosMovimientosContables;

    -- Se calcula el total de egresos
    SET totalEgresos = totalPagadasCompra + totalPorPagarCompra - totalSaldoPendienteAbonosFacturaCompra + totalEgresosMovimientosContables;

    -- Retorna los resultados
    SELECT CONCAT(fecha_inicio, ' - ', fecha_fin) AS rango, p_tipo_op AS opcion,
           ventas AS cantidad_ventas, totalVentas AS total_ventas,
           compras AS cantidad_compras, totalCompras AS total_compras,

           cuentasPorCobrar AS cantidad_cuentasPorCobrar, 
           totalSaldoPendienteAbonosFacturaVenta AS total_cuentasPorCobrar,
           
           cuentasPorPagar AS cantidad_cuentasPorPagar,
           totalSaldoPendienteAbonosFacturaCompra AS total_cuentasPorPagar,
           
           abonosCuentasPorCobrar AS cantidad_abonosCuentasPorCobrar,
           totalAbonosCuentasPorCobrar AS total_abonosCuentasPorCobrar,
           
           abonosCuentasPorPagar AS cantidad_abonosCuentasPorPagar,
           totalAbonosCuentasPorPagar AS total_abonosCuentasPorPagar,

           ventasPagadas AS cantidad_ventasPagadas, totalVentasPagadas AS total_ventasPagadas,
           comprasPagadas AS cantidad_comprasPagadas, totalComprasPagadas AS total_comprasPagadas,
           
           ingresosMovimientosContables AS cantidad_ingresosMovimientosContables, totalIngresosMovimientosContables AS total_ingresosMovimientosContables,
           egresosMovimientosContables AS cantidad_egresosMovimientosContables, totalEgresosMovimientosContables AS total_egresosMovimientosContables,
            
           totalIngresos AS total_ingresos, totalEgresos AS total_egresos,

           totalIngresos - totalEgresos AS total_ganancias;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 23:14:44
