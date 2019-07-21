--Checking to see if all tables are populating
select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles

--Employee number, last name, gender and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--Hired in 1986
--Employees hired in 1986
select employees.hire_date, employees.last_name, employees.first_name
from employees
where hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--Department manager with department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates

select dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, employees.first_name, employees.last_name, dept_manager.from_date,dept_manager.to_date
from departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
Join employees
on dept_manager.emp_no = employees.emp_no

--List department of each employee with employee number, first/last name and department name
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, employees.last_name
from employees
where first_name = 'Hercules' and last_name Like 'B%'

--List all the employees in the sales department with employee #, last name, first name, and department name
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on dept_emp.emp_no = employees.emp_no
join departments
on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'

-- List all employees in the Sales and Development departments with employee number, last name, first name, and 
--department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

-- In decending order list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name,
count(last_name) As "frequency"
From employees
group by last_name
order by count(last_name) desc