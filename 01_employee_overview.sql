-- 01_employee_overview.sql
-- Basic overview report for employees

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Employee count by department
SELECT 
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;
