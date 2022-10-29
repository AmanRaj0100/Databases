-- From Quiz
SELECT first_name
FROM employees
ORDER BY UPPER(first_name);

-----------------------------------------SQL_SET OPERATORS_28thOct.---------------------------------

SELECT *
FROM employees;

SELECT *
FROM job_history;

--When we use JOIN it has extra overhead since it matches as cartesian product and to avoid this we are using SET Operators.

-- Types of Set Operators: (Set Operators are binary in nature)

-- Syntax: 
----- Must be Union Compatible (Column and their data type must be same for both the queries)
/*
Query_1 ()
SET OPEARATOR
Query_2 ()
*/


-- 1. UNION -> Return results from both queries after eliminating duplication.

--Example:

SELECT employee_id,job_id FROM employees
UNION  ----Remove duplicates
SELECT employee_id,job_id FROM job_history;


-- 2. UNION ALL -> Return results from both queries and not removing duplicates.

--Example:

SELECT employee_id,job_id FROM employees
UNION ALL ----Does not remove duplicates
SELECT employee_id,job_id FROM job_history;


SELECT employee_id,job_id FROM employees
UNION  ----Remove duplicates
SELECT employee_id,job_id FROM job_history
ORDER BY employee_id; ----ORDER BY should be only used once and also at the bottom


-- 3. INTERSECT -> Returns only common results from both queries.

--Example:

SELECT employee_id,job_id FROM employees
INTERSECT
SELECT employee_id,job_id FROM job_history
ORDER BY employee_id;


-- 3. EXCEPT -> Returns only distinct results from first query after removing all that are common from second query. (MINUS Operator in Oracle)

--Example:

SELECT employee_id,job_id FROM employees
EXCEPT
SELECT employee_id,job_id FROM job_history
ORDER BY employee_id;


-- Note: We can use Parentheses to change the order of the execution



--Matching the SELECT statements: (When searched columns are not matching in both SELECT statements we can initiate columns with null values having same data type using CONVERT function)


SELECT department_id,hire_date,CONVERT(smallint, null) AS location
FROM employees
UNION
SELECT department_id,CONVERT(date, null) AS hire_date, location_id
FROM departments;


-----Practice Question 1: The HR department needs a list of department IDs for departments that do not contain the job ID ST_CLERK. Use the set operators to create this report.


--Solution:

SELECT department_id
FROM departments
EXCEPT
SELECT department_id
FROM employees
WHERE job_id='ST_CLERK';


-----Practice Question 2: The HR department needs a list of countries that have no departments located in them. Display the country ID and the name of the countries. Use the set operators to create this report.


--Solution:

SELECT country_id,country_name
FROM countries
EXCEPT
SELECT l.country_id,c.country_name
FROM locations l, countries c
WHERE l.country_id = c.country_id; 




