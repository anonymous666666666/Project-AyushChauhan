-- Project: Student Database Management System(PostgreSQL)

-- 1. Database Setup 
-- Create a database named "student_database." 
-- Create a table called " student_table " with the following columns: Student_id (integer), 
-- Stu_name (text), Department (text), email_id (text ),Phone_no (numeric), Address (text), 
-- Date_of_birth (date), Gender (text), Major (text), GPA (numeric),Grade (text) should be A,B,C etc.

Create Database student_database;  -- Creates Database student_database
use student_database;   -- use student_database

-- Create table student_table
Create Table student_table (  
    Student_id Int PRIMARY KEY,
    Stu_name Varchar(100),
    Department Varchar(100),
    email_id Varchar(100),
    Phone_no Bigint,
    Address Varchar(100),
    Date_of_birth Date,
    Gender Varchar(10),
    Major Varchar(100),
    GPA Decimal(4,2),
    Grade Text Check (Grade In ('A', 'B', 'C', 'D', 'F'))
);

-- 2. Data Entry 
-- Insert 10 sample records into the "student_table" using INSERT command.

Insert Into student_table Values
(1, 'Ayush Chauhan', 'Computer Science', 'ayush.chauhan@example.com', 9876543210, 'Delhi', '2002-05-14', 'Male', 'AI', 8.50, 'A'),
(2, 'Priya Sharma', 'Mechanical', 'priya.sharma@example.com', 9876543211, 'Mumbai', '2001-03-19', 'Female', 'Thermodynamics', 6.70, 'B'),
(3, 'Rohan Mehta', 'Electrical', 'rohan.mehta@example.com', 9876543212, 'Pune', '2003-12-30', 'Male', 'Power Systems', 4.30, 'C'),
(4, 'Ananya Iyer', 'Civil', 'ananya.iyer@example.com', 9876543213, 'Chennai', '2002-11-21', 'Female', 'Structural', 7.90, 'A'),
(5, 'Karan Singh', 'Computer Science', 'karan.singh@example.com', 9876543214, 'Noida', '2001-09-15', 'Male', 'ML', 5.20, 'B'),
(6, 'Sneha Nair', 'Electrical', 'sneha.nair@example.com', 9876543215, 'Bangalore', '2002-04-08', 'Female', 'Robotics', 9.10, 'A'),
(7, 'Manish Tiwari', 'Mechanical', 'manish.tiwari@example.com', 9876543216, 'Lucknow', '2000-10-10', 'Male', 'Design', 3.90, 'D'),
(8, 'Pooja Verma', 'Civil', 'pooja.verma@example.com', 9876543217, 'Jaipur', '2001-08-25', 'Female', 'GeoTech', 6.80, 'B'),
(9, 'Arjun Das', 'Computer Science', 'arjun.das@example.com', 9876543218, 'Kolkata', '2003-07-05', 'Male', 'Data Science', 9.50, 'A'),
(10, 'Neha Reddy', 'Mechanical', 'neha.reddy@example.com', 9876543219, 'Hyderabad', '2002-02-17', 'Female', 'Automation', 4.80, 'C');

Select * From student_table;
-- Develop a query to retrieve all students' information from the "student_table" and sort them in 
-- descending order by their grade.

Select * From student_table
Order By Grade Desc;


-- .Implement a query to retrieve information about all male students from the "student_table."
Select * From student_table
Where Gender = 'Male';


-- Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table."

Select * From student_table
Where GPA < 5.0;

-- Write an update statement to modify the email and grade of a student with a specific ID in the  "student_table."

Update student_table
Set email_id = 'updated.rohan@example.com',
    Grade = 'B'
Where Student_id = 3;

Select * from student_table 
Where Student_id = 3;

-- Develop a query to retrieve the names and ages of all students who have a grade of "B" from  the "student_table."

SELECT 
Stu_name,
TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM student_table
WHERE Grade = 'B'; 

-- Create a query to group the "student_table" by the "Department" and "Gender" columns and  
-- calculate the average GPA for each combination.

Select Department, Gender,
       AVG(GPA) As Average_GPA
From student_table
Group By Department, Gender;

-- Rename the "student_table" to "student_info" using the appropriate SQL statement.
Rename TABLE student_table TO student_info;

-- Write a query to retrieve the name of the student with the highest GPA from the  "student_info" table.

Select Stu_name
From student_info
Order By GPA Desc
Limit 1;
