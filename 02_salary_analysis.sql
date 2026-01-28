-- 02_salary_analysis.sql
-- Salary analysis reports

-- Average salary by department
SELECT 
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;

-- Total salary cost by department
SELECT 
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC;

-- Employees earning above company average
SELECT 
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
