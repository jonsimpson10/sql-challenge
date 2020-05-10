CREATE TABLE titles (
    title_id VARCHAR(20)   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no VARCHAR(20)   NOT NULL,
    emp_title_id VARCHAR(20)   NOT NULL,
    birth_date VARCHAR(30)   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(7)   NOT NULL,
    hire_date VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no),
    CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
    REFERENCES titles (title_id)
);

CREATE TABLE salaries (
    emp_no VARCHAR(20)   NOT NULL,
    salary float   NOT NULL,
    CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
    REFERENCES employees (emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR(20)   NOT NULL,
    dept_name VARCHAR(200)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no VARCHAR(20)   NOT NULL,
    dept_no VARCHAR(20)   NOT NULL,
    CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
    REFERENCES employees (emp_no),
    CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
    REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(20)   NOT NULL,
    emp_no VARCHAR(20)   NOT NULL,
    CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
    REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
    REFERENCES employees (emp_no)
);