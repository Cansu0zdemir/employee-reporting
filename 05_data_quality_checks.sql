/*
Purpose:
Data quality checks to identify potential issues such as:
- Orphan records
- Missing or invalid salary values
- Duplicate emails
- Empty departments

Author: Cansu Ozdemir
*/

--------------------------------------------------
-- 1. Employees without valid department (Orphan Records)
--------------------------------------------------
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.department_id
FROM employees e
LEFT JOIN departments d
       ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

--------------------------------------------------
-- 2. Employees with NULL or zero salary
--------------------------------------------------
SELECT employee_id,
       first_name,
       last_name,
       salary
FROM employees
WHERE salary IS NULL
   OR salary = 0;

--------------------------------------------------
-- 3. Duplicate employee emails
--------------------------------------------------
SELECT email,
       COUNT(*) AS email_count
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 4. Departments with no employees
--------------------------------------------------
SELECT d.department_id,
       d.department_name
FROM departments d
LEFT JOIN employees e
       ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
