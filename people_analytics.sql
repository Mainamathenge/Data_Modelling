--Table Exploration
--table employee
SELECT *
FROM employees.employee
LIMIT 5;
-- table employee salary
SELECT *
FROM employees.salary
LIMIT 5 ;
-- table department 
SELECT *
FROM employees.department_employee
LIMIT 5;
--table department manager
SELECT *
FROM employees.department_manager
LIMIT 5;
--department
SELECT *
FROM employees.department
LIMIT 5;
--title // if the employee has got more than on e title
SELECT *
FROM employees.title
WHERE employee_id = 10005
ORDER BY from_date;
-- if an employee has got more than one department
SELECT *
FROM employees.department_employee
WHERE employee_id = 10005;
--check number of employees and their departments
SELECT
  employee_id,
  COUNT(DISTINCT department_id) AS unique_departments
FROM employees.department_employee
GROUP BY employee_id
ORDER BY unique_departments DESC
LIMIT 5;
-- 