--------------------------------SQL_Aggregation_15thOct_Practice------------------------------------------

--Solution: 1
SELECT ROUND(AVG(salary),0) AS AVERAGE, ROUND(SUM(salary),0) AS SUM,
		ROUND(MAX(salary),0) AS MAXIMUM, ROUND(MIN(salary),0) AS MINIMUM
FROM employees;


--Solution: 2
SELECT job_id, COUNT(job_id)
FROM employees
GROUP BY job_id;


--Solution: 3
SELECT manager_id, MIN(salary) AS min_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id 
HAVING MIN(salary)>1000 
ORDER BY 1 DESC;
