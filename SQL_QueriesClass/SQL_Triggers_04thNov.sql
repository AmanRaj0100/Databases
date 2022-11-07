---------------------------Triggers_04thNov--------------------------


















------------Assignments Questions and Solutions-------------

--1:

CREATE TABLE DML_LOG ( log_date DATE , action VARCHAR(50));

--2:

select * INTO copy_departments from departments

create TRIGGER EVAL_CHANGE_TRIGGER
ON copy_departments
INSTEAD OF INSERT,DELETE
AS
BEGIN
	IF INSERT
	THEN Select * from deleted
	insert into DML_LOG(log_date,action)
	values(GETDATE(),'DELETED')
END

------------------------------------------------------------------------------------
CREATE TRIGGER EVAL_CHANGE_TRIGGER  
    ON departments  
    AFTER INSERT, DELETE  
AS  
BEGIN  
  
    IF NOT EXISTS(SELECT * FROM INSERTED)  
        -- DELETE  
        INSERT into DML_LOG(log_date,action) values (GETDATE(),'DELETE');  
    ELSE  
    BEGIN  
        IF NOT EXISTS(SELECT * FROM DELETED)  
            -- INSERT  
            INSERT into DML_LOG(log_date,action) values (GETDATE(),'INSERT');  
    END  
END; 