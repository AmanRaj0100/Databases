--SQL_JOIN_15thOct

SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT employees.first_name,employees.last_name, employees.salary,departments.department_name
FROM employees
INNER JOIN	departments --At this line of the command every row of employees table is matched each and every row of departments table and is called CARTESIAN PRODUCT
ON employees.department_id=departments.department_id; --At this line of the command other rows are removed where this condition does not meet or satisfy

SELECT e.first_name,e.last_name, e.salary,d.department_name
FROM employees e --Table Alias as "e" 
JOIN	departments d -- Table Alias as "d" and By default INNER JOIN and JOIN are same 
ON e.department_id=d.department_id;

SELECT e.first_name,e.last_name, e.salary,d.department_name, l.city
FROM employees e 
JOIN	departments d
ON e.department_id=d.department_id		--Multiple JOINs can be used like this. 
JOIN	locations l						--If "n" Table needs to be joined the "(n-1)" JOIN clauses must be used
ON l.location_id=d.location_id;

SELECT e.first_name,e.last_name, e.salary,d.department_name, l.city
FROM employees e 
JOIN	departments d
ON e.department_id=d.department_id		
JOIN	locations l						
ON l.location_id=d.location_id
WHERE salary>15000;

-----------------------------------LEFT(OUTER JOIN)----------------------------------

--Example of Inner Join
SELECT e.first_name,e.last_name, e.salary,d.department_name, d.department_id
FROM employees e 
JOIN departments d 
ON e.department_id=d.department_id;

SELECT e.first_name,e.last_name, e.salary,d.department_name, d.department_id
FROM employees e 
LEFT OUTER JOIN departments d -- All data from the left table "employees"
ON e.department_id=d.department_id; -- and Only those data which matches the left table from right table "departments"

SELECT e.first_name,e.last_name, e.salary, d.department_id, d.department_name
FROM departments d 
LEFT OUTER JOIN employees e -- All data from the left table "departments"
ON d.department_id=e.department_id; -- and Only those data which matches the left table from right table "employees"

-----------------------------------RIGHT(OUTER JOIN)----------------------------------

SELECT e.first_name,e.last_name, e.salary, d.department_id, d.department_name
FROM departments d 
RIGHT OUTER JOIN employees e -- All data from the right table "employees"
ON d.department_id=e.department_id; -- and Only those data which matches the right table from left table "departments"

-----------------------------------FULL(OUTER JOIN)----------------------------------

SELECT e.first_name,e.last_name, e.salary, d.department_id, d.department_name
FROM departments d 
FULL OUTER JOIN employees e -- All data from the left and right table connected at the matching data
ON d.department_id=e.department_id
ORDER BY 4;

--------------------------------------------------------------------------------------
--Example of SELF JOIN (A table is joined to itself)

-- Here, MANAGER_ID in the WORKER table is equal to EMPLOYEE_ID in the MANAGER table.

SELECT emp.employee_id AS emp_id , emp.first_name AS emp_name,
		emp.manager_id AS manager_id, manager.first_name AS manager_name
FROM employees emp
JOIN employees  manager
ON emp.manager_id=manager.employee_id;

-----------------------------------CROSS JOIN---------------------------------------

SELECT e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e
CROSS JOIN departments d
WHERE e.department_id =d.department_id
ORDER BY 1;

------Both are same way to perform CROSS JOIN

SELECT e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id =d.department_id
ORDER BY 1;


