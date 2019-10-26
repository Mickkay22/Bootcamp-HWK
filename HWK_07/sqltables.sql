drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table titles;
drop table salaries;

Create table departments
(
	dept_no varchar(20) primary key ,
	dept_name varchar(40)
);

Create table dept_emp
(
	emp_no int primary key,
	dept_no varchar(20),
	from_date DATE,
	to_date DATE
);

Create table dept_manager
(
	dept_no varchar(20) primary key,
	emp_no int,
	from_date DATE,
	to_date DATE
);

Create table employees
(
	emp_no int primary key ,
	birth_date DATE,
	first_name varchar(50),
	last_name varchar(50),
	gender varchar(10),
	hire_date DATE
);

Create table salaries
(
	emp_no int primary key,
	salary int, 
	from_date DATE,
	to_date DATE
);

Create table titles
(
	emp_no int primary key,
	title varchar(40),
	from_date DATE,
	to_date DATE
);

