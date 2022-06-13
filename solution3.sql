/*
(1)	For each department, find the department name and total budgets of the projects allocated 
    for the department.
*/

SELECT DName, IFNULL(SUM(Budget), 0) "Total Budget" FROM Department D LEFT OUTER JOIN Project P ON D.DNumber = P.DNumber GROUP BY DName;

/*
(2)	For each employee, find the name and total number of projects that the employee works on.
*/

SELECT name, COUNT(W.ENumber) "Total Projects" FROM Employee E LEFT OUTER JOIN WorksOn W ON E.ENumber = W.ENumber GROUP BY name; 

/*
(3)	Find the names of the all employees who work on the projects that the budgets are 
    more than $100000.
*/

SELECT name FROM Employee WHERE ENumber IN (SELECT ENumber FROM WorksOn WHERE PNumber IN (SELECT PNumber FROM Project WHERE Budget > 100000));

/*
(4)	Find the number and names of all departments that only located in NSW.
*/

SELECT DNumber, DName FROM Department WHERE DNumber IN (SELECT DNumber FROM DeptLocation WHERE Address LIKE '%NSW%' AND DNumber NOT IN (SELECT DNumber FROM DeptLocation WHERE Address NOT LIKE '%NSW%'));

/*
The queries listed below must be implemented as nested queries with EXISTS/NOT EXISTS clauses.
*/

/*
(5)	Find the number and name for the employees who have dependents.
*/

SELECT ENumber, name FROM Employee E WHERE EXISTS (SELECT ENumber FROM Dependent D WHERE E.ENumber = D.ENumber);

/*
(6)	Find the number and name for the employees who have no project.
*/

SELECT ENumber, name FROM Employee E WHERE NOT EXISTS (SELECT ENumber FROM WorksOn W WHERE E.ENumber = W.ENumber);





