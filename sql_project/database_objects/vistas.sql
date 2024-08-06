USE peliculas_coderhouse;

-- Vistas

-- vista de los actores que tienen peliculas en los 90

CREATE OR REPLACE VIEW view_actores_90 AS
    SELECT DISTINCT 
        aa.id_actor, 
        aa.nombre, 
        aa.apellido, 
        aa.nacimiento, 
        aa.cod_pais,
        p.nombre AS nombre_pelicula
    FROM ACTOR_ACTRIZ aa
    JOIN ACTOR_PELICULA ap ON aa.id_actor = ap.id_actor
    JOIN PELICULA p ON ap.id_pelicula = p.id_pelicula
    WHERE p.estreno BETWEEN '1990-01-01' AND '1999-12-31';

SELECT * FROM view_actores_90;

-- vista de las peliculas con mas Oscars

CREATE OR REPLACE VIEW view_peliculas_con_mas_oscars AS
    SELECT p.id_pelicula, p.nombre, COUNT(o.id_oscar) AS total_oscars
    FROM PELICULA p
    JOIN OSCAR o ON p.id_pelicula = o.id_pelicula
    GROUP BY p.id_pelicula, p.nombre
    ORDER BY total_oscars DESC
    LIMIT 10;

SELECT * FROM view_peliculas_con_mas_oscars;

-- vista de peliculas por pais

CREATE OR REPLACE VIEW peliculas_por_pais AS
    SELECT p.cod_pais, COUNT(p.id_pelicula) AS total_peliculas
    FROM PELICULA p
    GROUP BY p.cod_pais
    ORDER BY total_peliculas DESC;

 SELECT * FROM peliculas_por_pais; 