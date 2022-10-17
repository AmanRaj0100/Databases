SELECT * 
FROM employees
WHERE salary BETWEEN 2501 AND 9999; 

SELECT * 
FROM employees
WHERE hire_date BETWEEN '2005-01-01' AND '2005-12-31';

SELECT * 
FROM employees
WHERE department_id IN (10, 30, 80);  

SELECT first_name, last_name
FROM employees
WHERE first_name = 'JOHN';  

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'A%';  

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%n';

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%e%';

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_e%';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%-10-%'; /* _ -> Any Character    % -> Zer or Many Character*/

SELECT *
FROM employees
WHERE commission_pct IS null;

SELECT *
FROM employees
WHERE commission_pct IS NOT null;

SELECT job_id, salary
FROM employees
WHERE (job_id='sa_rep' OR job_id='ad_pres') AND salary>15000;

SELECT first_name, last_name, hire_date
FROM employees
ORDER BY first_name ASC; /*By default it is Ascending Order but we can also use ASC */

SELECT first_name, last_name, hire_date
FROM employees
ORDER BY first_name DESC, last_name ASC;

SELECT first_name, last_name, salary, hire_date, commission_pct
FROM employees
ORDER BY 3; /*Here number means the columns serial number that we have used in SELECT command*/

SELECT first_name, last_name, salary, hire_date, commission_pct
FROM employees
ORDER BY 3;

SELECT first_name , last_name, salary, hire_date , salary+isnull(commission_pct,0) as total_sal
FROM employees
ORDER BY 1 ASC,2 DESC;

/*All these 3 queries works without any error*/
SELECT *
FROM employees
ORDER BY 1;

SELECT employee_id, *
FROM employees

SELECT first_name, last_name
FROM employees
ORDER BY salary;

