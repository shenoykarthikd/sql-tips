USE AdventureWorks2017

--Difference between RowNumber, Rank, Dense_Rank and Ntile functions.
CREATE TABLE Grade
(
	StudentID		SMALLINT,
	Grade			SMALLINT,
	[Percentage]	SMALLINT
)

INSERT INTO Grade VALUES (1, 1, 65);
INSERT INTO Grade VALUES (1, 2, 65);
INSERT INTO Grade VALUES (1, 3, 70);
INSERT INTO Grade VALUES (2, 2, 55);
INSERT INTO Grade VALUES (2, 3, 65);
INSERT INTO Grade VALUES (2, 1, 65);
INSERT INTO Grade VALUES (3, 6, 95);
INSERT INTO Grade VALUES (3, 5, 75);
INSERT INTO Grade VALUES (3, 7, 75);
INSERT INTO Grade VALUES (3, 9, 85);

SELECT StudentID, Grade, [Percentage]
FROM Grade

SELECT StudentID, Grade, [Percentage]
,ROW_NUMBER() OVER (PARTITION BY StudentID ORDER BY [Percentage] ASC) AS 'Row Number'
,RANK()		  OVER (PARTITION BY StudentID ORDER BY [Percentage] ASC) AS 'Rank'
,DENSE_RANK() OVER (PARTITION BY StudentID ORDER BY [Percentage] ASC) AS 'Dense Rank'
,NTILE(3)	  OVER (PARTITION BY StudentID ORDER BY [Percentage] ASC) AS 'Ntile'
FROM Grade