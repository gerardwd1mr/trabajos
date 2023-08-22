
USE ProyectoTSC2;

-- -----------------------------------------CLIENTES--------------------------------------------->

--- -----------------------------------------CLIENTES--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarC (IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN fn DATE, IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    INSERT INTO Clientes (nom_cliente, ape_cliente, dni_cliente, fn_cliente, telf_cliente, email_cliente) VALUES (nom, ape, dni, fn, telf, email);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarC (IN id INT, IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN fn DATE, IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    UPDATE Clientes
    SET nom_cliente = nom, ape_cliente = ape, dni_cliente = dni, fn_cliente = fn, telf_cliente = telf, email_cliente = email WHERE id_cliente = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarC (IN id INT)
BEGIN
    DELETE FROM Clientes WHERE id_cliente = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarC ()
BEGIN
    SELECT * FROM Clientes;
END $
DELIMITER ;




-- -----------------------------------------ASESORES--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarA (IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN fn DATE, IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    INSERT INTO Asesores (nom_asesor, ape_asesor, dni_asesor, fn_asesor, telf_asesor, email_asesor) VALUES (nom, ape, dni, fn, telf, email);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarA (IN id INT, IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN fn DATE, IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    UPDATE Asesores
    SET nom_asesor = nom, ape_asesor = ape, dni_asesor = dni, fn_asesor = fn, telf_asesor = telf, email_asesor = email WHERE id_asesor = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarA (IN id INT)
BEGIN
    DELETE FROM Asesores WHERE id_asesor = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarA ()
BEGIN
    SELECT * FROM Asesores;
END $
DELIMITER ;


-- -----------------------------------------JefeProyectos--------------------------------------------->
-- -----------------------------------------JefeProyectos--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarJP (IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN fn DATE, IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    INSERT INTO Jefe_Proyectos (nom_gerente, ape_gerente, dni_gerente, fn_gerente, telf_gerente, email_gerente) VALUES (nom, ape, dni, fn, telf, email);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarJP (IN id INT, IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN fn DATE, IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    UPDATE Jefe_Proyectos
    SET nom_gerente = nom, ape_gerente = ape, dni_gerente = dni, fn_gerente = fn, telf_gerente = telf, email_gerente = email WHERE id_gerente = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarJP (IN id INT)
BEGIN
    DELETE FROM Jefe_Proyectos WHERE id_gerente = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarJP ()
BEGIN
    SELECT * FROM Jefe_Proyectos;
END $
DELIMITER ;

-- -----------------------------------------Proyectos--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarP (IN idCli INT, IN idAsesor INT, IN emp VARCHAR(50), IN ruc VARCHAR(20), IN inf VARCHAR(80))
BEGIN
    INSERT INTO Proyectos (id_cliente, id_asesor, empresa, ruc, inf_proyecto) VALUES (idCli, idAsesor, emp, ruc, inf);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarP (IN id INT, IN idCli INT, IN idAsesor INT, IN emp VARCHAR(50), IN ruc VARCHAR(20), IN inf VARCHAR(80))
BEGIN
    UPDATE Proyectos
    SET id_cliente = idCli, id_asesor = idAsesor, empresa = emp, ruc = ruc, inf_proyecto = inf WHERE id_proyecto = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarP (IN id INT)
BEGIN
    DELETE FROM Proyectos WHERE id_proyecto = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarP ()
BEGIN
    SELECT * FROM Proyectos;
END $
DELIMITER ;

-- -----------------------------------------EMPLEADOS--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarE (IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    INSERT INTO Empleados (nom_empleado, ape_empleado, dni_empleado, telf_empleado, email_empleado) VALUES (nom, ape, dni, telf, email);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarE (IN id INT, IN nom VARCHAR(50), IN ape VARCHAR(50), IN dni VARCHAR(8), IN telf VARCHAR(9), IN email VARCHAR(30))
BEGIN
    UPDATE Empleados
    SET nom_empleado = nom, ape_empleado = ape, dni_empleado = dni, telf_empleado = telf, email_empleado = email WHERE id_empleado = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarE (IN id INT)
BEGIN
    DELETE FROM Empleados WHERE id_empleado = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarE ()
BEGIN
    SELECT * FROM Empleados;
END $
DELIMITER ;


-- -----------------------------------------Historial de proyectos--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarHP (IN feI DATE, IN feF DATE, IN idCli INT, IN idEmp INT)
BEGIN
    INSERT INTO Historial_proyectos (fec_inicio, fec_fin, id_cliente, id_empleado) VALUES (feI, feF, idCli, idEmp);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarHP (IN id INT, IN feI DATE, IN feF DATE, IN idCli INT, IN idEmp INT)
BEGIN
    UPDATE Historial_proyectos
    SET fec_inicio = feI, fec_fin = feF, id_cliente = idCli, id_empleado = idEmp WHERE id_histProy = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarHP (IN id INT)
BEGIN
    DELETE FROM Historial_proyectos WHERE id_histProy = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarHP ()
BEGIN
    SELECT * FROM Historial_proyectos;
END $
DELIMITER ;


-- -----------------------------------------COTIZACIÓN--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarCO (IN cos VARCHAR(10), IN rub VARCHAR(20), IN con VARCHAR(30), IN impT DECIMAL(4,2), IN PagoH DECIMAL(4,2))
BEGIN
    INSERT INTO Cotización (costo, rubro, concepto, importeTotal, Pagoxhoras) VALUES (cos, rub, con, impT, PagoH);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarCO (IN id INT, IN cos VARCHAR(10), IN rub VARCHAR(20), IN con VARCHAR(30), IN impT DECIMAL(4,2), IN PagoH DECIMAL(4,2))
BEGIN
    UPDATE Cotización
    SET costo = cos, rubro = rub, concepto = con, importeTotal = impT, Pagoxhoras = PagoH WHERE id_servicio = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarCO (IN id INT)
BEGIN
    DELETE FROM Cotización WHERE id_servicio = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarCO ()
BEGIN
    SELECT * FROM Cotización;
END $
DELIMITER ;


-- -----------------------------------------Pago--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarPago (IN fecP DATE, IN mon DECIMAL(4,2), IN com VARCHAR(30), IN est VARCHAR(11), IN idCli INT, IN idCot INT)
BEGIN
    INSERT INTO Pago (fecha_pago, monto, comprobante, Estado, id_cliente, id_cotización) VALUES (fecP, mon, com, est, idCli, idCot);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarPago (IN id INT, IN fecP DATE, IN mon DECIMAL(4,2), IN com VARCHAR(30), IN est VARCHAR(11), IN idCli INT, IN idCot INT)
BEGIN
    UPDATE Pago
    SET fecha_pago = fecP, monto = mon, comprobante = com, Estado = est, id_cliente = idCli, id_cotización = idCot WHERE id_pago = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarPago (IN id INT)
BEGIN
    DELETE FROM Pago WHERE id_pago = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarPago ()
BEGIN
    SELECT * FROM Pago;
END $
DELIMITER ;


-- ------------------------------------------- -----------------------------------------REPORTES--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarR (IN des VARCHAR(50), IN fec DATE, IN tipo VARCHAR(10), IN cont VARCHAR(20), IN idCli INT, IN idProy INT, IN idPago INT, IN idAsesor INT)
BEGIN
    INSERT INTO Reportes (desc_reporte, fec_generacion, Tipo, Contenido, id_cliente, id_proyecto, id_pago, id_asesor) VALUES (des, fec, tipo, cont, idCli, idProy, idPago, idAsesor);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarR (IN id INT, IN des VARCHAR(50), IN fec DATE, IN tipo VARCHAR(10), IN cont VARCHAR(20), IN idCli INT, IN idProy INT, IN idPago INT, IN idAsesor INT)
BEGIN
    UPDATE Reportes
    SET desc_reporte = des, fec_generacion = fec, Tipo = tipo, Contenido = cont, id_cliente = idCli, id_proyecto = idProy, id_pago = idPago, id_asesor = idAsesor WHERE id_reporte = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarR (IN id INT)
BEGIN
    DELETE FROM Reportes WHERE id_reporte = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarR ()
BEGIN
    SELECT * FROM Reportes;
END $
DELIMITER ;


-- -----------------------------------------Ver estado--------------------------------------------->
-- REGISTRAR-->
DELIMITER $
CREATE PROCEDURE insertarV (IN est VARCHAR(15), IN idCli INT, IN idProy INT, IN idRep INT, IN idPag INT)
BEGIN
    INSERT INTO Ver_Estado (estado, id_cliente, id_proyecto, id_reporte, id_pago) VALUES (est, idCli, idProy, idRep, idPag);
END $
-- EDITAR-->
DELIMITER $
CREATE PROCEDURE editarV (IN id INT, IN est VARCHAR(15), IN idCli INT, IN idProy INT, IN idRep INT, IN idPag INT)
BEGIN
    UPDATE Ver_Estado
    SET estado = est, id_cliente = idCli, id_proyecto = idProy, id_reporte = idRep, id_pago = idPag WHERE id_verEstado = id;
END $
-- ELIMINAR-->
DELIMITER $
CREATE PROCEDURE eliminarV (IN id INT)
BEGIN
    DELETE FROM Ver_Estado WHERE id_verEstado = id;
END $
-- LISTAR-->
DELIMITER $
CREATE PROCEDURE listarV ()
BEGIN
    SELECT * FROM Ver_Estado;
END $
DELIMITER ;








