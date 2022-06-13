/*
(1)	Add a new department SERVICES into the database. The department number is 7. 
    	The employee 00105 becomes a manager that works in the department SERVICES. 
	His job started at 31/08/2018. 
	The new department SERVICES located at 10 Church street, Wollongong, NSW 2500. 
	The supervisor number of the employee 00105 is 00100.
*/

INSERT INTO Department VALUES(7, 'SERVICES', '00105', STR_TO_DATE('31/08/2018', '%d/%m/%y'));
INSERT INTO DeptLocation VALUES(7, '10 Church street, Wollongong, NSW 2500');
UPDATE Employee SET Supervisor = '00100' WHERE ENumber = '00105';

/*
(2)	An employee 00110 starts to work in the department ACCOUNTING as a manager at 01/09/2018. 
    	An employee 00120 starts to work in the department SALES as a manager at the same day. 
    	Note: The employees supervised by their department managers should also be updated.
*/

INSERT INTO Employee VALUES('99999', 'Temp', NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE Department SET Manager = '99999' WHERE DName = 'ACCOUNTING';
UPDATE Employee SET Supervisor = '99999' WHERE DNumber IN (SELECT DNumber FROM Department WHERE DName = 'ACCOUNTING');

UPDATE Department SET Manager = '00120', MSDate = STR_TO_DATE('01/09/2018', '%d/%m/%y') WHERE DName = 'SALES';
UPDATE Employee SET Supervisor = '00120' WHERE DNumber IN (SELECT DNumber FROM Department WHERE DName = 'SALES');

UPDATE Department SET Manager = '00110', MSDate = STR_TO_DATE('01/09/2018', '%d/%m/%y') WHERE DName = 'ACCOUNTING';
UPDATE Employee SET Supervisor = '00110' WHERE DNumber IN (SELECT DNumber FROM Department WHERE DName = 'ACCOUNTING');

DELETE FROM Employee WHERE name = 'Temp';

/*
(3)	An employee 00200 decided to quit a job. The employee 00136 has been promoted to manage 
    	the department that the employee 00200 managed. Remove all information about the 
	employee 00200 from the database. Update all information for a new manager 00136.
*/

INSERT INTO Employee VALUES('99999', 'Temp', NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE Department SET Manager = '99999' WHERE Manager = '00200';
UPDATE Employee SET Supervisor = '99999' WHERE Supervisor = '00200';
DELETE FROM WorksOn WHERE ENumber = '00200';
DELETE FROM Dependent WHERE ENumber = '00200';
DELETE FROM Employee WHERE ENumber = '00200';

UPDATE Department SET Manager = '00136' WHERE Manager = '99999';
UPDATE Employee SET Supervisor = '00136' WHERE Supervisor = '99999';









