--1. List the following details of 
--	 each employee: employee number, 
--	 last name, first name, gender,
--   and salary.

select employees.emp_no,employees.first_name,
 	   employees.last_name, employees.gender,
	   salaries.salary from employees
inner join salaries on salaries.emp_no = employees.emp_no;

--------------------------------------------------------------------------------------
-- 2. List employees who were hired in 1986.

select emp_no,first_name,last_name,hire_date from employees
	where date_part('year', hire_date) = 1986;
	
--------------------------------------------------------------------------------------	
-- 3. List the manager of each department with 
--	  the following information: 
--	  department number, department name, 
--	  the manager's employee number, last name, 
--	  first name, and start and end employment dates.

select departments.dept_no, departments.dept_name,
	dept_manager.emp_no, employees.last_name,
	employees.first_name, dept_manager.from_date,
	dept_manager.to_date from departments
inner join dept_manager on dept_manager.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no;

--------------------------------------------------------------------------------------
-- 4. List the department of each employee with
--	  the following information:
--	  employee number, last name, first name, 
--	  and department name.

select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name from departments
inner join dept_emp on dept_emp.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no;

--------------------------------------------------------------------------------------
-- 5. List all employees whose first name is "Hercules" 
--	  and last names begin with "B."

select first_name, last_name from employees
where first_name = 'Hercules' and Substring(last_name,1,1) = 'B';

--------------------------------------------------------------------------------------
-- 6. List all employees in the Sales department, 
--	  including their employee number, last name,
--	  first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name from departments
inner join dept_emp on dept_emp.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
where departments.dept_name = 'Sales';

--------------------------------------------------------------------------------------
-- 7. List all employees in the Sales and Development departments, 
--	  including their employee number, last name, first name, 
--	  and department name.

select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name from departments
inner join dept_emp on dept_emp.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--------------------------------------------------------------------------------------
-- 8. In descending order, list the frequency count of employee last names,
--	  i.e., how many employees share each last name.

select last_name,Count(last_name) from employees
group by last_name
order by Count(last_name) desc;