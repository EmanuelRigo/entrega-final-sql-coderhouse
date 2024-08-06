USE peliculas_coderhouse;

-- Stored_procedures

-- actualizar un actor cuando gana un oscar

DROP PROCEDURE IF EXISTS actualizar_actor_oscar

DELIMITER //

CREATE PROCEDURE actualizar_actor_oscar(
    IN p_id_actor INT,
    IN p_id_oscar INT
)
BEGIN
    UPDATE ACTOR_ACTRIZ
    SET id_oscar = p_id_oscar
    WHERE id_actor = p_id_actor;
END //

DELIMITER ;

-- crear un pelicula

DROP PROCEUDRE IF EXISTS crear_pelicula

DELIMITER //

CREATE PROCEDURE crear_pelicula(
    IN p_nombre VARCHAR(150),
    IN p_estreno DATETIME,
    IN p_genero VARCHAR(60),
    IN p_id_estudio INT,
    IN p_cod_pais INT
)
BEGIN
    INSERT INTO PELICULA (nombre, estreno, genero, id_estudio, cod_pais)
    VALUES (p_nombre, p_estreno, p_genero, p_id_estudio, p_cod_pais);
END //

DELIMITER ;

-- crear un actor pero si o si debe haber trabajado en una pelicula

DROP PROCEDURE IF EXISTS crear_actor_con_pelicula;

DELIMITER //

CREATE PROCEDURE crear_actor_con_pelicula(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(100),
    IN p_nacimiento DATETIME,
    IN p_cod_pais INT,
    IN p_id_pelicula INT
)
BEGIN
    DECLARE last_actor_id INT;
    
    INSERT INTO ACTOR_ACTRIZ (nombre, apellido, nacimiento, cod_pais)
    VALUES (p_nombre, p_apellido, p_nacimiento, p_cod_pais);
    
    SET last_actor_id = LAST_INSERT_ID();
    
    INSERT INTO ACTOR_PELICULA (id_actor, id_pelicula)
    VALUES (last_actor_id, p_id_pelicula);
END //

DELIMITER ;


