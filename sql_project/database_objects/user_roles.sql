USE laboratorio_coderhouse;

-- Crear roles
DROP ROLE IF EXISTS 'duenio';

CREATE ROLE 'duenio';
GRANT INSERT, UPDATE, DELETE ON laboratorio_coderhouse.personal TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON laboratorio_coderhouse.bioquimico TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON laboratorio_coderhouse.tecnico TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON laboratorio_coderhouse.recepcionista TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON laboratorio_coderhouse.laboratorio TO 'duenio';
GRANT EXECUTE ON FUNCTION laboratorio_coderhouse.laboratorio_que_mas_facturo TO 'duenio';

CREATE ROLE 'recepcionista';
GRANT INSERT ON laboratorio_coderhouse.talon TO 'recepcionista';
GRANT INSERT, DELETE, UPDATE ON laboratorio_coderhouse.paciente TO 'recepcionista';
GRANT SELECT ON laboratorio_coderhouse.detalles_pacientes_estudios TO 'recepcionista';
GRANT SELECT ON laboratorio_coderhouse.turnos_pendientes TO 'recepcionista';
GRANT SELECT ON laboratorio_coderhouse.pagos_por_tipo_y_fecha TO 'recepcionista';
GRANT EXECUTE ON FUNCTION laboratorio_coderhouse.obtener_ultimo_resultado TO 'recepcionista';

CREATE ROLE 'tecnico';
GRANT INSERT ON laboratorio_coderhouse.resultado TO 'tecnico';
GRANT SELECT ON laboratorio_coderhouse.turnos_sin_resultado TO 'tecnico';

CREATE ROLE 'bioquimico';
GRANT UPDATE ON laboratorio_coderhouse.resultado TO 'bioquimico';
GRANT SELECT ON laboratorio_coderhouse.detalles_pacientes_estudios TO 'bioquimico';

-- Crear usuarios
CREATE USER 'juan_duenio'@'localhost' IDENTIFIED BY 'labcoder';
CREATE USER 'recepcionista1'@'localhost' IDENTIFIED BY 'rec1';
CREATE USER 'tecnico1'@'localhost' IDENTIFIED BY 'tec1';
CREATE USER 'bioquimico1'@'localhost' IDENTIFIED BY 'bioquimico1';

-- Asignar roles a los usuarios
GRANT 'duenio' TO 'juan_duenio'@'localhost';
SET DEFAULT ROLE 'duenio' TO 'juan_duenio'@'localhost';

GRANT 'recepcionista' TO 'recepcionista1'@'localhost';
SET DEFAULT ROLE 'recepcionista' TO 'recepcionista1'@'localhost';

GRANT 'tecnico' TO 'tecnico1'@'localhost';
SET DEFAULT ROLE 'tecnico' TO 'tecnico1'@'localhost';

GRANT 'bioquimico' TO 'bioquimico1'@'localhost';
SET DEFAULT ROLE 'bioquimico' TO 'bioquimico1'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;
