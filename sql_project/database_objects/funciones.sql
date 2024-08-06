USE peliculas_coderhouse;

-- Funciones 

-- funcion para saber el saber el genero donde mas trabaja un actor

DROP FUNCTION IF EXISTS actor_genero;

DELIMITER //

CREATE FUNCTION actor_genero(actor_id INT) 
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
    DECLARE genero_frecuente VARCHAR(60);
    DECLARE contador INT;

    SELECT p.genero, COUNT(*) AS contador_genero
    INTO genero_frecuente, contador
    FROM PELICULA p
    JOIN ACTOR_PELICULA ap ON p.id_pelicula = ap.id_pelicula
    WHERE ap.id_actor = actor_id
    GROUP BY p.genero
    ORDER BY contador_genero DESC
    LIMIT 1;

    RETURN genero_frecuente;
END //

DELIMITER ;



-- funcion para saber el actor que mas peliculas hiso en un año
DROP FUNCTION IF EXISTS actor_mas_peliculas;

DELIMITER //

CREATE FUNCTION actor_mas_peliculas(year INT) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE actor_nombre VARCHAR(100);
    DECLARE actor_apellido VARCHAR(100);
    DECLARE max_count INT;

    SELECT a.nombre, a.apellido, COUNT(*) AS cantidad_peliculas
    INTO actor_nombre, actor_apellido, max_count
    FROM ACTOR_ACTRIZ a
    JOIN ACTOR_PELICULA ap ON a.id_actor = ap.id_actor
    JOIN PELICULA p ON ap.id_pelicula = p.id_pelicula
    WHERE YEAR(p.estreno) = year
    GROUP BY a.id_actor
    ORDER BY cantidad_peliculas DESC
    LIMIT 1;

    IF max_count IS NULL THEN
        RETURN 'No hay peliculas este año.';
    ELSE
        RETURN CONCAT(actor_nombre, ' ', actor_apellido);
    END IF;
END //

DELIMITER ;

-- funcion para saber cual es el estudio con mejores peliculas de un año
DROP FUNCTION IF EXISTS mejor_estudio;

DELIMITER //

CREATE FUNCTION mejor_estudio()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE estudio_nombre VARCHAR(200);
    DECLARE conteo_maximo INT;

    SELECT e.nombre, COUNT(*) AS cantidad_oscars
    INTO estudio_nombre, conteo_maximo
    FROM ESTUDIO e
    JOIN PELICULA p ON e.id_estudio = p.id_estudio
    WHERE p.id_oscar IS NOT NULL
    GROUP BY e.id_estudio
    ORDER BY cantidad_oscars DESC
    LIMIT 1;

    IF conteo_maximo IS NULL THEN
        RETURN 'No hay estudios con Oscars a mejor pelicula.';
    ELSE 
        RETURN estudio_nombre;
    END IF;
END //

DELIMITER ;


