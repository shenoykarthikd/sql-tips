use AdventureWorks2017

--Recursion in SQL
--Print the hierarchy of an organization
CREATE TABLE OrgChart

      (EmpID        SMALLINT,
       EmpName      CHAR(20),
	   MgrID        SMALLINT)

INSERT INTO OrgChart VALUES (1,'Adam',0);
INSERT INTO OrgChart VALUES (2,'Alice',1);
INSERT INTO OrgChart VALUES (3,'Mary',1);
INSERT INTO OrgChart VALUES (4,'Jack',1);
INSERT INTO OrgChart VALUES (5,'Bill',2);
INSERT INTO OrgChart VALUES (6,'Jane',3);
INSERT INTO OrgChart VALUES (7,'Chris',6);
INSERT INTO OrgChart VALUES (8,'Bob',6);

select EmpID, EmpName, MgrID 
from OrgChart

--Print the hierarchy of the organization
--starting from Mary - EmpID = 3
;WITH X(EmpID, EmpName, MgrID) AS
(
	SELECT EmpID, EmpName, MgrID
	FROM OrgChart
	WHERE EmpID = 3
	UNION ALL
	SELECT B.EmpID, B.EmpName, B.MgrID
	FROM X as A 
	JOIN OrgChart as B
		ON A.EmpID = B.MgrID
)
SELECT * 
FROM X

--Print Fibonacci series
;WITH fib(f1, f2) AS
(
	SELECT 0, 1
	UNION ALL
	SELECT f2, (f1 + f2) 
	FROM fib 
	WHERE f2 < 150
)
SELECT f1 as 'Fibonacci Series' 
FROM fib 

--Print the table of 2 
;WITH x2(MultiplicationResult) AS ( 
    SELECT 1 
    UNION ALL 
    SELECT MultiplicationResult * 2 
	FROM x2
	WHERE MultiplicationResult < 1000) 
SELECT MultiplicationResult
FROM x2 