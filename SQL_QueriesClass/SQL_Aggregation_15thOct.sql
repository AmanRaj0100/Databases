--------------------------------SQL_Aggregation_15thOct------------------------------------------

-- Scalar Functions: Because it can only work on single value and give a single valued result

SELECT UPPER(last_name)
FROM employees;

SELECT UPPER('summer');

SELECT last_name, LEN(last_name)
FROM employees;

SELECT ROUND(555.5555,2);

-- Group Functions: few of them are (AVG, COUNT, MAX, MIN, STDDEV, SUM, VARIANCE)

SELECT AVG(salary) AS avg_salary, SUM(salary) AS total_salary, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees;

-- SUM and AVG fn can only be used with numbers but MIN and MAX can also be used on Date, Character and String (basically on its ASCII Values)

SELECT MAX(hire_date), MIN(hire_date)
FROM employees;

SELECT MAX(last_name), MIN(first_name)
FROM employees;

-- Count fn can be used to count the number of non-null rows

SELECT COUNT(*)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

-- All the Aggregation functions except COUNT(*) ignores NULL values

SELECT  SUM(commission_pct) AS total, COUNT (*) AS total_emp, 
			COUNT(commission_pct) AS comm_total,
			AVG(isnull(commission_pct,0)) -- Here we are using ISNULL to replace null values of commission_pct to 0 since AVG fn ignores NULL values but we need it to calculate average.
FROM employees;

--CREATING GROUPS OF DATA

SELECT department_id, job_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY 1, 2; -- Always remeber ORDER BY command must be used at the last.

SELECT employee_id, MAX(salary) AS max_salary -- Whenever we are adding columns in SELECT while GROUP BY fn then both must be same, except that aggregate fn column
FROM employees
GROUP BY employee_id
ORDER BY 1;

SELECT employee_id, department_id, MAX(salary) AS max_salary
FROM employees
WHERE department_id NOT IN (10,20,30) -- WHERE can only be used on columns in which aggregate fn is not used and also always put WHERE after FROM for the sake of sequence of execution
GROUP BY employee_id, department_id 
HAVING MAX(salary)>10000  -- WHERE cannot be used with GROUP BY command column , That's why we are using HAVING to remove the rows based on condition in HAVING clause
ORDER BY 1,2;
