-- 03_high_earners_vs_department.sql
-- Employees earning above their department average

SELECT 
    e.employee_id,
    e.first_name,
    e.department_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
)
ORDER BY e.salary DESC;
