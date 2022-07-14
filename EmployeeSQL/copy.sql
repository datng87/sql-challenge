set datestyle to 'MDY';

COPY employees
FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\employees.csv'
DELIMITER ','
CSV HEADER;