USE laboratorio_coderhouse;


-- Crear roles
CREATE ROLE 'dueño';
GRANT INSERT, UPDATE, DELETE ON 
    laboratorio_coderhouse.personal, 
    laboratorio_coderhouse.bioquimico, 
    laboratorio_coderhouse.tecnico, 
    laboratorio_coderhouse.recepcionista, 
    laboratorio_coderhouse.laboratorio
        TO 'dueño';
GRANT EXECUTE ON FUNCTION 
    laboratorio_coderhouse.laboratorio_que_mas_facturo TO 'dueño';
GRANT EXECUTE ON FUNCTION 
    laboratorio_coderhouse.funcion2 TO 'dueño';
GRANT EXECUTE ON FUNCTION 
    laboratorio_coderhouse.funcion3 TO 'dueño';

CREATE ROLE 'recepcionista';
GRANT INSERT ON 
    laboratorio_coderhouse.talon 
        TO 'recepcionista';
GRANT INSERT, DELETE, UPDATE ON 
    laboratorio_coderhouse.paciente 
        TO 'recepcionista';
GRANT SELECT ON 
    laboratorio_coderhouse.detalles_pacientes_estudios,
    laboratorio_coderhouse.turnos_pendientes,
    laboratorio_coderhouse.pagos_por_tipo_y_fecha
        TO 'recepcionista';
GRANT EXECUTE ON FUNCTION 
    laboratorio_coderhouse.obtener_ultimo_resultado
        TO 'recepcionista';

CREATE ROLE 'tecnico';
GRANT INSERT ON 
    laboratorio_coderhouse.resultado 
        TO 'tecnico';
GRANT SELECT ON
    laboratorio_coderhouse.turnos_sin_resultado
        TO 'tecnico';

CREATE ROLE 'bioquimico';
GRANT UPDATE ON 
    laboratorio_coderhouse.resultado 
        TO 'bioquimico';
GRANT SELECT ON 
    laboratorio_coderhouse.detalles_pacientes_estudios 
        TO 'bioquimico';

-- Crear usuarios
CREATE USER 'juan_dueño'@'localhost' IDENTIFIED BY 'labcoder';
CREATE USER 'recepcionista1'@'localhost' IDENTIFIED BY 'rec1';
CREATE USER 'tecnico1'@'localhost' IDENTIFIED BY 'tec1';
CREATE USER 'bioquimico1'@'localhost' IDENTIFIED BY 'bioquimico1';

-- Asignar roles a los usuarios
GRANT 'dueño' TO 'juan_dueño'@'localhost';
SET DEFAULT ROLE 'dueño' TO 'juan_dueño'@'localhost';

GRANT 'recepcionista' TO 'recepcionista1'@'localhost';
SET DEFAULT ROLE 'recepcionista' TO 'recepcionista1'@'localhost';

GRANT 'tecnico' TO 'tecnico1'@'localhost';
SET DEFAULT ROLE 'tecnico' TO 'tecnico1'@'localhost';

GRANT 'bioquimico' TO 'bioquimico1'@'localhost';
SET DEFAULT ROLE 'bioquimico' TO 'bioquimico1'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;
