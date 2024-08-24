-- USAMOS LA DB
USE laboratorio_coderhouse;

-- SET GLOBAL local_infile = true;

-- LOAD DATA  LOCAL INFILE '/sql_project/data/paises.csv'
-- INTO TABLE pais
-- FIELDS TERMINATED BY ','  ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (nombre,name,cod_pais,continente);

INSERT INTO dueño 
    (dni, nombre, apellido) VALUES 
        (15421745, 'juan', 'coderhouse');

INSERT INTO laboratorio 
    (ubicacion, telefono) VALUES
        ('Flores','4477-5514'), ('San Justo','4488-2211'), ('Caballito','4487-5902');

INSERT INTO bioquimico (dni, nombre, apellido, fecha_de_nacimiento, telefono, ubicacion, matricula)
VALUES 
(23456789, 'Mariana', 'Gómez', '1985-04-12', '123456789', 'Flores', 1001),
(34567890, 'Carlos', 'López', '1978-09-23', '987654321', 'San Justo', 1002),
(45678901, 'Ana', 'Pérez', '1990-11-05', '456123789', 'Caballito', 1003),
(56789012, 'Jorge', 'Martínez', '1982-06-17', '321654987', 'Flores', 1004);

INSERT INTO tecnico (dni, nombre, apellido, fecha_de_nacimiento, telefono, ubicacion, matricula)
VALUES
(12965438, 'Carlos', 'González', '1984-06-15', '1145678901', 'Flores', 189034),
(23568123, 'María', 'López', '1991-09-20', '1156789012', 'San Justo', 290134),
(34561298, 'Juan', 'Martínez', '1987-03-12', '1167890123', 'Caballito', 453028),
(45237125, 'Laura', 'Díaz', '1982-07-07', '1178901234', 'Flores', 892715),
(56349120, 'Esteban', 'Fernández', '1990-01-28', '1189012345', 'San Justo', 162839),
(67891234, 'Gabriela', 'Pérez', '1994-05-09', '1190123456', 'Caballito', 459381),
(78901345, 'Andrés', 'Torres', '1993-10-10', '1101234567', 'Flores', 238917),
(89012456, 'Sofía', 'Ramírez', '1985-12-22', '1123456789', 'San Justo', 487029),
(90123567, 'Luis', 'Moreno', '1979-08-17', '1134567890', 'Caballito', 543710),
(10234567, 'Ana', 'Vargas', '1992-04-13', '1145678901', 'Flores', 659103),
(21345678, 'Roberto', 'Gutiérrez', '1986-11-25', '1156789012', 'San Justo', 701235),
(32456789, 'Elena', 'Sosa', '1983-03-03', '1167890123', 'Caballito', 829013),
(43567890, 'Jorge', 'Reyes', '1988-07-18', '1178901234', 'Flores', 932104),
(54678901, 'Marta', 'Castro', '1975-02-15', '1189012345', 'San Justo', 104920),
(65789012, 'Pedro', 'Ortiz', '1981-09-14', '1190123456', 'Caballito', 117832);

INSERT INTO recepcionista (dni, nombre, apellido, fecha_de_nacimiento, ubicacion, telefono)
VALUES
(30567891, 'Valeria', 'Méndez', '1989-11-14', 'Flores', '1145678901'),
(41890712, 'Camila', 'Domínguez', '1993-02-05', 'San Justo', '1156789012'),
(52345678, 'Nicolás', 'Herrera', '1985-07-19', 'Caballito', '1167890123'),
(63781234, 'Lucía', 'Gómez', '1990-04-30', 'Flores', '1178901234'),
(74890213, 'Martín', 'Sánchez', '1988-09-25', 'San Justo', '1189012345'),
(85214367, 'Romina', 'Vega', '1992-06-12', 'Caballito', '1190123456'),
(96783456, 'Diego', 'Navarro', '1987-01-08', 'Flores', '1101234567');
