DELIMITER //

CREATE PROCEDURE assign_roles()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_puesto VARCHAR(40);
    DECLARE user_dni INT;
    DECLARE user_host VARCHAR(255) DEFAULT '%'; -- Cambia si usas un host específico
    DECLARE cur CURSOR FOR SELECT dni, puesto FROM personal;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO user_dni, user_puesto;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Elimina el usuario si existe
        SET @drop_user_query = CONCAT('DROP USER IF EXISTS \'',  CONCAT(nombre, apellido, legajo),  '\'@\'', user_host, '\';');
        PREPARE stmt FROM @drop_user_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        
        -- Crea el usuario con el DNI como contraseña
        SET @create_user_query = CONCAT('CREATE USER IF NOT EXISTS \'',  CONCAT(nombre, apellido, legajo), '\'@\'', user_host, '\' IDENTIFIED BY \'', user_dni, '\';');
        PREPARE stmt FROM @create_user_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Asigna el rol según el puesto
        CASE user_puesto
            WHEN 'bioquimico' THEN
                SET @grant_role_query = CONCAT('GRANT bioquimico_role TO \'',  CONCAT(nombre, apellido, legajo), '\'@\'', user_host, '\';');
            WHEN 'tecnico' THEN
                SET @grant_role_query = CONCAT('GRANT tecnico_role TO \'',  CONCAT(nombre, apellido, legajo), '\'@\'', user_host, '\';');
            WHEN 'recepcionista' THEN
                SET @grant_role_query = CONCAT('GRANT recepcionista_role TO \'',  CONCAT(nombre, apellido, legajo), '\'@\'', user_host, '\';');
            ELSE
                SET @grant_role_query = '';
        END CASE;

        IF @grant_role_query != '' THEN
            PREPARE stmt FROM @grant_role_query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;

    END LOOP;

    CLOSE cur;
END //

DELIMITER ;


CALL assign_roles();

