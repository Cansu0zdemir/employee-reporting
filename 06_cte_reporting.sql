/*
Purpose:
CTE-based reporting queries to improve readability and maintainability
in complex SQL reports.

Author: Cansu Ozdemir
*/

--------------------------------------------------
-- 1. Employees earning above department average
--------------------------------------------------
WITH dept_avg_salary AS (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.department_id,
       e.salary,
       d.avg_salary
FROM employees e
JOIN dept_avg_salary d
     ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary
ORDER BY e.salary DESC;

--------------------------------------------------
-- 2. Department salary summary using CTE
--------------------------------------------------
WITH dept_salary_summary AS (
    SELECT department_id,
           COUNT(*) AS employee_count,
           AVG(salary) AS avg_salary,
           SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name,
       s.employee_count,
       ROUND(s.avg_salary, 2) AS avg_salary,
       s.total_salary
FROM departments d
JOIN dept_salary_summary s
     ON d.department_id = s.department_id
ORDER BY avg_salary DESC;
