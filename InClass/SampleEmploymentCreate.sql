DROP TABLE IF EXISTS State;
Create table State(Id int, Name varchar(50));

Drop TABLE IF EXISTS City;
Create table City(Id int, Name varchar(50), StateId int);

Drop TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Mobile VARCHAR(15),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    CityId INT,
    StateId INT
); --changed it so it can be run multiple times without error and auto increments 

/* Original creates: 
Create table State(Id int, Name varchar(50));    
Create table City(Id int, Name varchar(50), StateId int);
Create table Employee(Id int, Name varchar(50), Email varchar(50), Mobile varchar(10), Salary decimal(10,2), Department Varchar(50), CityId int , StateId int );
*/
--Insert Data into State table---- 
Insert into State(id, Name) Values(1,'Delhi');
Insert into State(id, Name) Values(2,'U.P.');
Insert into State(id, Name) Values(3,'Maharastra');
Insert into State(id, Name) Values(4,'M.P.');

--Insert data into City Table-- 
Insert into City(id,Name, StateId) Values(1,'New Delhi',1);
Insert into City(id,Name, StateId) Values(2,'Agra',2);
Insert into City(id,Name, StateId) Values(3,'Lucknow',2);
Insert into City(id,Name, StateId) Values(4,'Noida',2);
Insert into City(id,Name, StateId) Values(5,'Mumbai',3);
Insert into City(id,Name, StateId) Values(6,'Pune',3);
Insert into City(id,Name, StateId) Values(7,'Bhopal',4);
Insert into City(id,Name, StateId) Values(8,'Indore',4);


--Insert data into Employee table 
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('John','john@gmail.com', '9988778899', 35000, 'DotNet', 1, 1);
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Peter','peter@gmail.com', '9988778800', 40000, 'Android', 1, 1);
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Mohan','mohan@gmail.com', '9988778888', 25000, 'Java', 2, 2);
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Sohan','sohan@gmail.com', '9988778855', 80000, 'DotNet', 1, 1);
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Ram','ram@gmail.com', '9988777700', 35000, 'Android', 2, 2);
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Ajay','ajay@gmail.com', '9988778811', 50000, 'DotNet', 3, 2) ;
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Sumit','sumit@gmail.com', '7588778899', 35000, 'Python', 2, 2) ;
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Martin','martin@gmail.com', '9011778899', 75000, 'DotNet', 6, 3) ;
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Sanjay','sanjay@gmail.com', '9888778899', 35000, 'Java', 2, 2) ;
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Rohit','rohit@gmail.com', '9088778899', 45000, 'DotNet', 1, 1) ;
Insert into Employee(Name,Email, Mobile, Salary,Department, CityId, StateId) Values('Mukesh','mukesh@gmail.com', '9500778899', 65000, 'Android', 7, 4) ;