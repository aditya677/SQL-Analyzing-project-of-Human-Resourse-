CREATE DATABASE projects;

USE projects;

SELECT * FROM `human resources`;

ALTER TABLE `human resources`
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE `human resources`;

SELECT birthdate FROM `human resources`;

SET sql_safe_updates = 0;

UPDATE `human resources`
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE `human resources`
MODIFY COLUMN birthdate DATE;

UPDATE `human resources`
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE `human resources`
MODIFY COLUMN hire_date DATE;

UPDATE `human resources`
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'));


ALTER TABLE `human resources`
MODIFY COLUMN termdate DATE;

ALTER TABLE `human resources` ADD COLUMN age INT;

UPDATE `human resources`
SET age = timestampdiff(YEAR, birthdate, CURDATE());
