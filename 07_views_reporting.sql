/*
Purpose:
Create reporting views to standardize commonly used HR reports.

Author: Cansu Ozdemir
*/

--------------------------------------------------
-- View 1: Department Salary Summary
--------------------------------------------------
CREATE OR REPLACE VIEW vw_department_salary_summary AS
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count,
       ROUND(AVG(e.salary), 2) AS avg_salary,
       SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
       ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

--------------------------------------------------
-- View 2: High Earners by Department
--------------------------------------------------
CREATE OR REPLACE VIEW vw_high_earners AS
WITH dept_avg AS (
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
JOIN dept_avg d
     ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;


-- Example usage
SELECT *
FROM vw_department_salary_summary
ORDER BY avg_salary DESC;
