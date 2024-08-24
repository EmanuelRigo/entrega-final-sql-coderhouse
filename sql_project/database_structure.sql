-- BORRAMOS DB POR SI EXISTE 
DROP DATABASE IF EXISTS laboratorio_coderhouse;

-- CREAMOS DB
CREATE DATABASE laboratorio_coderhouse;

-- USAMOS LA DB
USE laboratorio_coderhouse;



-- CREACION DE TABLAS

-- TABLAS DIMENCIONALES
CREATE TABLE 
	dueño (
		dni INT PRIMARY KEY NOT NULL,
		nombre VARCHAR(80),
		apellido VARCHAR(80)
	);

CREATE TABLE 
	laboratorio (
		id_laboratorio INT PRIMARY KEY AUTO_INCREMENT,
		ubicacion VARCHAR(30) UNIQUE,
		id_dueño INT NOT NULL DEFAULT 15421745,
		telefono VARCHAR(15)
	);

CREATE TABLE
	bioquimico (
		legajo INT PRIMARY KEY,
		dni INT NOT NULL,
		nombre VARCHAR(80) NOT NULL,
		apellido VARCHAR(80) NULL,
		fecha_de_nacimiento DATE,
		telefono VARCHAR(15),
		ubicacion ENUM ('Flores', 'San Justo', 'Caballito'),
		matricula INT PRIMARY KEY 
	);

CREATE TABLE
	tecnico (
		legajo INT PRIMARY KEY,
		dni INT UNIQUE NOT NULL,
		nombre VARCHAR(80) NOT NULL,
		apellido VARCHAR(80) NULL,
		fecha_de_nacimiento DATE,
		telefono VARCHAR(15),
		ubicacion ENUM ('Flores', 'San Justo', 'Caballito'),
		matricula INT NOT NULL UNIQUE
	);

CREATE TABLE
	recepcionista (
		legajo INT PRIMARY KEY,
		dni INT UNIQUE NOT NULL,
		nombre VARCHAR(80) NOT NULL,
		apellido VARCHAR(80) NULL,
		fecha_de_nacimiento DATE,
		ubicacion ENUM ('Flores', 'San Justo', 'Caballito'),
		telefono VARCHAR(15)
	);

CREATE TABLE
	estudio (
		nombre VARCHAR(80) PRIMARY KEY,
		precio INT NOT NULL
	);

CREATE TABLE
	paciente (
		dni INT PRIMARY KEY,
		nombre VARCHAR(80),
		apellido VARCHAR(80),
		fecha_de_nacimiento DATE,
		telefono VARCHAR(15),
		domicilio VARCHAR(150),
		email VARCHAR(80)
	);

CREATE TABLE 
	personal (
		legajo INT NOT NULL UNIQUE,
		nombre VARCHAR(80),
		apellido VARCHAR(80),
		fecha_de_nacimiento DATE,
		telefono VARCHAR(15),
		domicilio VARCHAR(60),
		email VARCHAR(50),
		dni INT UNIQUE,
		sucursal VARCHAR(30),
		puesto VARCHAR (40)
	);

-- TABLAS DE HECHOS

CREATE TABLE
	talon (
		id_turno INT NOT NULL,
		id_laboratorio INT NOT NULL,
		id_recepcionista INT NOT NULL,
		id_pago INT NOT NULL
	);

CREATE TABLE 
	resultado (
		id_resultado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		ubicacion ENUM ('Flores', 'San Justo', 'Caballito'),
		completo BOOLEAN DEFAULT FALSE,
		id_bioquimico INT NOT NULL
	);

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    precio INT NOT NULL,
    tipo ENUM('tarjeta debito', 'billetera virtual', 'efectivo'), 
	fecha_de_pago DATETIME DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE
	turno (
		id_turno INT AUTO_INCREMENT PRIMARY KEY,
		fecha_y_hora DATETIME NOT NULL,
		dni_paciente INT NOT NULL,
		estudio VARCHAR(80),
		resultado INT,
		id_tecnico INT NOT NULL
	);


-- TABLAS DE MUCHOS A MUCHOS

CREATE TABLE
	turno_estudio (
		estudio VARCHAR(80) NOT NULL,
		id_turno INT NOT NULL,
		PRIMARY KEY (id_turno, estudio),
		FOREIGN KEY (id_turno) REFERENCES turno(id_turno),
    	FOREIGN KEY (estudio) REFERENCES estudio(nombre)
	);

-- AGREGANDO FOREIGN KEY

ALTER TABLE laboratorio
	ADD CONSTRAINT fk_dueño FOREIGN KEY 
	(id_dueño) REFERENCES dueño (dni);

ALTER TABLE resultado
	ADD CONSTRAINT fk_bioquimico FOREIGN KEY
	(id_bioquimico) REFERENCES bioquimico(matricula);

ALTER TABLE talon
	ADD CONSTRAINT fk_laboratorio FOREIGN KEY
	(id_laboratorio) REFERENCES laboratorio(id_laboratorio),
	ADD CONSTRAINT fk_turno FOREIGN KEY
	(id_turno) REFERENCES turno (id_turno),
	ADD CONSTRAINT fk_recepcionista FOREIGN KEY
	(id_recepcionista) REFERENCES recepcionista (legajo),
	ADD CONSTRAINT fk_pago FOREIGN KEY
	(id_pago) REFERENCES pago (id_pago);

ALTER TABLE turno
	ADD CONSTRAINT fk_paciente FOREIGN KEY
	(dni_paciente) REFERENCES paciente(dni),
	ADD CONSTRAINT fk_tecnico FOREIGN KEY
	(id_tecnico) REFERENCES tecnico(legajo),
	ADD CONSTRAINT fk_resultado FOREIGN KEY
	(resultado) REFERENCES resultado(id_resultado)
	;

ALTER TABLE personal
	ADD CONSTRAINT fk_sucursal FOREIGN KEY
	(sucursal) REFERENCES laboratorio(ubicacion);

