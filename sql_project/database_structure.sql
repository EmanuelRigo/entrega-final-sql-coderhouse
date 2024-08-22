-- BORRAMOS DB POR SI EXISTE 
DROP DATABASE IF EXISTS laboratorio_coderhouse;

-- CREAMOS DB
CREATE DATABASE laboratorio_coderhouse;

-- USAMOS LA DB
USE laboratorio_coderhouse;

-- CREACION DE TABLAS

CREATE TABLE 
	dueño (
		dni INT PRIMARY KEY NOT NULL,
		nombre VARCHAR(80),
		apellido VARCHAR(80)
	)

CREATE TABLE 
	laboratorio (
		id_laboratorio INT PRIMARY KEY AUTO_INCREMENT,
		ubicacion VARCHAR(100),
		id_dueño INT,
		resultado
	);

CREATE TABLE
	bioquimico (
		dni INT PRIMARY KEY NOT NULL,
		nombre VARCHAR(80) NOT NULL,
		apellido VARCHAR(80) NULL,
		fecha_de_nacimiento DATETIME,
		telefono INT,
		matricula INT NOT NULL UNIQUE
	)


	
-- TABLA DIRECTOR
CREATE TABLE 
	DIRECTOR (
		id_director INT PRIMARY KEY AUTO_INCREMENT,
		nombre VARCHAR (100),
		apellido VARCHAR (100),
		nacimiento DATETIME,
		id_oscar INT COMMENT 'un director puede tener un oscar a mejor actor'
	);
	
-- TABLA OSCAR
CREATE TABLE 
	OSCAR(
		id_oscar INT PRIMARY KEY AUTO_INCREMENT,
		edicion DATETIME NOT NULL COMMENT 'año en que se entrego el oscar',
		id_pelicula INT NOT NULL,
		tipo ENUM("mejor_pelicula","mejor_director","mejor_actor","mejor_actriz") NOT NULL,
        FOREIGN KEY (id_pelicula) REFERENCES PELICULA (id_pelicula)
	);

-- TABLA PAIS
CREATE TABLE 
	PAIS (
		cod_pais VARCHAR (3) PRIMARY KEY NOT NULL,
		nombre VARCHAR (100) NOT NULL,
		name VARCHAR (100),
		continente VARCHAR (50)
	);

-- TABLA DIRECTOR_PELICULA para relacion muchos a muchos entre DIRECTOR y PELICULA
CREATE TABLE DIRECTOR_PELICULA (
    id_director INT,
    id_pelicula INT,
    PRIMARY KEY (id_director, id_pelicula),
    FOREIGN KEY (id_director) REFERENCES DIRECTOR (id_director),
    FOREIGN KEY (id_pelicula) REFERENCES PELICULA (id_pelicula)
);

-- TABLA ACTOR_PELICULA para relacion muchos a muchos entre ACTOR_ACTRIZ y PELICULA
CREATE TABLE ACTOR_PELICULA (
    id_actor INT,
    id_pelicula INT,
    PRIMARY KEY (id_actor, id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES ACTOR_ACTRIZ (id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES PELICULA (id_pelicula)
);


-- -- TABLA MEJORES_ACTORES
-- CREATE TABLE MEJORES_ACTORES (
--     id_actor INT PRIMARY KEY,
--     nombre VARCHAR(50) NOT NULL,
--     apellido VARCHAR(100) NOT NULL,
--     nacimiento DATETIME,
--     id_pelicula INT NOT NULL,
--     id_oscar INT NOT NULL,
--     fecha_de_oscar DATETIME,
--     FOREIGN KEY (id_actor) REFERENCES ACTOR_ACTRIZ (id_actor),
--     FOREIGN KEY (id_pelicula) REFERENCES PELICULA (id_pelicula)
-- );

CREATE TABLE TOP_5_PELICULAS (
    id_pelicula INT PRIMARY KEY,
    total_premios INT
);

ALTER TABLE PELICULA
	ADD CONSTRAINT fk_pelicula_oscar FOREIGN KEY 
	(id_oscar) REFERENCES OSCAR (id_oscar),
	ADD CONSTRAINT fk_pelicula_estudio FOREIGN KEY 
	(id_estudio) REFERENCES ESTUDIO (id_estudio),
	ADD CONSTRAINT cod_pais FOREIGN KEY
	(cod_pais) REFERENCES PAIS (cod_pais);


ALTER TABLE ACTOR_ACTRIZ 
    ADD CONSTRAINT fk_act_oscar FOREIGN KEY
    (id_oscar) REFERENCES OSCAR (id_oscar),
    ADD CONSTRAINT fk_act_pais FOREIGN KEY 
    (cod_pais) REFERENCES PAIS (cod_pais);

ALTER TABLE DIRECTOR 
    ADD CONSTRAINT fk_dire_oscar FOREIGN KEY
    (id_oscar) REFERENCES OSCAR (id_oscar);

ALTER TABLE DIRECTOR_PELICULA 
    ADD CONSTRAINT fk_dir FOREIGN KEY
    (id_director) REFERENCES DIRECTOR (id_director),
    ADD CONSTRAINT fk_pel FOREIGN KEY 
    (id_pelicula) REFERENCES PELICULA (id_pelicula);

ALTER TABLE ACTOR_PELICULA
    ADD CONSTRAINT fk_act FOREIGN KEY
    (id_actor) REFERENCES ACTOR_ACTRIZ (id_actor),
    ADD CONSTRAINT fk_peli FOREIGN KEY 
    (id_pelicula) REFERENCES PELICULA (id_pelicula);

ALTER TABLE TOP_5_PELICULAS ADD COLUMN nombre_pelicula VARCHAR(255);


CREATE USER 'emanuel_rigo'@'%' IDENTIFIED BY 'emanuel1234'
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

GRANT ALL PRIVILEGES ON *.* TO 'emanuel_rigo'@'%' WITH GRANT OPTION;

