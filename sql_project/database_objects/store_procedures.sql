USE lab_coder;


DROP PROCEDURE IF EXISTS crear_talon;

DELIMITER //

CREATE PROCEDURE crear_talon (
    IN p_id_laboratorio INT,
    IN p_id_recepcionista INT,
    IN p_dni_paciente INT,
    IN p_estudios TEXT,
    IN p_id_tecnico INT,
    IN p_fecha_turno DATETIME,
    IN p_tipo_pago ENUM('tarjeta debito', 'billetera virtual', 'efectivo')
)
BEGIN
    DECLARE v_id_pago INT;
    DECLARE v_id_turno INT;
    DECLARE v_precio INT;
    DECLARE v_valid_lab INT;
    DECLARE v_valid_rec INT;
    DECLARE v_valid_pac INT;
    DECLARE v_valid_tec INT;
    DECLARE v_estudio VARCHAR(80);
    DECLARE v_precio_estudio INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR 
        SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(p_estudios, ',', numbers.n), ',', -1)) AS estudio
        FROM (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) numbers
        WHERE CHAR_LENGTH(p_estudios) - CHAR_LENGTH(REPLACE(p_estudios, ',', '')) >= numbers.n - 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

-- SABER SI EXISTE EL LAB, TECNICO, ETC
    SELECT COUNT(*) INTO v_valid_lab FROM laboratorio WHERE id_laboratorio = p_id_laboratorio;
    IF v_valid_lab = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Laboratorio no encontrado.';
    END IF;

    SELECT COUNT(*) INTO v_valid_rec FROM recepcionista WHERE legajo = p_id_recepcionista;
    IF v_valid_rec = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Recepcionista no encontrada.';
    END IF;

    SELECT COUNT(*) INTO v_valid_pac FROM paciente WHERE dni = p_dni_paciente;
    IF v_valid_pac = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente no encontrado.';
    END IF;

    SELECT COUNT(*) INTO v_valid_tec FROM tecnico WHERE legajo = p_id_tecnico AND sucursal = (SELECT sucursal FROM laboratorio WHERE id_laboratorio = p_id_laboratorio);
    IF v_valid_tec = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Técnico no encontrado o no pertenece al laboratorio especificado.';
    END IF;

-- CREAR PAGO
    SET v_precio = 0;
    INSERT INTO pago (precio, tipo) VALUES (v_precio, p_tipo_pago);
    SET v_id_pago = LAST_INSERT_ID();

    INSERT INTO turno (fecha_y_hora, dni_paciente,  id_tecnico) 
    VALUES (p_fecha_turno, p_dni_paciente, p_id_tecnico);
    SET v_id_turno = LAST_INSERT_ID();

    INSERT INTO talon (id_turno, id_laboratorio, id_recepcionista, id_pago) 
    VALUES (v_id_turno, p_id_laboratorio, p_id_recepcionista, v_id_pago);

-- LOOP CON AYUDA DE chatGpt
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_estudio;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Verificar si el estudio existe y obtener el precio
        SELECT precio INTO v_precio_estudio FROM estudio WHERE nombre = v_estudio;
        IF v_precio_estudio IS NULL THEN
            SET @msg = CONCAT('Estudio "', v_estudio, '" no encontrado.');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
        END IF;

        -- Actualizar el precio total
        SET v_precio = v_precio + v_precio_estudio;

        -- Insertar en la tabla turno_estudio
        INSERT INTO turno_estudio (estudio, id_turno) VALUES (v_estudio, v_id_turno);

    END LOOP;
    CLOSE cur;

    -- Actualizar el precio total en la tabla pago
    UPDATE pago SET precio = v_precio WHERE id_pago = v_id_pago;

END //

DELIMITER ;


-- PROCEDURE PARA GENERAR RESULTADO

drop procedure if exists generar_resultado;

DELIMITER //

CREATE PROCEDURE generar_resultado (
    IN p_turno_estudio VARCHAR(105),
    IN p_legajo_tecnico INT,
    in p_sucursal ENUM ('Flores', 'San Justo', 'Caballito')
    )
BEGIN
    IF EXISTS (SELECT 1 FROM turno_estudio WHERE turno_estudio = p_turno_estudio) THEN
        INSERT INTO resultado (id_resultado, id_tecnico, fecha_creacion, sucursal)
        VALUES (p_turno_estudio, p_legajo_tecnico, CURRENT_TIMESTAMP, p_sucursal);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El turno_estudio no existe.';
    END IF;
END //

DELIMITER ;

-- PROCEDURE PARA ACTUALIZAR RESULTADO

DROP PROCEDURE IF EXISTS actualizar_resultado;
DELIMITER //

CREATE PROCEDURE actualizar_resultado (
    IN p_id_resultado VARCHAR(105),
    IN p_id_bioquimico INT
)
BEGIN
    UPDATE resultado
    SET 
        completo = TRUE,
        id_bioquimico = p_id_bioquimico
    WHERE id_resultado = p_id_resultado;
END //

DELIMITER ;




