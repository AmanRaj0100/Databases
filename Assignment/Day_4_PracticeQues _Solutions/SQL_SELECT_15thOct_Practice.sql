/*1*/
SELECT DISTINCT job_id
FROM employees;

/*2*/
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 28500;

/*3*/
SELECT first_name, last_name, salary
FROM employees
WHERE salary NOT BETWEEN 15000 AND 28500;

/*4*/
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (10,30)
ORDER BY first_name,last_name;

/*5*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '2011-%-%';

/*6*/
SELECT first_name, last_name, job_id
FROM employees
WHERE manager_id IS null;

/*7*/
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '__A%';