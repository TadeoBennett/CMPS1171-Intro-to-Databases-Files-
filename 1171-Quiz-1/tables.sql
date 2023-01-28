CREATE TABLE employees (
	employee_id serial PRIMARY KEY,
	name text NOT NULL,
	job text NOT NULL,
	salary int NOT NULL
);


INSERT INTO employees (name, job, salary)
VALUES
('Tadeo', 'Developer', 60000),
('Mathew', 'Technical Writer', 55000),
('Mark', 'Brogrammer', 80000),
('Luke', 'Secretary', 45000),
('John', 'Database Administrator', 90000);


SELECT name
FROM employees
ORDER BY name
DESC;
