-- Project Description: 
-- Design and develop an Academic Management System using SQL. The projects should involve 
-- three tables 1.StudentInfo 2. CoursesInfo 3.EnrollmentInfo. The Aim is to create a system that 
-- allows for managing student information and course enrollment. The project will include the 
-- following tasks:

-- 1. Database Creation: 
Create Database task1;
use task1;

-- Create StudentInfo table
Create Table StudentInfo (
STU_ID INT Primary Key,
STU_NAME Varchar(100),
DOB Date,
PHONE_NO Varchar(15),
EMAIL_ID Varchar(100),
ADDRESS Text
);

-- Create CoursesInfo table
Create Table CoursesInfo (
COURSE_ID INT Primary Key,
COURSE_NAME Varchar(100),
COURSE_INSTRUCTOR_NAME Varchar(100)
);

-- Create EnrollmentInfo table
Create Table EnrollmentInfo (
ENROLLMENT_ID INT Primary Key,
STU_ID INT,
COURSE_ID INT,
ENROLL_STATUS VARCHAR(20) Check (ENROLL_STATUS In ('Enrolled', 'Not Enrolled')),
Foreign Key (STU_ID) References StudentInfo(STU_ID),
Foreign Key (COURSE_ID) References CoursesInfo(COURSE_ID)
);

-- 2. Data Insertion

Insert Into StudentInfo Values
(1, 'Ayush Chauhan', '2000-05-10', '9876543210', 'ayush@example.com', 'Delhi'),
(2, 'Rishab Sharma', '1999-08-22', '9823456789', 'rishab@example.com', 'Mumbai'),
(3, 'K Kamal', '2001-02-15', '9765432101', 'kamal@example.com', 'Chennai');

-- Insert into CoursesInfo
Insert Into CoursesInfo Values
(101, 'SQL', 'Yamuna'),
(102, 'Python', 'Uma'),
(103, 'Data Science', 'Neethu');

-- Insert into EnrollmentInfo
Insert Into EnrollmentInfo Values
(1001, 1, 101, 'Enrolled'),
(1002, 1, 102, 'Enrolled'),
(1003, 2, 103, 'Enrolled'),
(1004, 3, 101, 'Not Enrolled');

-- 3) Retrieve the Student Information 

-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.

Select 
S.STU_NAME, 
S.PHONE_NO, 
S.EMAIL_ID, 
E.ENROLL_STATUS
From 
StudentInfo S
Left Join 
EnrollmentInfo E On S.STU_ID = E.STU_ID;
    
-- b) Write a query to retrieve a list of courses in which a specific student is enrolled.
Select 
C.COURSE_NAME
From 
EnrollmentInfo E
Join 
CoursesInfo C On E.COURSE_ID = C.COURSE_ID
Where 
E.STU_ID = 1 And E.ENROLL_STATUS = 'Enrolled';

-- c) Write a query to retrieve course information, including course name, instructor information. 
Select 
COURSE_NAME, 
COURSE_INSTRUCTOR_NAME
From 
CoursesInfo;
    
-- d) Write a query to retrieve course information for a specific course . 
Select *
From 
CoursesInfo
Where 
COURSE_ID = 102;

-- e) Write a query to retrieve course information for multiple courses. 

Select *
From 
CoursesInfo
Where 
COURSE_ID In (101, 103);
    
-- f) Test the queries to ensure accurate retrieval of student information.( execute the queries and verify the results against the expected output.)
-- Screenshot attached

-- 4. Reporting and Analytics (Using joining queries) 
-- a) Write a query to retrieve the number of students enrolled in each course

Select 
C.COURSE_NAME, 
COUNT(E.STU_ID) as num_students
From 
CoursesInfo C
Join 
EnrollmentInfo E On C.COURSE_ID = E.COURSE_ID
Where 
E.ENROLL_STATUS = 'Enrolled'
Group by 
C.COURSE_NAME;
    
Select 
S.STU_NAME, 
S.EMAIL_ID
From 
StudentInfo S
Join 
EnrollmentInfo E On S.STU_ID = E.STU_ID
Where 
E.COURSE_ID = 101 And E.ENROLL_STATUS = 'Enrolled';  

-- c) Write a query to retrieve the count of enrolled students for each instructor. 

Select 
C.COURSE_INSTRUCTOR_NAME, 
COUNT(E.STU_ID) As student_count
From 
CoursesInfo C
Join 
EnrollmentInfo E On C.COURSE_ID = E.COURSE_ID
Where 
E.ENROLL_STATUS = 'Enrolled'
Group by 
C.COURSE_INSTRUCTOR_NAME;
    
-- d) Write a query to retrieve the list of students who are enrolled in multiple courses

Select 
S.STU_NAME, 
COUNT(E.COURSE_ID) As courses_enrolled
From 
StudentInfo S
Join 
EnrollmentInfo E On S.STU_ID = E.STU_ID
Where 
E.ENROLL_STATUS = 'Enrolled'
Group By 
S.STU_ID, S.STU_NAME
Having 
COUNT(E.COURSE_ID) > 1;
    
-- e) Write a query to retrieve the courses that have the highest number of enrolled 
-- students(arranging from highest to lowest) 

Select 
C.Course_Name,
Count(E.Stu_ID) as Student_Count
From 
EnrollmentInfo E
Join 
CoursesInfo C On E.COURSE_ID = C.COURSE_ID
Where 
E.ENROLL_STATUS = 'Enrolled'
Group by 
C.Course_Name
Order by 
Student_Count;
