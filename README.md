# Base de Datos: `peliculas_coderhouse`

Este archivo SQL crea y estructura una base de datos llamada `peliculas_coderhouse` para almacenar información sobre películas, directores, actores, estudios, premios Oscar y países. A continuación se detallan las tablas, sus campos y las relaciones entre ellas.

en el diagrama simplificado estan conectados los oscar de mejor_actor con directores o mejor_director con actores por si sucede que
un actor dirija una pelicula o viceversa

## Tablas

### Tabla `PELICULA`

Esta tabla almacena información sobre las películas.

- `id_pelicula`: Identificador único de la película (Primary Key, Auto Increment).
- `nombre`: Nombre de la película (VARCHAR 150, Not Null).
- `estreno`: Fecha de estreno de la película (DATETIME, Default Null).
- `genero`: Género de la película (VARCHAR 60, Default 'DESCONOCIDO').
- `id_director`: Identificador del director de la película (Foreign Key, Not Null).
- `id_actor`: Identificador del actor principal de la película (Foreign Key, Not Null).
- `id_oscar`: Identificador del premio Oscar (Foreign Key).
- `id_estudio`: Identificador del estudio que produjo la película (Foreign Key, Not Null).
- `id_pais`: Identificador del país de origen de la película (Foreign Key, Not Null).

### Tabla `ESTUDIO`

Esta tabla almacena información sobre los estudios cinematográficos.

- `id_estudio`: Identificador único del estudio (Primary Key, Auto Increment).
- `nombre`: Nombre del estudio (VARCHAR 200, Not Null).
- `inicio_de_actividades`: Fecha de inicio de actividades del estudio (DATETIME, Default Null).
- `vigente`: Indica si el estudio está en funcionamiento (BOOLEAN, Default True, Not Null).

### Tabla `ACTOR_ACTRIZ`

Esta tabla almacena información sobre los actores y actrices.

- `id_actor`: Identificador único del actor/actriz (Primary Key, Auto Increment).
- `nombre`: Nombre del actor/actriz (VARCHAR 50, Not Null).
- `apellido`: Apellido del actor/actriz (VARCHAR 100, Not Null).
- `nacimiento`: Fecha de nacimiento del actor/actriz (DATETIME).
- `id_pelicula`: Identificador de la película en la que participa el actor/actriz (Foreign Key, Not Null).
- `id_oscar`: Identificador del premio Oscar (Foreign Key).
- `id_pais`: Identificador del país del actor/actriz (Foreign Key).

### Tabla `DIRECTOR`

Esta tabla almacena información sobre los directores.

- `id_director`: Identificador único del director (Primary Key, Auto Increment).
- `nombre`: Nombre del director (VARCHAR 100).
- `apellido`: Apellido del director (VARCHAR 100).
- `nacimiento`: Fecha de nacimiento del director (DATETIME).
- `id_pelicula`: Identificador de la película dirigida por el director (Foreign Key).
- `id_estudio`: Identificador del estudio asociado al director (Foreign Key).
- `id_pais`: Identificador del país del director (Foreign Key).

### Tabla `OSCAR`

Esta tabla almacena información sobre los premios Oscar.

- `id_oscar`: Identificador único del premio Oscar (Primary Key, Auto Increment).
- `edicion`: Fecha de la edición del premio (DATETIME, Not Null).
- `id_pelicula`: Identificador de la película ganadora del premio (Foreign Key, Not Null).
- `tipo`: Tipo de premio Oscar (ENUM('mejor_pelicula', 'mejor_director', 'mejor_actor', 'mejor_actriz'), Not Null).

### Tabla `PAIS`

Esta tabla almacena información sobre los países.

- `id_pais`: Identificador único del país (Primary Key, Auto Increment).
- `nombre`: Nombre del país (VARCHAR 100).
- `id_pelicula`: Identificador de la película asociada al país (Foreign Key).
- `id_actor`: Identificador del actor/actriz asociado al país (Foreign Key).
- `id_director`: Identificador del director asociado al país (Foreign Key).
- `id_oscar`: Identificador del premio Oscar asociado al país (Foreign Key).

## Relaciones

Las relaciones entre las tablas se establecen mediante claves foráneas (Foreign Keys) que aseguran la integridad referencial de los datos. A continuación se detallan las relaciones entre las tablas:

- La tabla `PELICULA` tiene relaciones con las tablas `DIRECTOR`, `ACTOR_ACTRIZ`, `OSCAR`, `ESTUDIO` y `PAIS` mediante las claves foráneas `id_director`, `id_actor`, `id_oscar`, `id_estudio` e `id_pais`, respectivamente.
- La tabla `ACTOR_ACTRIZ` tiene relaciones con las tablas `PELICULA`, `OSCAR` y `PAIS` mediante las claves foráneas `id_pelicula`, `id_oscar` e `id_pais`, respectivamente.
- La tabla `DIRECTOR` tiene relaciones con las tablas `PELICULA`, `ESTUDIO` y `PAIS` mediante las claves foráneas `id_pelicula`, `id_estudio` e `id_pais`, respectivamente.
- La tabla `OSCAR` tiene una relación con la tabla `PELICULA` mediante la clave foránea `id_pelicula`.
- La tabla `PAIS` tiene relaciones con las tablas `PELICULA`, `ACTOR_ACTRIZ`, `DIRECTOR` y `OSCAR` mediante las claves foráneas `id_pelicula`, `id_actor`, `id_director` e `id_oscar`, respectivamente.

### Pasos a seguir para levantar la DB

- `1`: Crear la estructura con database_structure.sql
- `2`: Agregar el contenido de la carpeta database_objects, donde se encuentran las funciones, stored_procedures, triggers y vistas

- `3`: Traer datos de los paises desde el csv, skipeando (nom, iso2 y phone_code) que no se utilizaran

- `4`: Luego ingresar uno por uno a traves de queries en este orden las cuales estan en population.sql. pelicula -> actores -> director -> oscars

- `5`: Hacer un check_db_objects.sql

### Vistas

- `1`: vista de actores que tengan peliculas en los 90
- `2`: vista de las peliculas con mas oscars
- `3`: vista de los paises con mas peliculas

### Funciones

- `1`: funcion para saver el actor que mas peliculas tiene un año
- `2`: funcion para saber cual es el estudio con mejores peliculas en un año

### Stored procedures

- `1`: procedimiento que actualiza un actor cuando gana un oscar
- `2`: procedimiento para crear una pelicula
- `3`: procedimiento para crear un actor pero que si o si debe haber trabajado en una pelicula

### Triggers

- `1`: trigger que actualiza la lista de las mejores 5 peliculas segun sus oscars
- `2`: trigger que suma a una tabla los mejores actores de cada año
