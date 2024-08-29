-- VIEWS 

USE lab_coder;

-- VIEW PARA VER LOS TURNOS PENDIENTES
CREATE VIEW turnos_pendientes AS
SELECT 
    t.id_turno,
    t.fecha_y_hora,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    e.nombre AS nombre_estudio,
    tec.nombre AS nombre_tecnico,
    tec.apellido AS apellido_tecnico,
    r.completo AS resultado_completo
FROM 
    turno t
JOIN 
    turno_estudio te ON t.id_turno = te.id_turno
JOIN 
    paciente p ON t.dni_paciente = p.dni
JOIN 
    estudio e ON te.estudio = e.nombre
LEFT JOIN 
    resultado r ON te.turno_estudio = r.id_resultado
JOIN 
    tecnico tec ON t.id_tecnico = tec.legajo
WHERE 
    r.completo = FALSE OR r.completo IS NULL;



-- VIEW PARA VER LOS PAGOS(ROLE duenio)
   
CREATE VIEW pagos_por_tipo_y_fecha AS
SELECT 
    p.fecha_de_pago,
    p.tipo AS tipo_pago,
    COUNT(p.id_pago) AS cantidad_pagos,
    SUM(p.precio) AS total_pagado
FROM 
    pago p
GROUP BY 
    p.fecha_de_pago, p.tipo
ORDER BY 
    p.fecha_de_pago DESC, p.tipo;



   
 CREATE VIEW detalles_pacientes_estudios_completos AS
SELECT 
    p.dni AS dni_paciente,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    p.telefono AS telefono_paciente,
    t.fecha_y_hora AS fecha_turno,
    e.nombre AS nombre_estudio,
    r.id_resultado
FROM 
    paciente p
JOIN 
    turno t ON p.dni = t.dni_paciente
JOIN 
    turno_estudio te ON t.id_turno = te.id_turno
JOIN 
    estudio e ON te.estudio = e.nombre
LEFT JOIN 
    resultado r ON r.id_resultado = t.id_turno
WHERE 
    r.completo = TRUE;

  

 -- VIEW PARA VER LOS ESTUDIOS QUE SE HICIERON LOS PACIENTES

   CREATE OR REPLACE VIEW detalles_pacientes_estudios AS
SELECT 
    p.dni AS dni_paciente,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    p.telefono AS telefono_paciente,
    t.fecha_y_hora AS fecha_turno,
    e.nombre AS nombre_estudio,
    r.id_resultado,
    IF(r.completo = TRUE, 'Completo', 'Incompleto') AS estado_resultado
FROM 
    paciente p
JOIN 
    turno t ON p.dni = t.dni_paciente
JOIN 
    turno_estudio te ON t.id_turno = te.id_turno
JOIN 
    estudio e ON te.estudio = e.nombre
LEFT JOIN 
    resultado r ON r.id_resultado = te.turno_estudio;

select * from detalles_pacientes_estudios;

select * from pagos_por_tipo_y_fecha;
  

-- VIEW PARA VER LOS TURNOS SIN RESULTADO

CREATE VIEW turnos_sin_resultado AS
SELECT 
    t.id_turno,
    t.fecha_y_hora,
    p.dni AS dni_paciente,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente
FROM 
    turno t
JOIN 
    paciente p ON t.dni_paciente = p.dni
LEFT JOIN 
    resultado r ON t.id_turno = r.id_resultado
WHERE 
    r.id_resultado IS NULL;
   
-- select * from turnos_sin_resultado;

   


