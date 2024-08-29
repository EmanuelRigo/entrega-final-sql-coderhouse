# Laboratorio Coderhouse

## Introducción

Diseñado para optimizar la gestión de turnos, estudios, personal y resultados de pacientes. Este sistema es utilizado por diversos roles dentro del laboratorio, como dueños, recepcionistas, técnicos y bioquímicos, cada uno con diferentes niveles de acceso y permisos sobre la base de datos.

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

![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/Diagrama_Dbeaver.png)

## Diagrama de Draw.io

![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/Diagrama_drawio.png)

# Listado de Tablas con Descripción de Estructura

### 1. Tabla: `dueño`

- **dni**: INT, PRIMARY KEY, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), Nombre del dueño
- **apellido**: VARCHAR(80), Apellido del dueño

### 2. Tabla: `laboratorio`

- **id_laboratorio**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del laboratorio
- **sucursal**: VARCHAR(30), UNIQUE, Nombre de la sucursal
- **id_dueño**: INT, NOT NULL, DEFAULT 15421745, FOREIGN KEY, DNI del dueño del laboratorio
- **telefono**: VARCHAR(15), Teléfono de contacto del laboratorio

### 3. Tabla: `bioquimico`

- **legajo**: INT, PRIMARY KEY, Identificador del bioquímico
- **dni**: INT, NOT NULL, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), NOT NULL, Nombre del bioquímico
- **apellido**: VARCHAR(80), Apellido del bioquímico
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del bioquímico
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde trabaja
- **matricula**: INT, UNIQUE, NOT NULL, Número de matrícula profesional
- **email**: VARCHAR(100), Correo electrónico

### 4. Tabla: `tecnico`

- **legajo**: INT, PRIMARY KEY, Identificador del técnico
- **dni**: INT, UNIQUE, NOT NULL, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), NOT NULL, Nombre del técnico
- **apellido**: VARCHAR(80), Apellido del técnico
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del técnico
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde trabaja
- **matricula**: INT, UNIQUE, NOT NULL, Número de matrícula profesional
- **email**: VARCHAR(100), Correo electrónico

### 5. Tabla: `recepcionista`

- **legajo**: INT, PRIMARY KEY, Identificador del recepcionista
- **dni**: INT, UNIQUE, NOT NULL, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), NOT NULL, Nombre del recepcionista
- **apellido**: VARCHAR(80), Apellido del recepcionista
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde trabaja
- **telefono**: VARCHAR(15), Teléfono del recepcionista
- **email**: VARCHAR(100), Correo electrónico

### 6. Tabla: `estudio`

- **nombre**: VARCHAR(80), PRIMARY KEY, Nombre del estudio
- **precio**: INT, NOT NULL, Precio del estudio

### 7. Tabla: `paciente`

- **dni**: INT, PRIMARY KEY, Documento Nacional de Identidad
- **nombre**: VARCHAR(80), Nombre del paciente
- **apellido**: VARCHAR(80), Apellido del paciente
- **fecha_de_nacimiento**: DATE, Fecha de nacimiento
- **telefono**: VARCHAR(15), Teléfono del paciente
- **domicilio**: VARCHAR(150), Dirección del paciente
- **email**: VARCHAR(80), Correo electrónico

### 8. Tabla: `personal`

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

### 9. Tabla: `talon`

- **numero_talon**: INT, PRIMARY KEY, AUTO_INCREMENT, Número del talon
- **id_turno**: INT, NOT NULL, FOREIGN KEY, Identificador del turno
- **id_laboratorio**: INT, NOT NULL, FOREIGN KEY, Identificador del laboratorio
- **id_recepcionista**: INT, NOT NULL, FOREIGN KEY, Identificador del recepcionista
- **id_pago**: INT, NOT NULL, FOREIGN KEY, Identificador del pago

### 10. Tabla: `resultado`

- **id_resultado**: VARCHAR(105), PRIMARY KEY, Identificador del resultado
- **sucursal**: ENUM('Flores', 'San Justo', 'Caballito'), Sucursal donde se generó el resultado
- **completo**: BOOLEAN, DEFAULT FALSE, Estado del resultado (completo o no)
- **id_bioquimico**: INT, FOREIGN KEY, Identificador del bioquímico
- **id_tecnico**: INT, Identificador del técnico
- **fecha_creacion**: DATETIME, DEFAULT CURRENT_TIMESTAMP, Fecha de creación del resultado

### 11. Tabla: `pago`

- **id_pago**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del pago
- **precio**: INT, NOT NULL, Precio del pago
- **tipo**: ENUM('tarjeta debito', 'billetera virtual', 'efectivo'), Tipo de pago
- **fecha_de_pago**: DATETIME, DEFAULT CURRENT_TIMESTAMP, Fecha de pago

### 12. Tabla: `turno`

- **id_turno**: INT, PRIMARY KEY, AUTO_INCREMENT, Identificador del turno
- **fecha_y_hora**: DATETIME, NOT NULL, Fecha y hora del turno
- **dni_paciente**: INT, NOT NULL, FOREIGN KEY, DNI del paciente
- **id_tecnico**: INT, NOT NULL, FOREIGN KEY, Identificador del técnico

### 13. Tabla: `turno_estudio`

- **estudio**: VARCHAR(80), NOT NULL, FOREIGN KEY, Nombre del estudio
- **id_turno**: INT, NOT NULL, FOREIGN KEY, Identificador del turno
- **turno_estudio**: VARCHAR(105), PRIMARY KEY, Identificador compuesto de turno y estudio

---

### Foreign Keys y tablas de muchos a muchos

- `laboratorio`: tiene una clave foránea hacia la tabla `dueño`.
- `resultado` está relacionada con las tablas `bioquimico` y `turno_estudio`.
- `talon` está relacionada con las tablas `laboratorio`, `turno`, `recepcionista` y `pago`.
- `turno` está relacionada con las tablas `paciente` y `tecnico`.
- `personal` tiene una clave foránea hacia la tabla `laboratorio`.
-
- `turno_estudio` crea una relación de muchos a muchos entre las tablas `turno` y `estudio`.

## Explicación de vistas, store procedures, funciones y triggers

### Vistas

1. **Vista: `turnos_pendientes`**

   - Muestra todos los turnos que no tienen un resultado completo o que no tienen un resultado asociado (pendientes).

2. **Vista: `pagos_por_tipo_y_fecha`**

   - Proporciona un resumen de los pagos realizados agrupados por fecha y tipo de pago, mostrando la cantidad de pagos y el total pagado por cada combinación.

3. **Vista: `detalles_pacientes_estudios_completos`**

   - Muestra los detalles de los estudios realizados a pacientes cuyos resultados están completos.

4. **Vista: `detalles_pacientes_estudios`**

   - Ofrece un detalle completo de los estudios realizados a pacientes, indicando si el resultado está completo o incompleto.

5. **Vista: `turnos_sin_resultado`**
   - Lista todos los turnos que aún no tienen un resultado asociado.

### Store Procedure

1. **Store Procedure: `crear_talon`**

   - **Propósito**: Crear un talón de estudio para un paciente. Verifica la existencia de laboratorio, recepcionista, paciente y técnico antes de crear registros en las tablas `pago`, `turno`, y `talon`. Luego, procesa los estudios asociados y calcula el precio total.

2. **Store Procedure: `generar_resultado`**
   - **Propósito**: Generar un resultado para un estudio basado en un turno de estudio específico. Inserta un nuevo registro en la tabla `resultado` si el turno de estudio existe; de lo contrario, devuelve un mensaje de error.
   -

### Funciones

1. **Función: `obtener_ultimo_resultado`**

   - **Propósito**: Obtener el ID del último resultado de laboratorio para un paciente específico. Utiliza el DNI del paciente para buscar el resultado más reciente basado en la fecha del turno.

2. **Función: `total_estudios_bioquimico`**

   - **Propósito**: Contar el número total de estudios realizados por un bioquímico específico. Utiliza el legajo del bioquímico para contar los registros en la tabla `resultado` asociados a ese bioquímico.

3. **Función: `laboratorio_que_mas_facturo`**
   - **Propósito**: Determinar el nombre del laboratorio que más ha facturado. Calcula la facturación total para cada laboratorio y retorna el nombre del laboratorio con la mayor facturación.

### Triggers

1. **Trigger: `before_insert_bioquimico`**

   - **Propósito**: Antes de insertar un nuevo registro en la tabla `bioquimico`, inserta automáticamente un registro en la tabla `personal` con información relacionada. Luego, actualiza el campo `legajo` en `bioquimico` con el ID recién insertado en `personal`.

2. **Trigger: `before_insert_tecnico`**

   - **Propósito**: Antes de insertar un nuevo registro en la tabla `tecnico`, inserta automáticamente un registro en la tabla `personal` con información relacionada. Luego, actualiza el campo `legajo` en `tecnico` con el ID recién insertado en `personal`.

3. **Trigger: `before_insert_recepcionista`**

   - **Propósito**: Antes de insertar un nuevo registro en la tabla `recepcionista`, inserta automáticamente un registro en la tabla `personal` con información relacionada. Luego, actualiza el campo `legajo` en `recepcionista` con el ID recién insertado en `personal`.

4. **Trigger: `before_insert_turno_estudio`**

   - **Propósito**: Antes de insertar un nuevo registro en la tabla `turno_estudio`, genera un valor para el campo `turno_estudio` concatenando el `id_turno` y `estudio`. Este valor único se utiliza para identificar de manera específica cada estudio realizado durante un turno.

5. **Trigger: `after_insert_turno_estudio`** (Comentado)
   - **Propósito**: Después de insertar un nuevo registro en la tabla `turno_estudio`, este trigger se utilizaría para insertar automáticamente un nuevo registro en la tabla `resultado` con el `id_resultado` correspondiente. Este trigger se ha comentado en el código actual y no está en uso ya que lo resolvi de otra manera, el tecnico ahora se encarga de cargaar el resultado.

## Scripts de creación de cada objeto de la base de datos (opcion 1 consola).

- #### En Github precionar en codespaces y luego en el simbolo de mas
  ![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/paso%201.png)
- #### Luego en Codespaces; didactic doodle

  ![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/paso%202.png)

- #### Luego en open in VS Descktop

  ![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/paso%203.png)

- #### Una ves abierto VS y aceptado los permisos en la terminal escribir `docker compose up`

  ![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/paso%204.png)

- #### Luego abrir otra termial bash y colocar `make` para que se ejecute el makefile

  ![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/paso%204.png)

- #### Luego abrir DBeaver y generar una nueva coneccion mysql con la contraseña `Faber37`
  ![DER-Wi-Fly-correcto.jpg](https://raw.githubusercontent.com/EmanuelRigo/entrega-final-sql-coderhouse/main/images/paso%206.png)

# _Ya esta creada la base de datos_

### Correr con Bash

En la terminal

- `make` levantar toda la base
- `make test-db` ver tablas.
- `make access-db` acceder a la base de datos.
- `make backup` realizar back-up.

### En caso de este error

- `1` el port puede ser el 3307
- `2` colocar allowPublicKeyRetrieval en `true`

## Scripts de creación de cada objeto de la base de datos (opcion 2 manual).

- `1`: Crear la estructura ejecutando en Dbeaver el archivo database_structure.sql.

- `2`: Ejecutar en Dbeaver el contenido de la carpeta database_objects, donde se encuentran los archivos con stored_procedures, triggers, vistas, funciones.

### Scripts de inserción de datos.

- `3`: Ejecutar los insert del archivo population.sql que se encuentra en la carpeta data e insertar los csv de la carpeta data a traves de `import data` en las tablas paciente y estudio.

## Informes generados en base a la información de la base

## Herramientas y tecnologías usadas

- **DBeaver**
- **Drawio**
- **Visual Studio Code**
- **GitHub**
-

## Futuras líneas.
