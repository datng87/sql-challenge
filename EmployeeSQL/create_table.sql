-- DROP TABLE titles,salaries,employees,departments,dept_manager,dept_emp;
CREATE TABLE titles(
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(30)
);

CREATE TABLE salaries(
    emp_no VARCHAR(10) NOT NULL PRIMARY KEY,
    salary INTEGER
);

CREATE TABLE employees (
    emp_no VARCHAR(10) NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL ,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_title_id
        FOREIGN KEY (emp_title_id)
            REFERENCES titles(title_id),
    CONSTRAINT fk_emp_no
        FOREIGN KEY (emp_no)
            REFERENCES salaries(emp_no)
);

CREATE TABLE departments(
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no VARCHAR(10) NOT NULL PRIMARY KEY,
    CONSTRAINT fk_dept_no
        FOREIGN KEY (dept_no)
            REFERENCES departments(dept_no)
);

CREATE TABLE dept_emp(
    emp_no VARCHAR(10) NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
    CONSTRAINT fk_emp_no
        FOREIGN KEY (emp_no)
            REFERENCES employees(emp_no),
    CONSTRAINT fk_dept_no
        FOREIGN KEY (dept_no)
            REFERENCES departments(dept_no)
);




