use Company_SD

--1	Display the Department id, name and id and the name of its manager.
select Dnum, Dname, MGRSSN, Fname    
from Departments D inner join Employee E
on E.ssn=D.MGRSSN

--	2 Display the name of the departments and the name of the projects under its control.
SELECT Dname, pname
from Project P inner join Departments D
on P.Dnum=D.DNUM



--3	Display the full data about all the dependence associated with the name of the employee they depend on him/her
SELECT * 
FROM Dependent D INNER JOIN Employee E
ON E.SSN =D.ESSN


--4.	Display the Id, name and location of the projects in Cairo or Alex city.
SELECT Pnumber, Pname, Plocation
from Project
where City ='cairo'or City ='Alex' 

--5	Display the Projects full data of the projects with a name starts with "a" letter.

SELECT * 
FROM Project
WHERE PNAME LIKE 'a%'


--6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly

select * , SALARY AS MONTH_SALARY
from Employee
where Dno=30
 AND Salary BETWEEN 1000 AND 2000

 --6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
 select * , SALARY AS MONTH_SALARY
from Employee	E
inner join Departments D
on D.Dnum=E.Dno
where Dno=30
 AND Salary BETWEEN 1000 AND 2000




--7.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.

SELECT  E.FNAME 

FROM Employee E

INNER JOIN Works_for W
on E.ssn=W.Essn
INNER JOIN  Project P
on W.Pno=P.Pnumber
where E.Dno=10 and P.PNAME ='Al Rabwah' and  W.HOURS >=10


--8.	Find the names of the employees who directly supervised with Kamel Mohamed.

SELECT X.Fname+' '+X.Lname AS SUPERVISOR , Y.Fname +' '+Y.Lname AS EMP_NAME
FROM EMPLOYEE X INNER JOIN EMPLOYEE Y
ON Y.Superssn=X.SSN
WHERE X.Fname +' '+X.Lname='Kamel Mohamed'



--9.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.

SELECT Fname, Pname

from Employee E ,Works_for W, Project P
 
 WHERE  E.SSN=W.ESSn AND P.Pnumber= W.Pno


ORDER BY Pname




--10.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.

SELECT PNUMBER , Dname, E.LNAME ,ADDRESS, BDATE 

FROM PROJECT P
INNER JOIN Departments D
ON P.DNUM=D.DNUM

INNER JOIN EMPLOYEE E
ON D.MGRSSN= E.SSN
WHERE City ='CAIRO'


--11.	Display All Data of the managers

SELECT FNAME,  E.* 
FROM Employee E INNER JOIN Departments D
ON E.SSN=D.MGRSSN


--12.	Display All Employees data and the data of their dependents even if they have no dependents

SELECT FNAME , E.* 
FROM EMPLOYEE E LEFT JOIN Dependent D
ON E.SSN=D.ESSN


--13.	Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.
 INSERT INTO Employee(DNO,SSN,Superssn,Salary)
 VALUES(30, 102672,112233,3000)


 --14.	Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him
 INSERT INTO Employee(DNO,SSN)
 VALUES(30, 102660)


 --15.	Upgrade your salary by 20 % of its last value.
 UPDATE Employee 
 SET Salary+=Salary*0.20
 WHERE SSN=112233
