--SQL_JOIN_15thOct_Practice

--Solution: 1
SELECT e.first_name,e.last_name, e.salary, d.department_name, rg.region_name 
FROM employees e 
JOIN	departments d
ON e.department_id=d.department_id		
JOIN	locations l						
ON l.location_id=d.location_id
JOIN	countries c						
ON l.country_id=c.country_id
JOIN	regions rg						
ON c.region_id=rg.region_id;

--------------------------------------------------------------------------

SELECT * 
FROM employees

SELECT * 
FROM departments

SELECT * 
FROM locations

SELECT * 
FROM countries

SELECT * 
FROM regions

SELECT * 
FROM jobs

SELECT * 
FROM job_grades

-----------------------------------------------------------------------------------

--Solution: 2
SELECT e.last_name, e.job_id, d.department_name, d.department_id
FROM employees e
JOIN	departments d
ON e.department_id=d.department_id
JOIN	jobs j
ON e.job_id=j.job_id
JOIN	locations l						
ON l.location_id=d.location_id
WHERE l.city='Toronto';

-----------------------------------OR-----------------------------------------------

--Solution: 2
SELECT e.last_name, e.job_id, d.department_name, d.department_id, l.city
FROM employees e
JOIN	departments d
ON e.department_id=d.department_id
JOIN	jobs j
ON e.job_id=j.job_id
JOIN	locations l						
ON l.location_id=d.location_id
WHERE upper(l.city)='TORONTO'; --Here we are first converting all to uppercase then applying the condition to avoid any discrepancies.

--------------------------------------------------------------------------------------------

--Solution: 5
SELECT e.first_name, d.department_name, e.salary, jg.grade_level
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
JOIN job_grades jg
ON e.salary BETWEEN jg.lowest_sal AND jg.highest_sal

--------------------------------------------------------------------------------------------

--Solution: 3
SELECT emp.employee_id AS emp# , emp.first_name AS emp_name,
		emp.manager_id AS manager#, manager.first_name AS manager_name
FROM employees emp
JOIN employees  manager
ON emp.manager_id=manager.employee_id;


--------------------------------------------------------------------------------------------

--Solution: 4
SELECT emp.employee_id AS emp# , CONCAT(emp.first_name, ' ', emp.last_name) AS emp_name,
		emp.manager_id AS manager#, manager.first_name AS manager_name
FROM employees emp
LEFT OUTER JOIN employees  manager
ON emp.manager_id=manager.employee_id
ORDER BY 3;

