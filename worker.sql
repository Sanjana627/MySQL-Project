create database worker;
use worker;
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
    

        


    




