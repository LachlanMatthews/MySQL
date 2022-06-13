/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*			       Company	database			*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */


CREATE TABLE Department (
	DNumber		DECIMAL(5)		NOT NULL, /* Department number		*/
	DName		VARCHAR(30)		NOT NULL, /* Department name		*/
	Manager		CHAR(5)			NOT NULL, /* Department manager number	*/
	MSDate		DATE, 			  	  /* Manager start date     	*/
	CONSTRAINT Department_PK PRIMARY KEY(DNumber),
	CONSTRAINT Department_CK UNIQUE(DName)
);


CREATE TABLE DeptLocation (
	DNumber		DECIMAL(5)		NOT NULL, /* Department number		*/
	Address		VARCHAR(50)		NOT NULL, /* Department location	*/
	CONSTRAINT DeptLocation_PK PRIMARY KEY(DNumber, Address),
	CONSTRAINT DeptLocation_FK FOREIGN KEY(DNumber) REFERENCES Department(DNumber)
);



CREATE TABLE Employee (
	ENumber		CHAR(5)			NOT NULL, /* Employee number    	*/
	Name		VARCHAR(30)		NOT NULL, /* Employee name		*/
	DOB		Date,				  /* Date of birth		*/
	Address		VARCHAR(50),		  	  /* Home address		*/
	Sex		CHAR,			  	  /* M-Male, F-Female		*/
	Salary		DECIMAL(7,2),		  	  /* Salary			*/
	Supervisor	CHAR(5),		  	  /* Supervisor number		*/
	DNumber		DECIMAL(5), 		  	  /* Department number		*/
	CONSTRAINT Employee_PK PRIMARY KEY(ENumber),
	CONSTRAINT Employee_FK1 FOREIGN KEY (Supervisor) REFERENCES Employee(ENumber),
	CONSTRAINT Employee_FK2 FOREIGN KEY (DNumber) REFERENCES Department (DNumber)
);


CREATE TABLE Project (
	PNumber		DECIMAL(10)		NOT NULL, /* Project number		*/
	PTitle		VARCHAR(30)		NOT NULL, /* Project title		*/
	Sponsor		VARCHAR(30),		  	  /* Project sponsor name	*/
	DNumber		DECIMAL(5)		NOT NULL, /* Department number		*/
	Budget		DECIMAL(10,2)		NOT NULL, /* Project budget		*/
	CONSTRAINT Project_PK PRIMARY KEY(PNumber),
	CONSTRAINT Project_FK FOREIGN KEY (DNumber) REFERENCES Department(DNumber),
	CONSTRAINT Project_CK UNIQUE (PTitle)
);


CREATE TABLE WorksOn (
	ENumber		CHAR(5)			NOT NULL, /* Employee number		*/
	PNumber		DECIMAL(10)		NOT NULL, /* Project number		*/
	Hours		DECIMAL(3,1)		NOT NULL, /* Working hours per week	*/
	CONSTRAINT WorksOn_PK PRIMARY KEY(ENumber, PNumber),
	CONSTRAINT WorksOn_FK1 FOREIGN KEY(ENumber) REFERENCES Employee(ENumber),	
	CONSTRAINT WorksOn_FK2 FOREIGN KEY(PNumber) REFERENCES Project(PNumber)
);


CREATE TABLE Dependent (
	ENumber		CHAR(5)			NOT NULL, /* Employee number  		*/
	DName		VARCHAR(30)		NOT NULL, /* Dependent name		*/
	Sex		CHAR,				  /* Dependent sex, M-Male, F-Female */
	DOB		DATE,			  	  /* Date of birth		*/
	Relationship	VARCHAR(10),		  /* Relationship with the employee */
	CONSTRAINT Dependent_PK PRIMARY KEY(ENumber, DName),
	CONSTRAINT Dependent_FK FOREIGN KEY(ENumber) REFERENCES Employee(ENumber)
);





/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
