USE lab_coder;

-- Crear roles
DROP ROLE IF EXISTS 'duenio';
CREATE ROLE 'duenio';

GRANT INSERT, UPDATE, DELETE ON lab_coder.personal TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON lab_coder.bioquimico TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON lab_coder.tecnico TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON lab_coder.recepcionista TO 'duenio';
GRANT INSERT, UPDATE, DELETE ON lab_coder.laboratorio TO 'duenio';
GRANT EXECUTE ON FUNCTION lab_coder.laboratorio_que_mas_facturo TO 'duenio';
GRANT EXECUTE ON FUNCTION lab_coder.total_estudios_bioquimico; TO 'duenio';

DROP ROLE IF EXISTS 'recepcionista';
CREATE ROLE 'recepcionista';
GRANT INSERT ON lab_coder.talon TO 'recepcionista';
GRANT INSERT, DELETE, UPDATE ON lab_coder.paciente TO 'recepcionista';
GRANT SELECT ON lab_coder.detalles_pacientes_estudios TO 'recepcionista';
GRANT SELECT ON lab_coder.turnos_pendientes TO 'recepcionista';
GRANT SELECT ON lab_coder.pagos_por_tipo_y_fecha TO 'recepcionista';
GRANT EXECUTE ON FUNCTION lab_coder.obtener_ultimo_resultado TO 'recepcionista';

DROP ROLE IF EXISTS 'tecnico';
CREATE ROLE 'tecnico';
GRANT INSERT ON lab_coder.resultado TO 'tecnico';
GRANT SELECT ON lab_coder.turnos_sin_resultado TO 'tecnico';

DROP ROLE IF EXISTS 'bioquimico';
CREATE ROLE 'bioquimico';
GRANT UPDATE ON lab_coder.resultado TO 'bioquimico';
GRANT SELECT ON lab_coder.detalles_pacientes_estudios TO 'bioquimico';

-- Crear usuarios
DROP USER IF EXISTS 'juan_duenio'@'localhost';
DROP USER IF EXISTS 'recepcionista1'@'localhost';
DROP USER IF EXISTS 'tecnico1'@'localhost';
DROP USER IF EXISTS 'bioquimico1'@'localhost';

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
