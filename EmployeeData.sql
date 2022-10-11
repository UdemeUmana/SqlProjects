create database Portfolio;
use portfolio;
#Creating an Employees data Table
Create table EmployeeData(EmployeeId int,Firstname varchar(50),Lastname varchar(50),Age int,Title varchar(50),Gender varchar(2));

#Inserting Data into my EmployeesData table
Insert into EmployeeData values 
(101,'Glory','Paul',17,'single','F'),
(102,'Ubong','James',21,'Single','M'),
(103,'James','Gold',38,'Married','M'),
(104,'Udeme','Umana',28,'Single','F'),
(105,'Emem','Edet',31,'Married','F'),
(106,'Imo','Edem',18,'Single','M'),
(107,'Aniekan','John',42,'Married','M'),
(108,'Uwana','Bassey',26,'Single','F'),
(109,'flora','Peter',29,'Married','F'),
(110,'Caleb','Joe',30,'Single','M');

#creating an employees salary table
create table EmployeeSalary(
EmployeeId int,
Jobtitle varchar(50),
Salary int,
JobType varchar(2)
);

#Inseting data into my Employeesalary tabel
#PT-Parttime,IT-Internship,FT-fulltime
insert into Employeesalary values
(101, 'SoftwareEngineer',158000,'PT'),
(102,'BackendDeveloper',128000,'FT'),
(103,'Ui/UxDesigner',101000,'FT'),
(104,'DataAnalyst',78000,'IT'),
(105,'Accountant',90000,'FT'),
(106,'Accountant',50000,'PT'),
(107,'SecurityAnalyst',148000,'FT'),
(108,'DataScientist',178000,'FT'),
(109,'DataAnalyst',120000,'FT'),
(110,'Lawyer',101000,'FT');

#viewing my Employeedata 
select * from Employeedata;

#Selecting the EmployeeId,Firstname,lastname
select EmployeeId,Firstname,lastname
from Employeedata;

#Display the EmployeeId,firstname and lastname of male employees
select Employeeid,firstname,lastname
from employeedata
where Gender= 'M';

#Finding out the number of male and female employees
select Gender, count(Gender) as Num_gender
from employeedata
group by Gender;

#finding out the highest paid employee
select employeedata.Employeeid,firstname,lastname,max(salary)
from employeedata
inner join employeesalary
on employeedata.employeeid = employeesalary.employeeid;

#Displaying the Employeeid,firstname,lastname and age in asc
select employeedata.Employeeid,firstname,lastname,Age
from employeedata
inner join employeesalary
on employeedata.employeeid = employeesalary.employeeid
group by age
order by age asc;

#Calculating raise for each employee according to their jobtitle
select Employeeid,jobtitle,salary,
case
	when jobtitle = 'DataScientist' then salary +(salary*4)
    when jobtitle ='DataAnalyst' then salary+(salary*3)
    else salary+(salary*2)
End as SalaryAfterRaise
    from employeesalary;

#Displaying the jobtitle that has more than one employee with the number of employee
select jobtitle,count(jobtitle) as countJob
from employeesalary
group by jobtitle
having count(jobtitle) >1;

#Updating Uwana's title to married 
update employeedata
set title = 'married'
where employeeid = 108;

#Adding the firstname and lastname to get a fullname
select concat(firstname," " ,lastname) as fullname
from employeedata;

