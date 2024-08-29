﻿# Laboratorio Coderhouse

## Introducción

Diseñado para optimizar la gestión de turnos, estudios, personal y resultados de pacientes. Este sistema es utilizado por diversos roles dentro del laboratorio, como duenios, recepcionistas, técnicos y bioquímicos, cada uno con diferentes niveles de acceso y permisos sobre la base de datos.

## Objetivo

El objetivo principal de este sistema de base de datos es mejorar la eficiencia operativa del laboratorio, asegurando un manejo adecuado de los datos relacionados con pacientes, estudios, pagos y resultados. Además, busca proporcionar un control adecuado sobre los accesos y permisos, garantizando la seguridad y confidencialidad de la información.

Los objetivos específicos del sistema son:

- Automatizar el registro de turnos y la asignación de estudios.
- Gestionar la información de los pacientes y su historial clínico.
- Controlar los procesos de facturación y pago de los estudios realizados.
- Asegurar que cada rol dentro del laboratorio tenga acceso únicamente a la información pertinente para sus funciones.

## Situación problemática

Antes de la implementación de este sistema, el laboratorio enfrentaba varios problemas que afectaban la calidad del servicio y la eficiencia operativa:

1. **Gestión Manual de Información**: La administración de turnos, estudios y resultados se realizaba manualmente, lo que generaba errores en la transcripción y pérdida de información.
2. **Acceso a Información**: Los diferentes roles dentro del laboratorio no tenían un acceso centralizado y seguro a la información necesaria para sus funciones, lo que complicaba la toma de decisiones y la coordinación entre el personal.

3. **Falta de Seguridad en los Datos**: La ausencia de controles adecuados para el acceso a la información sensible de los pacientes generaba riesgos de privacidad y confidencialidad.

4. **Incapacidad para Generar Reportes y Estadísticas**: No existía un sistema eficiente para generar reportes sobre el rendimiento del laboratorio, los estudios realizados, y la facturación, lo cual dificultaba la planificación estratégica y el control de calidad.

## Modelo de negocio

El modelo de negocio del laboratorio se basa en la prestación de servicios clínicos, ofreciendo una variedad de estudios de laboratorio a pacientes particulares y organizaciones. El sistema de base de datos apoya este modelo al proporcionar las siguientes funcionalidades clave:

1. **Gestión de Turnos y Pacientes**: Permite la reserva y gestión de turnos de manera eficiente, asegurando que los pacientes sean atendidos oportunamente y que el personal esté debidamente informado de sus responsabilidades.

2. **Registro de Estudios y Resultados**: Automatiza el registro de los estudios realizados y los resultados obtenidos, facilitando el seguimiento del estado de los estudios y asegurando que los resultados estén disponibles para los pacientes y el personal autorizado.

3. **Control de Pagos y Facturación**: Gestiona los pagos realizados por los pacientes y genera registros de facturación que pueden ser utilizados para el control financiero del laboratorio.

4. **Seguridad y Control de Accesos**: Implementa un sistema de roles y permisos que garantiza que cada miembro del personal tenga acceso únicamente a la información necesaria para sus funciones, protegiendo así la confidencialidad de los datos sensibles.

## Diagrama en Dbeaver

![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/Diagrama_Dbeaver.png)

## Diagrama de Draw.io

![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/Diagrama_drawio.png)

# Listado de Tablas con Descripción de Estructura

## 1. Tabla: `duenio`

- **dni**: INT, PRIMARY KEY, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), Nombre del duenio
- **apellido**: VARCHAR(80), Apellido del duenio

## 2. Tabla: `laboratorio`

- **id_laboratorio**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del laboratorio
- **sucursal**: VARCHAR(30), UNIQUE, Nombre de la sucursal
- **id_duenio**: INT, NOT NULL, DEFAULT 15421745, FOREIGN KEY, DNI del duenio del laboratorio
- **telefono**: VARCHAR(15), Teléfono de contacto del laboratorio

## 3. Tabla: `bioquimico`

- **legajo**: INT, PRIMARY KEY, Identificador del bioquímico
- **dni**: INT, NOT NULL, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), NOT NULL, Nombre del bioquímico
- **apellido**: VARCHAR(80), Apellido del bioquímico
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del bioquímico
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde trabaja
- **matricula**: INT, UNIQUE, NOT NULL, Número de matrícula profesional
- **email**: VARCHAR(100), Correo electrónico

## 4. Tabla: `tecnico`

- **legajo**: INT, PRIMARY KEY, Identificador del técnico
- **dni**: INT, UNIQUE, NOT NULL, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), NOT NULL, Nombre del técnico
- **apellido**: VARCHAR(80), Apellido del técnico
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del técnico
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde trabaja
- **matricula**: INT, UNIQUE, NOT NULL, Número de matrícula profesional
- **email**: VARCHAR(100), Correo electrónico

## 5. Tabla: `recepcionista`

- **legajo**: INT, PRIMARY KEY, Identificador del recepcionista
- **dni**: INT, UNIQUE, NOT NULL, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), NOT NULL, Nombre del recepcionista
- **apellido**: VARCHAR(80), Apellido del recepcionista
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde trabaja
- **telefono**: VARCHAR(15), Teléfono del recepcionista
- **email**: VARCHAR(100), Correo electrónico

## 6. Tabla: `estudio`

- **nombre**: VARCHAR(80), PRIMARY KEY, Nombre del estudio
- **precio**: INT, NOT NULL, Precio del estudio

## 7. Tabla: `paciente`

- **dni**: INT, PRIMARY KEY, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), Nombre del paciente
- **apellido**: VARCHAR(80), Apellido del paciente
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del paciente
- **domicilio**: VARCHAR(150), Dirección del paciente
- **email**: VARCHAR(80), Correo electrónico

## 8. Tabla: `personal`

- **legajo**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del personal
- **nombre**: VARCHAR(80), Nombre del personal
- **apellido**: VARCHAR(80), Apellido del personal
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del personal
- **email**: VARCHAR(50), Correo electrónico
- **dni**: INT, UNIQUE, NOT NULL, Documento Nacional de Identidad
- **sucursal**: VARCHAR(30), Sucursal donde trabaja
- **puesto**: VARCHAR(40), Puesto de trabajo
- **matricula**: INT, Número de matrícula profesional

## 9. Tabla: `talon`

- **numero_talon**: INT, PRIMARY KEY, AUTO_INCREMENT, Número del talon
- **id_turno**: INT, NOT NULL, FOREIGN KEY, Identificador del turno
- **id_laboratorio**: INT, NOT NULL, FOREIGN KEY, Identificador del laboratorio
- **id_recepcionista**: INT, NOT NULL, FOREIGN KEY, Identificador del recepcionista
- **id_pago**: INT, NOT NULL, FOREIGN KEY, Identificador del pago

## 10. Tabla: `resultado`

- **id_resultado**: VARCHAR(105), PRIMARY KEY, Identificador del resultado
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde se generó el resultado
- **completo**: BOOLEAN, DEFAULT FALSE, Estado del resultado (completo o no)
- **id_bioquimico**: INT, FOREIGN KEY, Identificador del bioquímico
- **id_tecnico**: INT, Identificador del técnico
- **fecha_creacion**: DATETIME, DEFAULT CURRENT_TIMESTAMP, Fecha de creación del resultado

## 11. Tabla: `pago`

- **id_pago**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del pago
- **precio**: INT, NOT NULL, Precio del pago
- **tipo**: ENUM('tarjeta debito', 'billetera virtual', 'efectivo'), Tipo de pago
- **fecha_de_pago**: DATETIME, DEFAULT CURRENT_TIMESTAMP, Fecha de pago

## 12. Tabla: `turno`

- **id_turno**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del turno
- **fecha_y_hora**: DATETIME, NOT NULL, Fecha y hora del turno
- **dni_paciente**: INT, NOT NULL, FOREIGN KEY, DNI del paciente
- **id_tecnico**: INT, NOT NULL, FOREIGN KEY, Identificador del técnico

## 13. Tabla: `turno_estudio`

- **estudio**: VARCHAR(80), NOT NULL, FOREIGN KEY, Nombre del estudio
- **id_turno**: INT, NOT NULL, FOREIGN KEY, Identificador del turno
- **turno_estudio**: VARCHAR(105), PRIMARY KEY, Identificador compuesto de turno y estudio

---

## Foreign Keys y tablas de muchos a muchos

- `laboratorio`: tiene una clave foránea hacia la tabla `duenio`.
- `resultado` está relacionada con las tablas `bioquimico` y `turno_estudio`.
- `talon` está relacionada con las tablas `laboratorio`, `turno`, `recepcionista` y `pago`.
- `turno` está relacionada con las tablas `paciente` y `tecnico`.
- `personal` tiene una clave foránea hacia la tabla `laboratorio`.
-
- `turno_estudio` crea una relación de muchos a muchos entre las tablas `turno` y `estudio`.

## Scripts de creación de cada objeto de la base de datos (opcion 1 manual).

- `1`: Crear la estructura ejecutando en Dbeaver el archivo database_structure.sql.

- `2`: Ejecutar en Dbeaver el contenido de la carpeta database_objects, donde se encuentran los archivos con stored_procedures, triggers, vistas, funciones.

## Scripts de inserción de datos.

- `3`: Ejecutar el archivo population.sql que se encuentra en la carpeta data.

## Informes generados en base a la información de la base

## Herramientas y tecnologías usadas

## Futuras líneas.

### Pasos a seguir para levantar la DB

- `3`: Traer datos de los paises desde el csv, skipeando (nom, iso2 y phone_code) que no se utilizaran
- `4`: Luego ingresar uno por uno a traves de queries en este orden. pelicula -> actores -> director -> oscars
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
