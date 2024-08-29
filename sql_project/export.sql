USE lab_coder;

-- Exportar
SELECT * FROM paciente
INTO OUTFILE '/sql_project/export/pacientes.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM personal
INTO OUTFILE '/sql_project/export/personal.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';