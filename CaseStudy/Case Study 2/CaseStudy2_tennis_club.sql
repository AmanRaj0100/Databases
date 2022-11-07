--create database TennisClub;

--_________CREATING TABLES_____________
--______________________________creating table for PLAYERS____________________________________________
/*drop table COMMITTEE_MEMBERS;
drop table MATCHES;
DROP TABLE PENALTIES;
DROP TABLE TEAMS;
DROP TABLE PLAYERS;*/

create table PLAYERS
(PLAYERNO smallint primary key,
NAME varchar(50), INITIALS varchar(10) CONSTRAINT check_in_value CHECK (CHARINDEX(' ',INITIALS)< 1), --FOR SPACE CHECK
BIRTH_DATE date, SEX varchar(1),	
JOINED smallint, STREET varchar(50),
HOUSENO varchar(5), POSTCODE varchar(10),
TOWN varchar(50), PHONENO varchar(10),
LEAGEUENO smallint,
CONSTRAINT check_year CHECK (JOINED>=1970),
CONSTRAINT check_in_value1 CHECK (INITIALS NOT LIKE '%.%'));

--drop table PLAYERS;
--insert into PLAYERS(PLAYERNO, INITIALS) VALUES (11444, 'B ');


--______________________________________________creating table for TEAMS________________________________

create table TEAMS
(TEAMNO smallint primary key,
PLAYERNO smallint CONSTRAINT fk_playerno references PLAYERS(PLAYERNO),
DIVISION varchar(10));


--_____________________________________creating table for MATCHES________________________________________

create table MATCHES
(MATCHNO smallint primary key,
TEAMNO smallint CONSTRAINT fk_teamno references TEAMS(TEAMNO),
PLAYERNO smallint CONSTRAINT fk_playerno1 references PLAYERS(PLAYERNO),
WON smallint, LOST smallint);


--________________________________creating table for PENALTIES__________________________________________

create table PENALTIES
(PAYMENTNO smallint primary key,
PLAYERNO smallint CONSTRAINT fk_playerno2 references PLAYERS(PLAYERNO),
PAYMENT_DATE date CONSTRAINT chk_pay_date CHECK (PAYMENT_DATE >= '1970-01-01'),
AMOUNT decimal(10,2));



--_________________creating table for COMMITTEE_MEMBERS___________________________


create table COMMITTEE_MEMBERS
(PLAYERNO smallint CONSTRAINT fk_playerno3 references PLAYERS(PLAYERNO),
BEGIN_DATE date CONSTRAINT chk_beg_date CHECK (BEGIN_DATE >= '1990-01-01'),
END_DATE date, POSITION varchar(20),
CONSTRAINT pk_committee primary key(PLAYERNO, BEGIN_DATE));

ALTER TABLE COMMITTEE_MEMBERS
ADD CONSTRAINT chk_end_date CHECK ((END_DATE >= BEGIN_DATE) OR (END_DATE IS NULL));

/*__________________________________________________________________________________________________________________*/

-----POPULATING TABLES WITH DATA-------------------------------------------------------------------------------

--INSERTING DATA INTO PLAYERS TABLE

--INSERT INTO PLAYERS(PLAYERNO, NAME, INITIALS, BIRTH_DATE, SEX,JOINED,STREET,HOUSENO, POSTCODE,TOWN,PHONENO,LEAGEUENO)
INSERT INTO PLAYERS
VALUES(2,'Everett','R','1948-09-01','M',1975,'Stoney Road','43','3575NH','Stratford','070-237893',2411),
	(6,'Parmenter','R','1964-06-25','M',1977,'Haseltine Lane','80', '1234KK', 'Stratford', '070-476537',8467),
	(7, 'Wise', 'GWS', '1963-05-11', 'M', 1981, 'Edgecombe Way','39', '9758VB', 'Stratford', '070-347689',NULL),
	(8, 'Newcastle', 'B', '1962-07-08', 'F', 1980, 'Station Road', '4', '6584RO', 'Inglewood', '070-458458', 2983),
	(27,'Collins','DD','1964-12-28','F',1983,'Long Drive','804','8457DK','Eltham','079-234857',2513),
	(28,'Collins','C','1963-06-22','F',1983,'Old Main Road','10','1294QK','Midhurst','071-659599',NULL),
	(39,'Bishop','D','1956-10-29','M',1980,'Eaton Square','78','9629CD','Stratford','070-393435',NULL),
	(44,'Baker','E','1963-01-09','M',1980,'Lewis Street','23','4444LJ','Inglewood','070-368753',1124),
	(57,'Brown','M','1971-08-17','M',1985,'Edgecombe Way','16','4377CB','Stratford','070-473458',6409),
	(83,'Hope','PK','1956-11-11','M',1982,'Magdalene Road','16A','1812UP','Stratford','070-353548',1608),
	(95,'Miller','P','1963-05-14','M',1972,'High Street','33A','5746OP','Douglas','070-867564',NULL),
	(100,'Parmenter','P','1963-02-28','M',1979,'Haseltine Lane','80','1234KK','Stratford','070-494593',6524),
	(104,'Moorman','D','1970-05-10','F',1984,'Stout Street','65','9437AO','Eltham','079-987571',7060),
	(112,'Bailey','IP','1963-10-01','F',1984,'Vixen Road','8','6392LK','Plymouth','010-548745',1319);

--select * from PLAYERS;

--INSERTING INTO TEAMS TABLE
INSERT INTO TEAMS
VALUES(1,6,'first'),
	(2,27,'second');

--INSERTING INTO MATCHES
INSERT INTO MATCHES
VALUES(1,1,6,3,1),
	(2,1,6,2,3), (3,1,6,3,0), (4,1,44,3,2),
	(5,1,83,0,3), (6,1,2,1,3), (7,1,57,3,0),
	(8,1,8,0,3), (9,2,27,3,2), (10,2,104,3,2),
	(11,2,112,2,3), (12,2,112,1,3), (13,2,8,0,3);

--INSERTING INTO PENALTIES
INSERT INTO PENALTIES
VALUES(1,6,'1980-12-08', 100.00),
	(2, 44, '1981-05-05', 75.00),
	(3, 27, '1983-09-10', 100.00),
	(4, 104, '1984-12-08', 50.00),
	(5, 44, '1980-12-08', 25.00),
	(6, 8, '1980-12-08', 25.00),
	(7, 44, '1982-12-30', 30.00),
	(8, 27, '1984-11-12', 75.00);

--INSERTING INTO COMMITTEE_MEMBERS
INSERT INTO COMMITTEE_MEMBERS
VALUES(2,'1990-01-01','1992-12-31','Chairman'),
	(2,'1994-01-01',null,'Member'),
	(6,'1990-01-01', '1990-12-31', 'Secretary'),
	(6, '1991-01-01', '1992-12-31', 'Member'),
	(6, '1992-01-01', '1993-12-31', 'Treasurer'),
	(6, '1993-01-01',null, 'Chairman'),
	(8, '1990-01-01', '1990-12-31', 'Treasurer'),
	(8, '1991-01-01', '1991-12-31', 'Secretary'),
	(8, '1993-01-01', '1993-12-31', 'Member'),
	(8, '1994-01-01', null, 'Member'),
	(27, '1990-01-01', '1990-12-31', 'Member'),
	(27, '1991-01-01', '1991-12-31', 'Treasurer'),
	(27, '1993-01-01', '1993-12-31', 'Treasurer'),
	(57, '1992-01-01', '1992-12-31', 'Secretary'),
	(95, '1994-01-01', null, 'Treasurer'),
	(112, '1992-01-01', '1992-12-31', 'Member'),
	(112, '1994-01-01', null, 'Secretary');


--________________________________________________________________________________________________________________
/*---------------------QUERYING TABLES-------------------------------*/

--Answer 3rd
select * from PLAYERS;
select PLAYERNO, NAME, BIRTH_DATE FROM PLAYERS
WHERE TOWN= 'Stratford' ORDER BY NAME;

--Answer 4th
select PLAYERNO FROM PLAYERS
WHERE JOINED>1980 AND TOWN='Stratford' ORDER BY PLAYERNO;

--ANSWER 5TH
select * FROM PENALTIES;

--_________________________________________________________________________________________________________________
/*-------------------------------UPDATING AND DELETING ROWS---------------------------------------------*/


--Answer 1st
UPDATE PENALTIES
SET AMOUNT = 200.0
WHERE PLAYERNO = 44;

--Answer 2nd
Delete FROM PENALTIES
WHERE AMOUNT>100;

--______________________________________________________________________________________________________________
/* ----------------------------------OPTIMIZING QUERY PROCESSING WITH INDEXES--------------------------------*/

--Answer 1st
CREATE INDEX penalty_index
on PENALTIES(AMOUNT);

--__________________________________________________________________________________________________________
/*---------------------------------VIEWS-------------------------------------------------------*/

--Answer 2nd
select * from MATCHES;
Create VIEW sets_view
as select MATCHNO, TEAMNO, PLAYERNO, WON, LOST, (WON-LOST) Difference_in_sets from MATCHES;

select * from sets_view;

--_______________________________________________________________________________________________________________
/*------------------------------DELETING DATABASE OBJECTS--------------------------------------*/

--Answer1,2,3,4
/*
DROP TABLE MATCHES;
DROP view sets_view;
DROP index PENALTIES.penalty_index; 
DROP DATABASE TENNIS_CLUB;
*/

--____________________________________________________________________________________________________________________
/*--------------------------------QUERYING AND UPDATING DATA------------------------------------*/

--Answer1
select * from sets_view;
select MATCHNO, Difference_in_sets from sets_view
WHERE Difference_in_sets = 2;

--Answer2
select TEAMNO, DIVISION FROM TEAMS;

--Answer3
select * from teams;
select t.TEAMNO, t.DIVISION, p.NAME
FROM TEAMS t
JOIN PLAYERS p ON t.PLAYERNO = p.PLAYERNO;

--Answer4

select PAYMENTNO, (AMOUNT*100) amount_in_cents from PENALTIES;

--Answer5
select * from PLAYERS;
UPDATE PLAYERS
SET LEAGUENO = NULL WHERE PLAYERNO=2;

--Answer6
select * FROM PLAYERS
ORDER BY LEAGUENO DESC;------------Doubt in question


/*--------------------------------The Aggregation Function and the Scalar Subquery------------------------------------*/

--Answer 1:
select TEAMNO from TEAMS;

--Answer 2:
select  t.TEAMNO, p.NAME
from PLAYERS p
join TEAMS t
on p.PLAYERNO=t.PLAYERNO;

--Answer 3:
select  pt.PAYMENTNO, pt.AMOUNT, pl.PLAYERNO,pl.NAME,pl.INITIALS
from PENALTIES pt
join PLAYERS pl
on pt.PLAYERNO=pl.PLAYERNO;


/*--------------------------------Joins------------------------------------*/

--Answer 1:
select t.PLAYERNO
from TEAMS t
join PENALTIES pt
on t.PLAYERNO=pt.PLAYERNO


--Answer 2:
select distinct t.PLAYERNO
from TEAMS t
join PENALTIES pt
on t.PLAYERNO=pt.PLAYERNO


--Answer 3:
select count(PLAYERNO) from PLAYERS 
	WHERE BIRTH_DATE >  (SELECT BIRTH_DATE FROM PLAYERS where NAME = 'Parmenter'and INITIALS = 'R');


--Answer 4:
select pl.PLAYERNO,pl.NAME,pt.AMOUNT
from PLAYERS pl
join PENALTIES pt
on pl.PLAYERNO=pt.PLAYERNO
order by pl.PLAYERNO;


--Answer 5:
select pt.PAYMENTNO,pl.NAME
from PLAYERS pl
join PENALTIES pt
on pl.PLAYERNO=pt.PLAYERNO


/*--------------------------------Comparison Operators with Subqueries------------------------------------*/

--Answer 1:
select PLAYERNO, NAME 
FROM PLAYERS
WHERE PLAYERNO = (SELECT PLAYERNO FROM TEAMS WHERE TEAMNO=1);


/*--------------------------------Aggregation Functions------------------------------------*/

--Answer 1:
select count(LEAGUENO) from PLAYERS

--Answer 2:
select max(AMOUNT) from PENALTIES

--Answer 3:
--Through Join
select sum(AMOUNT) 
from PENALTIES pt
join PLAYERS pl
on pt.PLAYERNO=pl.PLAYERNO
where pl.TOWN='Inglewood'

--Through SubQuery
select SUM(AMOUNT) FROM PENALTIES
WHERE PLAYERNO IN (select PLAYERNO from PLAYERS where TOWN = 'INGLEWOOD');

---Answer 4:
select var(AMOUNT) from PENALTIES where PLAYERNO=44


/*--------------------------------Group by clause------------------------------------*/

--Answer 1:
select count(PAYMENTNO), year(PAYMENT_DATE) from PENALTIES group by year(PAYMENT_DATE)

--Answer 2:
select AMOUNT, (AMOUNT*100) as Amount_in_cents FROM PENALTIES GROUP BY Amount;

--Answer 3:
select avg(AMOUNT) 
from PENALTIES pt
join PLAYERS pl
on pt.PLAYERNO=pl.PLAYERNO
where pl.TOWN IN ('Inglewood','Stratford')

--Answer 4: --Doubts in Question
select sum(AMOUNT), PLAYERNO
from PENALTIES
group by PLAYERNO

--Answer 5:
select PLAYERNO
from PENALTIES
group by PLAYERNO
having count(PLAYERNO) > 1


/*--------------------------------Set Operators------------------------------------*/


--1. Get the player number and the town of each player from Inglewood and Plymouth.

select playerno,town from players
where town ='Inglewood'
union
select playerno,town from players 
where town = 'Plymouth'

SELECT PLAYERNO, TOWN FROM PLAYERS WHERE TOWN IN ('Inglewood', 'Plymouth');
--2: Get the player number and the date of birth of each player who is living in Stratford 
--and who was born after 1960.--

select playerno,BIRTH_DATE,TOWN from players
where  year(BIRTH_DATE) > 1960
intersect
select playerno,birth_date,town from players 
where town = 'Stratford'

select * from PLAYERS


/*--------------------------------Index------------------------------------*/


--1: get all information about player 44. (We assume that there is an index defined on 
--the PLAYERNO column.)--
create index playerdetails
on players(playerno)
select * from PLAYERS
where PLAYERNO=44


--2. Create an index on the POSTCODE column of the PLAYERS table.
create index postcodedetails
on players(postcode)


--3. Remove the three indexes that have been defined in the previous examples.
drop index players.playerdetails
drop index players.postcode
drop index penalties.penaltie

--4. Create a multitable index on the PLAYERNO columns of the PLAYERS and MATCHES table. --Doubt in Question




/*--------------------------------View------------------------------------*/

--1. Create a view that holds all town names from the PLAYERS table, and show the virtual contents of this new view.
create view townname
as
select TOWN from PLAYERS


select * from townname


--2. Create a view that holds the player number, name, initials, and date of birth of each player who lives in Stratford.
create view player_stratford
as
select PLAYERNO,NAME,INITIALS,BIRTH_DATE from PLAYERS where TOWN='Stratford';


select * from player_stratford;


--3. Create a view that holds all players born before 1960.
create view player_1960
as
select * from players
where  year(BIRTH_DATE) < 1960


select * from player_1960


/*--------------------------------Stored Procedures------------------------------------*/

--1. Create a stored procedure that removes all matches played by a specific player.

create proc spRemoveMatches
@p_player_no smallint
as
BEGIN
delete from MATCHES
where PLAYERNO=@p_player_no
END

EXEC spRemoveMatches 104

Select * from MATCHES


--2. Create a stored procedure that calculates the total of the penalties of a certain player. 
-----After that, call the procedure for player 27.

create proc spTotalPenalties
@p_player_no smallint
as
BEGIN
select sum(AMOUNT)
from PENALTIES
where PLAYERNO=@p_player_no
END

EXEC spTotalPenalties 27

--3. Create a stored procedure with which an existing team number is entered.

create proc spTeamExists
@p_team_no smallint
as
BEGIN
	IF EXISTS (Select TEAMNO from TEAMS where TEAMNO=@p_team_no)
		print 'Team Number exists'
	ELSE
		print 'Team Number does not exists'
END

EXEC spTeamExists 3


--4. Create a stored procedure that counts the number of rows in the PLAYERS table.

create proc spCountRowsPlayers
as
BEGIN
select count(*)
from PLAYERS
END

EXEC spCountRowsPlayers


--5. Develop a stored procedure that adds a new team.

create proc spAddNewTeam
as
BEGIN
	INSERT INTO TEAMS(TEAMNO,PLAYERNO,DIVISION)
	VALUES (3,27,'third')
END

EXEC spAddNewTeam 

select * from TEAMS


--6. Remove the DELETE_PLAYER procedure.

drop procedure spRemoveMatches


/*--------------------------------Stored Functions------------------------------------*/

--1. Create a stored function that returns the American dollar value of the penalty amounts. 
-----After that, get for each penalty the payment number and the euro and dollar value of each penalty amount.

create function empSalary
	(@emp_sal money)
	returns money
	as
	begin
		declare @emp_sal_in_euro money
		select @emp_sal_in_euro = @emp_sal *1.01 from PENALTIES
		return @emp_sal_in_euro
	end

select AMOUNT,dbo.empSalary(AMOUNT) from PENALTIES

--2. Create two stored functions that determine, respectively, the number of penalties and the number of matches of a certain player.
-----After that, get the numbers, names, and initials of those players whose number of penalties is greater than the number of matches.





/*--------------------------------Triggers------------------------------------*/

--1. Create the trigger that updates the CHANGES table automatically when rows from the PLAYERS table are removed.

CREATE TABLE CHANGES ( log_date DATE , action VARCHAR(50), id# smallint);

select * into copy_players from PLAYERS

create TRIGGER tr_players_for_delete
ON copy_players
FOR DELETE
AS
BEGIN
	Declare @id smallint
	Select @id=PLAYERNO from deleted
	insert into CHANGES
	values(GETDATE(),'DELETED',@id)
END

DELETE FROM copy_players WHERE PLAYERNO =2;

select * from copy_players

select * from CHANGES


--2. Create the UPDATE_PLAYER2 trigger that updates the CHANGES table automatically if the LEAGUENO column is changed.

create TRIGGER UPDATE_PLAYER2
ON copy_players
FOR UPDATE
AS
BEGIN
	Declare @id smallint
	Select @id=PLAYERNO from inserted
	insert into CHANGES
	values(GETDATE(),'UPDATED',@id)
END

UPDATE copy_players SET LEAGUENO=101 WHERE PLAYERNO=7;

select * from copy_players

select * from CHANGES


--3. Create a trigger on the PLAYERS table that makes sure that if a new player is added, 
----he or she is also added to the PLAYERS_MAT table.

create table PLAYERS_MAT
(log_date DATE,
log_action VARCHAR(50), id smallint);

create TRIGGER add_player
ON PLAYERS
FOR INSERT
AS
BEGIN
declare @pl_id int
select @pl_id = PLAYERNO FROM inserted
insert into PLAYERS_MAT
	VALUES(GETDATE(),'INSERT', @pl_id)
END

INSERT INTO PLAYERS(PLAYERNO, NAME, INITIALS)
VALUES(113, 'ABC', 'A');

select * from PLAYERS_MAT



