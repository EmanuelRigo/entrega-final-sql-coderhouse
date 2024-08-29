-- FUNCIONES

USE laboratorio_coderhouse;

-- FUNCION PARA OBTENER EL ULTIMO RESULTADO

DROP FUNCTION IF EXISTS obtener_ultimo_resultado;

DELIMITER //
CREATE FUNCTION obtener_ultimo_resultado(dni_paciente INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_resultado_id VARCHAR(50);
    
    SELECT r.id_resultado INTO v_resultado_id
    FROM resultado r
    JOIN turno_estudio te ON r.id_resultado = te.turno_estudio
    JOIN turno t ON t.id_turno = te.id_turno
    WHERE t.dni_paciente = dni_paciente
    ORDER BY t.fecha_y_hora DESC
    LIMIT 1;
    
    RETURN v_resultado_id;

END //

DELIMITER ;


-- FUNCION PARA SABER CUANTOS ESTUDIOS REALIZO UN BIOQUIMICO

DROP FUNCTION IF EXISTS total_estudios_bioquimico;
DELIMITER //

CREATE FUNCTION total_estudios_bioquimico(bioquimico_legajo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_estudios INT;

    SELECT COUNT(*) INTO total_estudios
    FROM resultado r
    WHERE r.id_bioquimico = bioquimico_legajo;

    RETURN total_estudios;
END //

DELIMITER ;


-- FUNCION PARA SABER CUAL FUE EL LABORATORIO QUE MAS FACTURO
DROP FUNCTION IF EXISTS laboratorio_que_mas_facturo;
DELIMITER //

CREATE FUNCTION laboratorio_que_mas_facturo()
RETURNS VARCHAR(80)
DETERMINISTIC
BEGIN
    DECLARE v_laboratorio_nombre VARCHAR(80);
    
    SELECT l.sucursal INTO v_laboratorio_nombre
    FROM laboratorio l
    JOIN talon t ON l.id_laboratorio = t.id_laboratorio
    JOIN pago p ON t.id_pago = p.id_pago
    GROUP BY l.id_laboratorio
    ORDER BY SUM(p.precio) DESC
    LIMIT 1;

    RETURN v_laboratorio_nombre;
END //

DELIMITER ;



-- -- PRUEBAS

-- select laboratorio_que_mas_facturo();

-- select total_estudios_bioquimico(3);


-- select obtener_ultimo_resultado(12345678);
