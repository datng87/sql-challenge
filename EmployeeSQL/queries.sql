-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date 
FROM employees as e
WHERE date_part('year',hire_date) = 1986;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT sub.dept_no,sub.dept_name,sub.emp_no,e.last_name,e.first_name
FROM (
    SELECT d.dept_no,d.dept_name,m.emp_no
    FROM departments as d
    LEFT JOIN dept_manager as m
    ON d.dept_no = m.dept_no
) as sub
LEFT JOIN employees e
ON sub.emp_no = e.emp_no;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT sub.emp_no,sub.last_name,sub.first_name,d.dept_name
FROM (
    SELECT e.emp_no,e.last_name,e.first_name,de.dept_no
    FROM employees e
    LEFT JOIN dept_emp de
    ON e.emp_no = de.emp_no
) as sub
LEFT JOIN departments d
ON sub.dept_no = d.dept_no;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name,sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT sub.emp_no,sub.last_name,sub.first_name,d.dept_name
FROM (
    SELECT e.emp_no,e.last_name,e.first_name,de.dept_no
    FROM employees e
    LEFT JOIN dept_emp de
    ON e.emp_no = de.emp_no
) as sub
INNER JOIN departments d
ON sub.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT sub.emp_no,sub.last_name,sub.first_name,d.dept_name
FROM (
    SELECT e.emp_no,e.last_name,e.first_name,de.dept_no
    FROM employees e
    LEFT JOIN dept_emp de
    ON e.emp_no = de.emp_no
) as sub
INNER JOIN departments d
ON sub.dept_no = d.dept_no
WHERE d.dept_name = 'Development' OR d.dept_name = 'Sales';


-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (emp_no) AS number_of_employees
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;