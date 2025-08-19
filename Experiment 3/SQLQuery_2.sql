CREATE TABLE A (
    EmpID INT PRIMARY KEY,
    Ename VARCHAR(50),
  	salary INT
);

CREATE TABLE B (
    EmpID INT PRIMARY KEY,
    Ename VARCHAR(50),
  	salary INT
);

INSERT INTO A (EmpID, Ename, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO B (EmpID, Ename, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

SELECT EmpID, Ename, MIN(salary) as salary
FROM
(SELECT * from A
UNION ALL
SELECT * FROM B)
As INTERMEDIATE_RESULT
GROUP BY EmpID, Ename
