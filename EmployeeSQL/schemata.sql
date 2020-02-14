drop table departments;
create table departments(
	dept_no varchar not null,
	dept_name varchar not null,
	CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no")
);
drop table dept_emp;
create table dept_emp(
	emp_no int not null,
	dept_no varchar not null,
	from_date date not null,
	to_date date not null
);
drop table dept_manager;
create table dept_manager(
	id serial primary key,
	dept_no varchar not null,
	emp_no integer not null,
	from_date date not null,
	to_date date not null
);
drop table employees;
create table employees(
	emp_no integer not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hir_date date not null,
	constraint "pk_employees" primary key (
        "emp_no")
);
drop table salaries;
create table salaries(
	emp_no integer not null,
	salary integer not null,
	from_date date not null,
	to_date date not null,
	primary key (emp_no)
);
drop table titles;
create table titles(
	id serial primary key,
	emp_no integer not null,
	title varchar not null,
	from_date date not null,
	to_date date not null
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;
