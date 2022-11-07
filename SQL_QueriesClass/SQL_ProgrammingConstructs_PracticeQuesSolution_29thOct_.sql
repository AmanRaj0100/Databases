
-----------------------------------SQL_ProgrammingConstructs_PracticeQuesSolution------------------------------


--Practice Question 1:

--Solution:

BEGIN
declare @v_today date, @v_tomorrow date, @v_fname varchar(15), @v_emp_sal decimal(10), @v_pf decimal(10,2)
set @v_today=GETDATE()
set @v_tomorrow=dateadd(day,1,@v_today)
print @v_today
print @v_tomorrow
select @v_fname=first_name,@v_emp_sal=salary
from employees
where employee_id=110
set @v_pf=(0.12*(0.45*@v_emp_sal))
print @v_emp_sal
print @v_pf
END


--Practice Question 2:

--Solution:

BEGIN
declare  @v_sal decimal(10), @v_dept_id int
select @v_sal=salary,@v_dept_id=department_id
from employees
where employee_id=107
if @v_sal<5000
	BEGIN
		update employees set salary=salary+(0.1*salary)
		where employee_id=107
	END
else
	print 'No changes made in salary'
END



--Practice Question 3:

--Solution:

BEGIN
declare @vcount int = 1, @v_num int = 8
while @vcount<=10
	begin
		print @v_num*@vcount
		set @vcount=@vcount+1
	end
END