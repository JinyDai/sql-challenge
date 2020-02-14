--1.List the following details of each employee: employee number, last name, first name, gender, and salary
select * from employees;
select * from salaries;
-- Perform an INNER JOIN on the two tables
SELECT e.emp_no,e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;
--2.List employees who were hired in 1986
select* from employees;
select emp_no,first_name,last_name,hir_date from employees
where 
hir_date>='1986-01-01' and hir_date<='1986-12-31';
--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates
select * from departments;
select * from dept_manager;
select * from employees;
select d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,dm.from_date, dm.to_date
from departments d
left join dept_manager dm on
d.dept_no=dm.dept_no
left join employees e on
e.emp_no=dm.emp_no;
--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name
select * from employees;
select * from dept_emp;
select de.emp_no,e.last_name,e.first_name,d.dept_name
from dept_emp de
join employees e on
de.emp_no=e.emp_no
join departments d
on de.dept_no=d.dept_no;
--5.List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees;
select first_name, last_name 
from employees
where first_name='Hercules'
and
last_name like 'B%';
--6.List all employees in the Sales department,
--including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
join employees e
on de.emp_no = e.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';
--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
join employees e
on de.emp_no = e.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
or d.dept_name='Development';
--8.In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
select last_name, count(last_name) as "employee count"
from employees
group by last_name
order by "employee count" desc;
