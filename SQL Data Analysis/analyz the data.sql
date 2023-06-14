-- QUESTIONS

-- 1. Calculate total gender male and female form company?
SELECT gender, COUNT(*) AS count
FROM `human resources`
WHERE gender IN ('male', 'female')
GROUP BY gender;


-- 2. Calculate total jobtitle by gender?
SELECT gender, jobtitle, COUNT(*) AS employee_count
FROM `human resources`
GROUP BY gender,jobtitle;

-- 3. What is the distribution of employees across different departments and job titles?
select department, jobtitle, COUNT(*) AS employee_count
FROM `human resources`
GROUP BY department, jobtitle
ORDER BY department, jobtitle;


-- 4. How many employees work at headquarters versus remote locations?
select location, count(emp_id) as total_emp
from `human resources`
group by location;

-- 5. Which employees have been with the company for the longest period of time
SELECT first_name, hire_date, DATEDIFF(NOW(), hire_date) AS days_since_hire
FROM `human resources`
ORDER BY days_since_hire DESC
LIMIT 5;


-- 6. How many employees have joined each year since the inception of the company?
SELECT YEAR(hire_date) AS joining_year, COUNT(*) AS employee_count
FROM `human resources`
GROUP BY joining_year
ORDER BY joining_year;


-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS title_count
FROM `human resources`
GROUP BY jobtitle;


-- 8. What is the tenure distribution of employees in each department?
SELECT department, 
       COUNT(*) AS employee_count,
       MIN(hire_date) AS earliest_hire_date,
       MAX(hire_date) AS latest_hire_date,
       DATEDIFF(MAX(hire_date), MIN(hire_date)) AS tenure_in_days
FROM `human resources`
GROUP BY department;


-- 9. What is the distribution of employees across locations by city and state?
SELECT location_city, location_state, COUNT(*) AS employee_count
FROM `human resources`
GROUP BY location_city, location_state
order by employee_count desc;


-- 10. How many employees fall into specific age groups?
SELECT CASE
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 18 AND 25 THEN '18-25'
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 26 AND 35 THEN '26-35'
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 36 AND 45 THEN '36-45'
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 46 AND 55 THEN '46-55'
           ELSE '56+'
       END AS age_group,
       COUNT(*) AS employee_count
FROM `human resources`
GROUP BY age_group;


-- 11. How many employees are in each age group by department?
SELECT department, 
       CASE
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 18 AND 25 THEN '18-25'
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 26 AND 35 THEN '26-35'
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 36 AND 45 THEN '36-45'
           WHEN DATEDIFF(NOW(), birthdate) / 365 BETWEEN 46 AND 55 THEN '46-55'
           ELSE '56+'
       END AS age_group,
       COUNT(*) AS employee_count
FROM `human resources`
GROUP BY department, age_group;


