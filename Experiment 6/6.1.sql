-- INPUT TABLE:

CREATE TABLE employee_info (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    gender VARCHAR(10) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    city VARCHAR(50) NOT NULL  
);

INSERT INTO employee_info (name, gender, salary, city)  VALUES  
('Arjun', 'Male', 53000.00, 'Delhi'),
('Karan', 'Male', 61000.00, 'Mumbai'),
('Deepa', 'Female', 46000.00, 'Bangalore'),
('Rohan', 'Male', 54000.00, 'Chennai'),
('Manish', 'Male', 52500.00, 'Hyderabad'),
('Pooja', 'Female', 49000.00, 'Kolkata'),
('Sandeep', 'Male', 47500.00, 'Pune'),
('Nikhil', 'Male', 63000.00, 'Ahmedabad'),
('Neha', 'Female', 51500.00, 'Jaipur');


CREATE OR REPLACE PROCEDURE sp_get_employees_by_gender(  
    IN p_gender VARCHAR(50),  
    OUT p_employee_count INT  
)  
LANGUAGE plpgsql  
AS $$  
BEGIN  
    -- Count total employees by gender  
    SELECT COUNT(id)  
    INTO p_employee_count  
    FROM employee_info  
    WHERE gender = p_gender;  
  
    -- Display the result  
    RAISE NOTICE 'Total employees with gender %: %', p_gender, p_employee_count; END;  $$;  
  
CALL sp_get_employees_by_gender('Male', NULL);  
