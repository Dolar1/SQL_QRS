---------------------------------------
--ASIGNMENT
---------------------------------------

--CREATE TABLE => Worker, Bonus, Title 
create table Worker(
	WORKER_ID int,
	FIRST_NAME varchar(50),
	LAST_NAME varchar(50),
	SALARY int,
	JOINING_DATE DATE,
	DEPARTMENT varchar(50),
)

create table Bonus(
	WORKER_REF_ID int,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
)

create table Title(
	WORKER_REF_ID int,
	WORKER_TITLE varchar(50),
	AFFECTED_FROM DATE,
)

--------------------------------------------
--DROP TABLES..
DROP TABLE Worker;
DROP TABLE Bonus;
DROP TABLE Title;

--TRUNCATE TABLE
TRUNCATE  TABLE Worker;
TRUNCATE  TABLE Bonus;
TRUNCATE  TABLE Title;
--------------------------------------------

--------------------------------------------
		--SELECT ALL
select * from Worker
select * from Bonus
select * from Title
--------------------------------------------

insert into Worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
values
(001, 'Monika', 'Arora', 100000, CONVERT(Datetime, '2014-02-20 09:00:00', 120), 'HR'),
(002, 'Niharika', 'Verma', 80000, CONVERT(Datetime, '2014-06-11 09:00:00', 120), 'Admin'),
(003, 'Vishal', 'Singhal', 300000, CONVERT(Datetime, '2014-02-20 09:00:00', 120), 'HR'),
(004, 'Amitabh', 'Singh', 500000, CONVERT(Datetime, '2014-02-20 09:00:00', 120), 'Admin'),
(005, 'Vivek', 'Bhati', 500000, CONVERT(Datetime, '2014-06-11 09:00:00', 120), 'Admin'),
(006, 'Vipul', 'Diwan', 200000, CONVERT(Datetime, '2014-06-11 09:00:00', 120), 'Account'),
(007, 'Satish', 'Kumar', 75000, CONVERT(Datetime, '2014-01-20 09:00:00', 120), 'Account'),
(008, 'Geetika', 'Chauhan', 90000, CONVERT(Datetime, '2014-04-11 09:00:00', 120), 'Admin');

insert into Bonus(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
values
(001, 5000, CONVERT(Datetime, '2016-02-20', 120)),
(002, 3000, CONVERT(Datetime, '2016-06-11', 120)),
(003, 4000, CONVERT(Datetime, '2016-02-20', 120)),
(001, 4500, CONVERT(Datetime, '2016-02-20', 120)),
(002, 3500, CONVERT(Datetime, '2016-06-11', 120));


INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
values
(001, 'Manager', CONVERT(Datetime, '2016-02-20 00:00:00', 120)),
(002, 'Executive', CONVERT(Datetime, '2016-06-11 00:00:00', 120)),
(008, 'Executive', CONVERT(Datetime, '2016-06-11 00:00:00', 120)),
(005, 'Manager', CONVERT(Datetime, '2016-06-11 00:00:00', 120)),
(004, 'Asst. Manager', CONVERT(Datetime, '2016-06-11 00:00:00', 120)),
(007, 'Executive', CONVERT(Datetime, '2016-06-11 00:00:00', 120)),
(006, 'Lead', CONVERT(Datetime, '2016-06-11 00:00:00', 120)),
(003, 'Lead', CONVERT(Datetime, '2016-06-11 00:00:00', 120));


------------------------------------------------------------------------
							--Exercise:
------------------------------------------------------------------------

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;


--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) AS WORKER_NAME FROM WORKER;


--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;


--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT  SUBSTRING(FIRST_NAME, 1, 3) FROM WORKER;


--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.



--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM WORKER;


--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM WORKER;


--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LEN(DEPARTMENT) FROM WORKER;


--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM WORKER;


--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM WORKER;


--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY FIRST_NAME ASC


--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY FIRST_NAME ASC , DEPARTMENT DESC


--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul','Satish')


--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * INTO #TEMPTABLE FROM Worker WHERE FIRST_NAME IN ('Vipul','Satish')
ALTER TABLE #TEMPTABLE DROP COLUMN FIRST_NAME
SELECT * FROM #TEMPTABLE 
DROP TABLE #TEMPTABLE


--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM Worker WHERE DEPARTMENT LIKE ('Admin')


--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE ('%a%')


--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE ('%a')


--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Worker WHERE FIRST_NAME LIKE ('%h') AND len(FIRST_NAME) = 6
--OR
SELECT * FROM Worker WHERE FIRST_NAME LIKE ('_____h') AND len(FIRST_NAME) = 6


--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;


--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2


--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(DEPARTMENT) FROM WORKER WHERE DEPARTMENT LIKE ('Admin');


--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM  WORKER WHERE SALARY >= 100000 AND SALARY <= 500000;


--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DISTINCT DEPARTMENT, COUNT(WORKER_ID) AS NUM FROM WORKER
GROUP BY DEPARTMENT
ORDER BY NUM DESC


--Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');


--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.



--Q-26. Write an SQL query to show only odd number workers from a table.
SELECT * FROM Worker WHERE WORKER_ID % 2 = 1;


--Q-27. Write an SQL query to show only even number from a table.
SELECT * FROM Worker WHERE WORKER_ID % 2 = 0;


--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO CLONED_TABLE
FROM Worker;
SELECT * FROM CLONED_TABLE

--Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT WORKER_ID FROM Worker
INTERSECT
SELECT WORKER_REF_ID FROM Title 


--Q-30. Write an SQL query to show records from one table that another table does not have.



--Q-31. Write an SQL query to show the current date and time.
SELECT GETDATE();



--Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT TOP 10 * FROM Worker ORDER BY WORKER_ID ASC


--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT DISTINCT TOP 5 SALARY  INTO #TEMPTABLE FROM Worker ORDER BY SALARY DESC
SELECT * FROM #TEMPTABLE
SELECT TOP 1 * FROM #TEMPTABLE ORDER BY SALARY ASC
DROP TABLE #TEMPTABLE


--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT WORKER_ID, SALARY FROM Worker W1
WHERE 4 = --(N - 1)
(
	SELECT COUNT (DISTINCT SALARY) FROM Worker W2
	WHERE W2.SALARY > W1.SALARY
)


--Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT * FROM Worker W1 JOIN Worker W2
ON W1.SALARY = W2.SALARY
AND W1.WORKER_ID <> W2.WORKER_ID



--Q-36. Write an SQL query to show the second highest salary from a table.
SELECT DISTINCT TOP 3 SALARY, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME FROM Worker
ORDER BY SALARY DESC


--Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM worker WHERE FIRST_NAME = 'Monika'
union ALL
SELECT * FROM worker WHERE FIRST_NAME = 'Monika';


--Q-38. Write an SQL query to fetch intersecting records of two tables.
SELECT WORKER_ID FROM Worker
INTERSECT
SELECT WORKER_REF_ID FROM Title 


--Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE
WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM Worker)


--Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) as NUM INTO #TEMPTABLE
FROM Worker
GROUP BY DEPARTMENT
SELECT * FROM #TEMPTABLE
SELECT * FROM #TEMPTABLE WHERE NUM < 4
DROP TABLE #TEMPTABLE


--Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(WORKER_ID) as NUM
FROM Worker
GROUP BY DEPARTMENT


--Q-42. Write an SQL query to show the last record from a table.
SELECT TOP 1 * FROM Worker ORDER BY WORKER_ID DESC


--Q-43. Write an SQL query to fetch the first row of a table.
SELECT TOP 1 * FROM Worker ORDER BY WORKER_ID ASC


--Q-44. Write an SQL query to fetch the last five records from a table.
SELECT TOP 5 * INTO #TEMPTABLE FROM Worker ORDER BY WORKER_ID DESC
SELECT * FROM #TEMPTABLE ORDER BY WORKER_ID ASC
DROP TABLE #TEMPTABLE


--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT MAX(SALARY), DEPARTMENT FROM Worker 
GROUP BY DEPARTMENT


--Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT DISTINCT TOP 3 SALARY, COUNT(WORKER_ID) AS NO_OF_EMP FROM Worker
GROUP BY SALARY
ORDER BY SALARY DESC


--Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT TOP 3 SALARY, COUNT(WORKER_ID) AS NO_OF_EMP FROM Worker
GROUP BY SALARY
ORDER BY SALARY ASC


--Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT WORKER_ID, SALARY FROM Worker W1
WHERE 6 = --(N - 1)
(
	SELECT COUNT (DISTINCT SALARY) FROM Worker W2
	WHERE W2.SALARY > W1.SALARY
)


--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY FROM Worker
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC


--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT * FROM WORKER 
WHERE SALARY IN (SELECT MAX(SALARY) FROM WORKER)


--Q-51. List all the workers with their bonuses and print them in the ranked order of highest to lowest bonus 
SELECT * INTO #TEMPTABLE FROM WORKER W1
INNER JOIN
Bonus B1
ON W1.WORKER_ID = B1.WORKER_REF_ID
SELECT * FROM #TEMPTABLE
ORDER BY BONUS_AMOUNT DESC
DROP TABLE #TEMPTABLE


--Q-52. Whoever is not having bonus should be given a default bonus of 1000 and included in the list above 
SELECT WORKER_ID, FIRST_NAME, SALARY, 1000 AS BONUS_AMOUNT INTO #TEMPTABLE
FROM   WORKER W1
WHERE  NOT EXISTS
  (SELECT *
   FROM   Bonus B1
   WHERE  B1.WORKER_REF_ID = W1.WORKER_ID)
SELECT * FROM #TEMPTABLE
DROP TABLE #TEMPTABLE

--Q-53. Rank workers by order of number of years of experience based on joining date 
SELECT 
	WORKER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT,
	convert(INT,DATEDIFF(MONTH, JOINING_DATE, GETDATE())/12) AS YEARS,
	convert(INT,DATEDIFF(MONTH, JOINING_DATE, GETDATE()) % 12) AS MONTHS,
    convert(varchar(3),DATEDIFF(MONTH, JOINING_DATE, GETDATE())/12) +' years '+
    convert(varchar(2),DATEDIFF(MONTH, JOINING_DATE, GETDATE()) % 12)+ ' months' 
    AS EXPERIENCE
FROM WORKER
ORDER BY YEARS DESC


--Q-54. Update the bonus table to give a bonus of 1000 /- for those people for whom there is no BONUS.
SELECT * INTO #TEMPTABLE FROM WORKER W1
FULL OUTER JOIN
Bonus B1
ON W1.WORKER_ID = B1.WORKER_REF_ID
SELECT WORKER_ID, FIRST_NAME, SALARY,  ISNULL(BONUS_AMOUNT, 1000 ) FROM #TEMPTABLE
ORDER BY BONUS_AMOUNT DESC
DROP TABLE #TEMPTABLE


--Q-55. List the employees who have managers as EXECUTIVE only and rank them in descending order of their salary.



--Q-56. Display employee details with their total experience in the company, rank them accordingly.
SELECT * FROM WORKER
SELECT 
	WORKER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT,
	convert(INT,DATEDIFF(MONTH, JOINING_DATE, GETDATE())/12) AS YEARS,
	convert(INT,DATEDIFF(MONTH, JOINING_DATE, GETDATE()) % 12) AS MONTHS,
    convert(varchar(3),DATEDIFF(MONTH, JOINING_DATE, GETDATE())/12) +' years '+
    convert(varchar(2),DATEDIFF(MONTH, JOINING_DATE, GETDATE()) % 12)+ ' months' 
    AS EXPERIENCE
FROM WORKER
ORDER BY YEARS DESC, MONTHS DESC