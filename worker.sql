create database worker;
use worker;
## FIRST TABLE 
CREATE TABLE workerInfo (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
    SALARY BIGINT,
    JOINING_DATE DATETIME,
	Department CHAR(25));

show tables;
select * from workerInfo;
INSERT INTO workerInfo (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,Department) VALUES
(001, 'Monika', 'Arora',100000,'2014-02-20 09:00:00','HR'),
(002, 'Niharika', 'Verma',80000,'2014-06-11 09:00:00','Admin'),
(003, 'Vishal', 'Singhal',300000,'2014-02-20 09:00:00', 'HR'),
(004, 'Amitabh', 'Singh',500000,'2014-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000,'2014-06-11 09:00:00','Admin'),
(006, 'Vipul', 'Diwan', 200000,'2014-06-11 09:00:00','Account'),
(007, 'Satish', 'Kumar', 75000,'2014-01-20 09:00:00','Account'),
(008, 'Geetika', 'Chauhan', 90000,'2014-04-11 09:00:00','Admin');

## SECOND TABLE
CREATE TABLE BonusInfo (
	WORKER_REF_ID INT NOT NULL,
    BONUS_DATE DATETIME,
	BONUS_AMOUNT BIGINT
	);
show tables;
select * from BonusInfo;    
INSERT INTO BonusInfo
		(WORKER_REF_ID ,BONUS_DATE,BONUS_AMOUNT) VALUES
		(1,'2016-02-20 00:00:00',5000),
		(2,'2016-06-11 00:00:00',3000),
		(3,'2016-02-20 00:00:00',4000),
		(1,'2016-02-20 00:00:00',4500),
		(2,'2016-06-11 00:00:00',3500);

## THIRD TABLE        
CREATE TABLE TitleInfo (
	WORKER_REF_ID INT NOT NULL,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME
	);
show tables;
select * from TitleInfo;
INSERT INTO TitleInfo (WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8, 'Executive','2016-06-11 00:00:00'),
(5, 'Manager','2016-06-11 00:00:00'),
(4,'Asst.Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00');

## 50 SQL QUERIES

#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME as WORKER_NAME from workerInfo;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(FIRST_NAME) from workerInfo;

#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table
select distinct Department from workerinfo;

#Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
select substring(FIRST_NAME,1,3) FROM workerinfo;
    
#Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
Select INSTR(FIRST_NAME, BINARY'a') from workerInfo where FIRST_NAME = 'Amitabh';
 
 #Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from workerInfo;

#Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
Select LTRIM(DEPARTMENT) from workerInfo;

#Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(Department) from workerinfo;

#Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select REPLACE(FIRST_NAME,'a','A') from workerinfo;
    
#Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME from workerinfo;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from workerinfo order by FIRST_NAME ASC;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from workerinfo order by FIRST_NAME ASC, Department DESC;

#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from workerinfo where FIRST_NAME in ('Vipul','Satish');

#Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from workerinfo where FIRST_NAME not in ('Vipul','Satish');

#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from workerInfo where Department ='Admin';

#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from workerInfo where FIRST_NAME like '%a%';

#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from workerInfo where FIRST_NAME like '%a';

#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from workerInfo where FIRST_NAME like '______h';

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from workerInfo where SALARY BETWEEN 100000 AND 500000;

#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
Select * from workerInfo where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from workerInfo where Department='Admin';

#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM workerInfo 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM workerInfo 
WHERE SALARY BETWEEN 50000 AND 100000);

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select count(*) No_Of_Workers,Department from workerInfo group by Department order by No_Of_Workers  DESC;

#Q-24. Write an SQL query to print details of the Workers who are also Managers
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM workerInfo W
INNER JOIN TitleInfo T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager'); 

#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM TitleInfo
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

#Q-26. Write an SQL query to show only odd rows from a table.
select * from workerInfo where WORKER_ID%2!=0;

#Q-27. Write an SQL query to show only even rows from a table. 
select * from workerInfo where WORKER_ID%2=0;

#Q-28. Write an SQL query to clone a new table from another table.
create table new_table as select * from workerInfo;

#Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT * FROM WorkerInfo W
INNER JOIN
TitleInfo T ON W.WORKER_ID=T.WORKER_REF_ID;

#Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM WorkerInfo W
LEFT JOIN
TitleInfo T ON W.WORKER_ID=T.WORKER_REF_ID;

#Q-31. Write an SQL query to show the current date and time.
select sysdate();

#Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from workerInfo order by SALARY DESC LIMIT 4;

#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from workerInfo order by SALARY DESC LIMIT 4,1;

#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT Salary
FROM workerInfo W
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W1.SALARY ) )
 FROM workerInfo W1
 WHERE W1.SALARY >= W.SALARY
 );

#Q-35. Write an SQL query to fetch the list of employees with the same salary. 
Select distinct W.WORKER_ID, W.FIRST_NAME, W.SALARY 
from workerInfo W, workerInfo W1 
where W.SALARY = W1.SALARY and W.WORKER_ID != W1.WORKER_ID;

#Q-36. Write an SQL query to show the second highest salary from a table.
select * from workerInfo order by SALARY DESC LIMIT 2,1;

#Q-37. Write an SQL query to show one row twice in results from a table. 
select FIRST_NAME, Department from workerInfo W where W.Department='HR' 
union all 
select FIRST_NAME, Department from workerInfo W1 where W1.Department='HR';

#Q-38. Write an SQL query to fetch intersecting records of two tables.
SELECT * FROM WorkerInfo W
INNER JOIN
TitleInfo T ON W.WORKER_ID=T.WORKER_REF_ID;


#Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from workerInfo where WORKER_ID <=(select count(WORKER_ID)/2 from workerInfo);

#Q-40. Write an SQL query to fetch the departments that have less than five people in it. 
select Department,count(WORKER_ID) from workerInfo group by Department having count(WORKER_ID)<5;

#Q-41. Write an SQL query to show all departments along with the number of people in there.
select count(Department),Department from workerInfo group by Department;

#Q-42. Write an SQL query to show the last record from a table.
select * from workerInfo LIMIT 7,1;

#Q-43. Write an SQL query to fetch the first row of a table.
Select * from workerInfo where WORKER_ID = (SELECT min(WORKER_ID) from workerInfo);

#Q-44. Write an SQL query to fetch the last five records from a table.
select * from workerInfo LIMIT 3,5;

#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT Department ,MAX(SALARY) FROM workerInfo GROUP BY Department;

#Q-46. Write an SQL query to fetch three max salaries from a table. 
SELECT distinct SALARY from workerInfo W WHERE 3 >= (SELECT count(distinct SALARY) from workerInfo W1 WHERE W.SALARY <= W1.SALARY) order by W.SALARY desc;
 
#Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct SALARY from workerInfo W WHERE 3 >= (SELECT count(distinct SALARY) from workerInfo W1 WHERE W.SALARY >= W1.SALARY) order by W.SALARY desc;

#Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct SALARY from workerInfo W WHERE 2 >= (SELECT count(distinct SALARY) from workerInfo W1 WHERE W.SALARY <= W1.SALARY) order by W.SALARY desc;

#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them. 
select Department,sum(SALARY) as TOTAL_SALARY from workerInfo group by Department;

#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select * from workerInfo where SALARY=(Select max(SALARY) from workerInfo);