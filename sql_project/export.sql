USE lab_coder;

-- Exportar tablas a CSV

SELECT * FROM personal
INTO OUTFILE '/sql_project/personal.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

