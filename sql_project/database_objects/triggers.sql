USE peliculas_coderhouse;

-- Triggers

-- este trigger suma a una tabla aparte los mejores actores de cada año

DROP TRIGGER IF EXISTS trigger_mejor_actor;

DELIMITER //

CREATE TRIGGER trigger_mejor_actor
AFTER UPDATE ON ACTOR_ACTRIZ
FOR EACH ROW
BEGIN
    DECLARE id_pelicula INT;
    DECLARE fecha_oscar DATETIME;

    SELECT ap.id_pelicula INTO id_pelicula 
    FROM ACTOR_PELICULA ap
    WHERE ap.id_actor = NEW.id_actor
    ORDER BY ap.id_pelicula DESC LIMIT 1;

    SELECT o.edicion INTO fecha_oscar
    FROM OSCAR o
    WHERE o.id_oscar = NEW.id_oscar;

    IF NEW.id_oscar IS NOT NULL AND OLD.id_oscar IS NULL THEN
        IF NOT EXISTS (SELECT 1 FROM MEJORES_ACTORES WHERE id_actor = NEW.id_actor) THEN
            INSERT INTO MEJORES_ACTORES (id_actor, nombre, apellido, nacimiento, id_pelicula, id_oscar, fecha_de_oscar)
            VALUES (NEW.id_actor, NEW.nombre, NEW.apellido, NEW.nacimiento, id_pelicula, NEW.id_oscar, fecha_oscar);
        END IF;
    END IF;
END //

DELIMITER ;




DROP TRIGGER IF EXISTS after_oscar_insert;

DELIMITER //

CREATE TRIGGER after_oscar_insert
AFTER INSERT ON OSCAR
FOR EACH ROW
BEGIN
   
    DELETE FROM TOP_5_PELICULAS;
    INSERT INTO TOP_5_PELICULAS (id_pelicula, nombre_pelicula, total_premios)
    SELECT o.id_pelicula, p.nombre, COUNT(*) AS total_premios
    FROM OSCAR o
    JOIN PELICULA p ON o.id_pelicula = p.id_pelicula
    GROUP BY o.id_pelicula
    ORDER BY total_premios DESC
    LIMIT 5;
END //

DELIMITER ;