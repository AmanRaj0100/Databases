-----------------------------------------SQL_SubQuery_28thOct.---------------------------------

--SubQuery: Query within a query. Also called Nested Query

--Example:

--First design the inner query and then the outer query. Always run both queries separately to see if they are running perfectly.

--Outer Query
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Nancy'); --Inner Query


--Single Row Operators: (<,>,=,<=,>=,<>)

SELECT * FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees WHERE department_id=20);

--Multiple Row Operators: (IN, ANY, ALL)
			-- ANY and ALL are used with single row operators and not alone.
			-- ANY basically have the function of OR operator.
			-- ALL basically have the function of AND operator


-----IN Operator:
SELECT employee_id,salary FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id);


-----ANY Operator:
SELECT employee_id,salary FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id='IT_PROG')
ORDER BY salary;


-----ALL Operator:
SELECT employee_id,salary FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id='IT_PROG')
ORDER BY salary;



-- In a single query we can write n number of sub queries.

--Sub queries can also return null values.

--Example:

SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE last_name='Haas');




-----Practice Question 1: The HR department needs a query that prompts the user for an employee last name. 
                             --The query then displays the last name and hire date of any employee in the same department as the employee whose name they supply (excluding that employee).

--Solution: (Fixed employee input)

SELECT last_name, hire_date 
FROM employees 
WHERE department_id  IN (SELECT department_id FROM employees WHERE last_name='King') AND last_name != 'King';


--Solution: (General using Prompt)-- Not yet explained

SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE last_name like '&name')and last_name<> '&name';


-----Practice Question 2: Create a report that displays the employee number, last name, and salary of all employees who earn more than the average salary. Sort the results in order of ascending salary.

--Solution:

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary;


-----Practice Question 3: Display the last name, department number, and job ID of all employees whose department location ID is 1700.

--Solution:

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id=1700);




-------------------Multi-level Nested Sub Query-------------------------

--Example:

SELECT *
FROM employees
WHERE department_id IN (SELECT department_id 
						FROM departments
						WHERE location_id IN (SELECT location_id 
										      FROM locations
											  WHERE city ='Seattle'));