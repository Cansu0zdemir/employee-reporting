/*
Purpose:
Reporting queries using JOINs across employees, departments and locations

Author: Cansu Ozdemir
*/

----------------------------------------------
-- 1. Employee count per department
----------------------------------------------
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
       ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;

----------------------------------------------
-- 2. Average salary per department
----------------------------------------------
SELECT d.department_name,
       ROUND(AVG(e.salary), 2) AS avg_salary
FROM departments d
JOIN employees e
     ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

----------------------------------------------
-- 3. Employees with department and city
----------------------------------------------
SELECT e.first_name,
       e.last_name,
       d.department_name,
       l.city
FROM employees e
JOIN departments d
     ON e.department_id = d.department_id
JOIN locations l
     ON d.location_id = l.location_id;
