/*
(1)	Find the names of all the departments that located in Wollongong.
*/

SELECT DName FROM Department WHERE DNumber IN (SELECT DNumber FROM DeptLocation WHERE Address LIKE '%Wollongong%');

/*
(2)	Find the names of all the departments that located in at least 2 addresses.
*/

SELECT DName FROM Department WHERE DNumber IN (SELECT DNumber FROM DeptLocation GROUP BY DNumber HAVING COUNT(DNumber) > 1);

/*
(3)	Find project number and title for the projects that allocated in a department GAMES.
*/

SELECT PNumber, title FROM Project WHERE DNumber IN (SELECT DNumber FROM Department WHERE DName = 'GAMES');

/*
(4)	Find employee number and name for the employees who work on projects 1002 and 1004.
*/

SELECT ENumber, name FROM Employee WHERE ENumber IN (SELECT ENumber FROM WorksOn WHERE PNumber = 1002 AND ENumber IN (SELECT ENumber FROM WorksOn WHERE PNumber = 1004));
/*
(5)	Find employee number and name (in uppercase) for all employees who were born before 1985. Format the results in the descending order of their names.
*/

SELECT ENumber, UPPER(name) FROM Employee WHERE YEAR(DOB) < 1985;

/*
(6)	Find employee number and name (in uppercase) for all employees who work on 2 or more projects. 
*/

SELECT ENumber, UPPER(name) FROM Employee WHERE ENumber IN (SELECT ENumber FROM WorksOn GROUP BY ENumber HAVING COUNT(ENumber) > 1);



