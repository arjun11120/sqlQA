use sample;
--1.From the above table return complete information about the employees.
SELECT * FROM Employees;
SELECT * FROM salary_grade;

--2.From the table, write a SQL query to find the salaries of all employees. Return salary. 
SELECT salary FROM Employees;

--3.From the table, write a SQL query to find the unique designations of the employees. Return job name. 
SELECT DISTINCT job_name FROM Employees;

--4.From the following table, write a SQL query to list the employees’ names, increase their salary by 15%, and express the number of Dollars.
SELECT emp_name, FORMAT((salary + (salary*0.15)),'c') AS Salary FROM Employees;

--5.From the following table, write a SQL query to list the employee's name and job name as a format of "Employee & Job".
SELECT CONCAT(emp_name,' ',job_name)AS " Employee & Job "FROM Employees;

--6.From the following table, write a SQL query to find those employees with a hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date. 
SELECT emp_id,emp_name,salary,convert(varchar, hire_date , 107) as date FROM Employees;

--7.From the following table, write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
SELECT LEN(emp_name) AS length FROM Employees;

--8. From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees.
SELECT emp_id,salary,commission FROM Employees;

--9. From the following table, write a SQL query to find the unique department with jobs. Return department ID, Job name. 
SELECT DISTINCT dep_id,job_name FROM Employees;

--10. From the following table, write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees. (Using NOT IN)
SELECT * FROM Employees WHERE dep_id NOT IN (2001)

--11. From the following table, write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
SELECT * FROM Employees WHERE hire_date < '1991';

--12. From the following table, write a SQL query to compute the average salary of those employees who work as ‘ANALYST’. Return average salary.
SELECT CAST(AVG(salary) AS DECIMAL(10,2)) avg FROM Employees WHERE job_name = 'ANALYST';

--13. From the following table, write a SQL query to find the details of the employee ‘BLAZE’.
SELECT * FROM Employees WHERE emp_name = 'BLAZE';

--14. From the following table, write a SQL query to find those employees whose salary exceeds 3000 after giving a 25% increment. Return complete information about the employees.
SELECT * FROM Employees WHERE (SALARY + (SALARY * 0.25)) > 3000;

--15. From the following table, write a SQL query to find those employees who joined in the month January. Return complete information about the employees. 
 SELECT * FROM Employees WHERE FORMAT(hire_date,'MMMM') = 'JANUARY';

 --16. From the following table, write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary. 
 SELECT * FROM Employees WHERE hire_date < '1991-04-01';

 --17. From the following table, write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his or her salary group.(Using Between)
 SELECT e.emp_name,e.salary 
 FROM Employees e,salary_grade s 
 WHERE e.emp_name ='FRANK' AND
 e.salary = s.max_salary AND
 e.salary BETWEEN s.min_salary AND s.max_salary;

--18. From the following table, write a SQL query to list all the employees except PRESIDENT and MANAGER in ascending order of salaries. Return complete information about the employees.  (Using Order By)
 SELECT * FROM Employees WHERE job_name NOT IN ('PRESIDENT','MANAGER') ORDER BY salary;

--19. From the following table, write a SQL query to find the highest salary. Return the highest salary.
 SELECT MAX(salary) as max FROM Employees;

--20. From the table, write a SQL query to find the average salary and average total remuneration (salary and commission) for each type of job. Return name, average salary and average total remuneration. (Using GROUP BY)
	SELECT job_name,
		AVG(salary) as avg,
		AVG(salary + commission) as avg
		FROM Employees GROUP BY job_name;
--21. From the following table, write a SQL query to find those employees who work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, department location, and department name.(Using IN clause)
SELECT e.emp_id,e.emp_name,d.dep_id,d.dep_location,d.dep_name FROM Departments d,Employees e WHERE d.dep_id IN ('1001','2001');

--22. From the table, write a SQL query to list the managers and number of employees work under them. Sort the result set in ascending order on manager. Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)
SELECT manager_id,COUNT(emp_id) AS count FROM Employees WHERE manager_id IS NOT NULL GROUP BY manager_id ORDER BY manager_id ;

--23. From the table, write a SQL query to find those departments where at least two employees work. Return department id, number of employees.(GROUP BY & HAVING)
SELECT dep_id,COUNT(emp_id) AS count FROM Employees GROUP BY dep_id HAVING COUNT(emp_id) > 2;

--24. From the table, write a SQL query to find those employees whose names contain the character set 'AR' together. Return complete information about the employees. (using ‘like’)
SELECT * FROM Employees WHERE emp_name LIKE '%AR%' ;

--25. Add a column for “Gender” in the employee table and update each row accordingly. 
UPDATE Employees SET gender = 'Male' WHERE emp_id IN ('68319','66928','65646','69062','65271','66564','68454','69324');
UPDATE Employees SET gender = 'Female' WHERE emp_id NOT IN ('68319','66928','65646','69062','65271','66564','68454','69324');
SELECT * FROM Employees;

--26. From the above table we need to retrieve all employees except ‘Manager’ & ’President’ Job name. 
SELECT * FROM Employees WHERE job_name NOT IN ('MANAGER','PRESIDENT');

--27. From the above table we need to display ‘Management Level’ - labelname for ‘President’,’Manager’,’Analyst’ jobs and ‘Employee Level’ - label name for ‘Salesman’,’Clerk’ job names.
SELECT DISTINCT job_name,
	CASE
		WHEN job_name IN('MANAGER','PRESIDENT','ANALYST') THEN 'Management Level'
		WHEN job_name IN('SALESMAN','CLERK') THEN 'Employee Level'
	END AS Level
FROM Employees;
SELECT * FROM Employees;

--28 Swap gender to male to female
UPDATE Employees
   SET Gender = CASE  
                WHEN gender = 'Male' THEN 'Female'  
                ELSE 'Male'  


                END
				

