
---------------------------------------SQL_IndexObject_29thOct---------------------------------------

create index employee_salary_idx
on employees(salary);

select *
from employees
where salary > 10000;


create index employee_name
on employees(first_name ASC, last_name DESC);