SELECT Department_id, hire_date, convert(smallint, null) as location
from employees
union
select department_id, convert(date, null), location_id
from departments;

select * from employees 
where department_id =10
union 
select * from employees 
where department_id =20
union
select * from employees 
where department_id =30;

/*2.	The HR department needs a list of countries that have no departments
located in them. Display the country ID and the name of the countries.
Use the set operators to create this report.*/

 SELECT country_id,country_name
	FROM countries
	except
	SELECT l.country_id,c.country_name
	FROM locations l, countries c
	WHERE l.country_id = c.country_id; 