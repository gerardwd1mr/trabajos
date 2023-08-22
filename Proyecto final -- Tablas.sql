CREATE DATABASE ProyectoTSC2;
USE ProyectoTSC2;
-- Tabla clientes -->
CREATE TABLE Clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_cliente VARCHAR(50) NOT NULL,
    ape_cliente VARCHAR(50) NOT NULL,
    dni_cliente VARCHAR(8) NOT NULL,
    fn_cliente DATE NULL,
    telf_cliente VARCHAR(9) NULL,
    email_cliente VARCHAR(30) NOT NULL
);

-- Tabla Asesores -->
CREATE TABLE Asesores(
	id_asesor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_asesor VARCHAR(50) NOT NULL,
    ape_asesor VARCHAR(50) NOT NULL,
    dni_asesor VARCHAR(8) NOT NULL,
    fn_asesor DATE NULL,
    telf_asesor VARCHAR(9) NULL,
    email_asesor VARCHAR(30) NOT NULL
);

-- Tabla de jefes de proyectos-->
CREATE TABLE Jefe_Proyectos(
	id_gerente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_gerente VARCHAR(50) NOT NULL,
    ape_gerente VARCHAR(50) NOT NULL,
    dni_gerente VARCHAR(8) NOT NULL,
    fn_gerente DATE NULL,
    telf_gerente VARCHAR(9) NULL,
    email_gerente VARCHAR(30) NOT NULL
);

-- Tabla  de Proyectos-->
CREATE TABLE Proyectos(
	id_proyecto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_cliente INT NOT NULL,
    id_asesor INT NOT NULL,
    empresa VARCHAR(50) NOT NULL,
    ruc VARCHAR(20)NOT NULL,
    inf_proyecto VARCHAR(80),
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_asesor) REFERENCES Asesores(id_asesor)
);

-- Tabla Empleados -->
CREATE TABLE Empleados(
	id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_empleado VARCHAR(50) NOT NULL,
    ape_empleado VARCHAR(50) NOT NULL,
    dni_empleado VARCHAR(8) NOT NULL,
    telf_empleado VARCHAR(9) NULL,
    email_empleado VARCHAR(30) NOT NULL
);

-- Tabla de Historial de Proyectos -->
CREATE TABLE Historial_proyectos(
	id_histProy INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fec_inicio DATE NOT NULL,
    fec_fin DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_empleado) REFERENCES Empleados(id_empleado)
);

-- Tabla Cotización -->
CREATE TABLE Cotización(
	id_servicio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    costo VARCHAR(10) NOT NULL,
    rubro VARCHAR(20) NOT NULL,
    concepto VARCHAR(30) NOT NULL,
    importeTotal DECIMAL(4,2) NOT NULL,
    Pagoxhoras DECIMAL(4,2) NOT NULL
);

-- Tabla Pagos -->
CREATE TABLE Pago(
	id_pago INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(4,2) NOT NULL,
    comprobante VARCHAR(30) NOT NULL,
    Estado VARCHAR(11),
    id_cliente INT NOT NULL,
    id_cotización INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_cotización) REFERENCES Cotización(id_servicio)
);

-- Tabla Reportes -->
CREATE TABLE Reportes(
	id_reporte INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    desc_reporte VARCHAR(50) NOT NULL,
    fec_generacion DATE NOT NULL,
    Tipo VARCHAR(10),
    Contenido VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    id_proyecto INT NOT NULL,
    id_pago INT NOT NULL,
    id_asesor INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_proyecto) REFERENCES Proyectos(id_proyecto),
    FOREIGN KEY(id_pago) REFERENCES Pago(id_pago),
    FOREIGN KEY(id_asesor) REFERENCES Asesores(id_asesor)
);

-- Tabla Visualizar Estado -->
CREATE TABLE Ver_Estado(
    id_verEstado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    estado VARCHAR(15) NOT NULL,
    id_cliente INT NOT NULL,
    id_proyecto INT NOT NULL,
    id_reporte INT NOT NULL,
    id_pago INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_proyecto) REFERENCES Proyectos(id_proyecto),
    FOREIGN KEY(id_reporte) REFERENCES Reportes(id_reporte),
    FOREIGN KEY(id_pago) REFERENCES Pago(id_pago)
);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nom_cliente, ape_cliente, dni_cliente, fn_cliente, telf_cliente, email_cliente)
VALUES
    ('Luis', 'Gómez', '23456789', '1995-06-20', '234567890', 'luis@example.com'),
    ('María', 'Martínez', '34567890', '1998-09-12', '345678901', 'maria@example.com'),
    ('Carlos', 'Sánchez', '45678901', '1993-03-05', '456789012', 'carlos@example.com'),
    ('Ana', 'Rodríguez', '56789012', '1990-11-30', '567890123', 'ana@example.com'),
    ('Pedro', 'López', '67890123', '1987-02-15', '678901234', 'pedro@example.com'),
    ('Laura', 'García', '78901234', '1989-07-08', '789012345', 'laura@example.com'),
    ('Miguel', 'Pérez', '89012345', '1991-04-22', '890123456', 'miguel@example.com');

-- Insertar datos en la tabla Asesores
INSERT INTO Asesores (nom_asesor, ape_asesor, dni_asesor, fn_asesor, telf_asesor, email_asesor)
VALUES
    ('Sofía', 'Gómez', '12345678', '1985-08-10', '123456789', 'sofia@example.com'),
    ('Manuel', 'Pérez', '23456789', '1978-07-22', '234567890', 'manuel@example.com'),
    ('Laura', 'Martínez', '34567890', '1992-02-18', '345678901', 'laura@example.com'),
    ('Carlos', 'López', '45678901', '1993-11-07', '456789012', 'carlos@example.com'),
    ('Ana', 'Ramírez', '56789012', '1989-06-12', '567890123', 'ana@example.com'),
    ('Luis', 'García', '67890123', '1991-09-25', '678901234', 'luis@example.com'),
    ('Marta', 'Hernández', '78901234', '1987-03-30', '789012345', 'marta@example.com');

-- Insertar datos en la tabla Jefe_Proyectos
INSERT INTO Jefe_Proyectos (nom_gerente, ape_gerente, dni_gerente, fn_gerente, telf_gerente, email_gerente)
VALUES
    ('Pedro', 'Martínez', '34567890', '1980-02-12', '345678901', 'pedro@example.com'),
    ('Sofía', 'Ramírez', '56789012', '1975-11-25', '567890123', 'sofia@example.com'),
    ('Miguel', 'Gómez', '12345678', '1979-10-18', '123456789', 'miguel@example.com'),
    ('Ana', 'López', '23456789', '1983-04-07', '234567890', 'ana@example.com'),
    ('Luis', 'Hernández', '34567890', '1988-12-15', '345678901', 'luis@example.com'),
    ('María', 'Pérez', '45678901', '1977-09-22', '456789012', 'maria@example.com'),
    ('Carlos', 'García', '56789012', '1984-06-30', '567890123', 'carlos@example.com');

-- Insertar datos en la tabla Proyectos
INSERT INTO Proyectos (id_cliente, id_asesor, empresa, ruc, inf_proyecto)
VALUES
    (3, 1, 'Empresa C', '34567890123', 'Descripción del proyecto C'),
    (1, 2, 'Empresa A', '12345678901', 'Descripción del proyecto A'),
    (2, 1, 'Empresa B', '23456789012', 'Descripción del proyecto B'),
    (1, 2, 'Empresa A', '12345678901', 'Descripción del proyecto A'),
    (3, 2, 'Empresa C', '34567890123', 'Descripción del proyecto C'),
    (2, 1, 'Empresa B', '23456789012', 'Descripción del proyecto B'),
    (1, 2, 'Empresa A', '12345678901', 'Descripción del proyecto A');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nom_empleado, ape_empleado, dni_empleado, telf_empleado, email_empleado)
VALUES
    ('Carlos', 'Gómez', '67890123', '678901234', 'carlos@example.com'),
    ('Laura', 'Martínez', '78901234', '789012345', 'laura@example.com'),
    ('Miguel', 'López', '89012345', '890123456', 'miguel@example.com'),
    ('Ana', 'Ramírez', '12345678', '123456789', 'ana@example.com'),
    ('Pedro', 'García', '23456789', '234567890', 'pedro@example.com'),
    ('Sofía', 'Pérez', '34567890', '345678901', 'sofia@example.com'),
    ('Manuel', 'Hernández', '45678901', '456789012', 'manuel@example.com');

-- Insertar datos en la tabla Historial_proyectos
INSERT INTO Historial_proyectos (fec_inicio, fec_fin, id_cliente, id_empleado)
VALUES
    ('2022-05-01', '2022-06-15', 3, 3),
    ('2022-07-01', '2022-08-15', 1, 2),
    ('2022-08-20', '2022-09-30', 2, 4),
    ('2022-10-10', '2022-11-25', 1, 3),
    ('2022-12-01', '2023-01-15', 3, 2),
    ('2023-02-01', '2023-03-20', 2, 1),
    ('2023-04-01', '2023-05-10', 1, 4);

-- Insertar datos en la tabla Cotización
INSERT INTO Cotización (costo, rubro, concepto, importeTotal, Pagoxhoras)
VALUES
    ('2000', 'Consultoría', 'Servicio de consultoría', 1600.00, 100.00),
    ('1800', 'Desarrollo', 'Desarrollo de software', 1440.00, 90.00),
    ('1500', 'Desarrollo', 'Desarrollo de aplicación móvil', 1200.00, 75.00),
    ('1200', 'Consultoría', 'Asesoramiento estratégico', 960.00, 60.00),
    ('2200', 'Desarrollo', 'Desarrollo de plataforma web', 1760.00, 110.00),
    ('2500', 'Consultoría', 'Evaluación de procesos', 2000.00, 125.00),
    ('3000', 'Desarrollo', 'Desarrollo de sistema de gestión', 2400.00, 150.00);

-- Insertar datos en la tabla Pago
INSERT INTO Pago (fecha_pago, monto, comprobante, Estado, id_cliente, id_cotización)
VALUES
    ('2022-07-15', 1600.00, 'Pago003', 'Pendiente', 3, 3),
    ('2022-08-30', 1440.00, 'Pago004', 'Pagado', 1, 4),
    ('2022-09-20', 1200.00, 'Pago005', 'Pagado', 2, 5),
    ('2022-10-05', 960.00, 'Pago006', 'Pendiente', 1, 6),
    ('2022-11-10', 1760.00, 'Pago007', 'Pagado', 3, 7),
    ('2022-12-25', 2000.00, 'Pago008', 'Pendiente', 2, 1),
    ('2023-01-15', 2400.00, 'Pago009', 'Pagado', 1, 2);

-- Insertar datos en la tabla Reportes
INSERT INTO Reportes (desc_reporte, fec_generacion, Tipo, Contenido, id_cliente, id_proyecto, id_pago, id_asesor)
VALUES
    ('Reporte C', '2022-09-01', 'Información', 'Contenido del reporte C', 3, 4, 3, 1),
    ('Reporte D', '2022-10-01', 'Resumen', 'Contenido del reporte D', 1, 2, 4, 2),
    ('Reporte E', '2022-11-01', 'Información', 'Contenido del reporte E', 2, 1, 5, 1),
    ('Reporte F', '2022-12-01', 'Resumen', 'Contenido del reporte F', 1, 3, 6, 2),
    ('Reporte G', '2023-01-01', 'Información', 'Contenido del reporte G', 3, 2, 7, 1),
    ('Reporte H', '2023-02-01', 'Resumen', 'Contenido del reporte H', 2, 4, 1, 2),
    ('Reporte I', '2023-03-01', 'Información', 'Contenido del reporte I', 1, 1, 2, 1);

-- Insertar datos en la tabla Ver_Estado
INSERT INTO Ver_Estado (estado, id_cliente, id_proyecto, id_reporte, id_pago)
VALUES
    ('Activo', 3, 4, 3, 3),
    ('Inactivo', 1, 2, 4, 4),
    ('Activo', 2, 1, 5, 5),
    ('Inactivo', 1, 3, 6, 6),
    ('Activo', 3, 2, 7, 7),
    ('Inactivo', 2, 4, 1, 1),
    ('Activo', 1, 1, 2, 2);

-- Visualizar datos en la tabla Reservacion
SELECT * FROM Clientes;

-- Visualizar datos en la tabla RegimenHotel
SELECT * FROM Asesores;

-- Visualizar datos en la tabla ClaseVuelo
SELECT * FROM Jefe_Proyectos;

-- Visualizar datos en la tabla Sucursales
SELECT * FROM Proyectos;

-- Visualizar datos en la tabla Hotel
SELECT * FROM Empleados;

-- Visualizar datos en la tabla Turista
SELECT * FROM Historial_proyectos;

-- Visualizar datos en la tabla Vuelo
SELECT * FROM Cotización;

SELECT * FROM Pago;

SELECT * FROM Reportes;

SELECT * FROM Ver_Estado;






