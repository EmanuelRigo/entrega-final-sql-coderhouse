-- TRIGGERS

USE laboratorio_coderhouse;

-- TRIGGERS PARA QUE INSERTE ANTES EN LA TABLA PERSONAL

DELIMITER //

CREATE TRIGGER before_insert_bioquimico
BEFORE INSERT ON bioquimico
FOR EACH ROW
BEGIN
    DECLARE temp_legajo INT;

    INSERT INTO personal (nombre, apellido, fecha_de_nacimiento, telefono, email, dni, sucursal, puesto, matricula)
    VALUES (NEW.nombre, NEW.apellido, NEW.fecha_de_nacimiento, NEW.telefono, CONCAT(NEW.nombre, '@correo.com'), NEW.dni, NEW.sucursal, 'Bioquímico', NEW.matricula);
    
    SET temp_legajo = LAST_INSERT_ID();
    
    SET NEW.legajo = temp_legajo;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_tecnico
BEFORE INSERT ON tecnico
FOR EACH ROW
BEGIN
    DECLARE temp_legajo INT;

    INSERT INTO personal (nombre, apellido, fecha_de_nacimiento, telefono, email, dni, sucursal, puesto, matricula)
    VALUES (NEW.nombre, NEW.apellido, NEW.fecha_de_nacimiento, NEW.telefono, CONCAT(NEW.nombre, '@correo.com'), NEW.dni, NEW.sucursal, 'Técnico', NEW.matricula);
    
    SET temp_legajo = LAST_INSERT_ID();
    
    SET NEW.legajo = temp_legajo;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_recepcionista
BEFORE INSERT ON recepcionista
FOR EACH ROW
BEGIN
    DECLARE temp_legajo INT;

    INSERT INTO personal (nombre, apellido, fecha_de_nacimiento, telefono, email, dni, sucursal, puesto)
    VALUES (NEW.nombre, NEW.apellido, NEW.fecha_de_nacimiento, NEW.telefono, CONCAT(NEW.nombre, '@correo.com'), NEW.dni, NEW.sucursal, 'Recepcionista');
    
    SET temp_legajo = LAST_INSERT_ID();

    SET NEW.legajo = temp_legajo;
END //

DELIMITER ;


-- TRIGGER UNIFICA TURNO_ESTUDIO

DELIMITER //

CREATE TRIGGER before_insert_turno_estudio
BEFORE INSERT ON turno_estudio
FOR EACH ROW
BEGIN
    SET NEW.turno_estudio = CONCAT(NEW.id_turno, '_', NEW.estudio);
END //

DELIMITER ;


-- trigger generar resultado

-- DELIMITER //

-- CREATE TRIGGER after_insert_turno_estudio
-- AFTER INSERT ON turno_estudio
-- FOR EACH ROW
-- BEGIN
--     DECLARE v_resultado_id VARCHAR(105);
 
--     SET v_resultado_id = NEW.TURNO_ESTUDIO;
    
--     INSERT INTO resultado (id_resultado, completo)
--     VALUES (v_resultado_id, FALSE); 
-- END //

-- DELIMITER ;


