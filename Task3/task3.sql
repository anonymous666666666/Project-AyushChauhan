
-- 1. Database Creation
-- Create the database
Create Database EventsManagement;
-- Use the database
Use EventsManagement;
-- 2. Table Creation
-- Events Table
Create Table Events (
    Event_Id Int Auto_Increment Primary Key,
    Event_Name Varchar(100),
    Event_Date Date,
    Event_Location Varchar(100),
    Event_Description Text
);

-- Attendees Table
Create Table Attendees (
    Attendee_Id Int Auto_Increment Primary Key,
    Attendee_Name Varchar(100),
    Attendee_Phone Varchar(15),
    Attendee_Email Varchar(100),
    Attendee_City Varchar(100)
);

-- Registrations Table
Create Table Registrations (
    Registration_Id Int Auto_Increment Primary Key,
    Event_Id Int,
    Attendee_Id Int,
    Registration_Date Date,
    Registration_Amount Decimal(10, 2),
    Foreign Key (Event_Id) References Events(Event_Id),
    Foreign Key (Attendee_Id) References Attendees(Attendee_Id)
);


-- 2. Data Creation 
-- Insert some sample data for Events, Attendees, and Registrations tables with respective fields.

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Tech Conference', '2025-08-15', 'New Delhi', 'Annual technology conference.'),
('Startup Pitch', '2025-09-10', 'Mumbai', 'Pitching event for startups.'),
('Art Expo', '2025-10-01', 'Bangalore', 'Exhibition of modern art.');

-- Sample Attendees
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('Ayush Chauhan', '1234567890', 'alice@example.com', 'Mumbai'),
('Rishab Sharma', '9876543210', 'bob@example.com', 'Delhi'),
('K Kamal', '1122334455', 'charlie@example.com', 'Chennai');

-- Sample Registrations
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 1, '2025-07-01', 100.00),
(2, 2, '2025-07-02', 150.00),
(1, 3, '2025-07-03', 100.00);


-- 3. Manage Event Details 
-- a) Inserting a new event.

INSERT Into Events (Event_Name, Event_Date, Event_Location, Event_Description)
Values ('Music Fest', '2025-11-05', 'Hyderabad', 'Live music performances.');

-- b) Updating an event's information. 
Update Events
Set Event_Location = 'Chennai'
Where Event_Id = '3';
 
 -- c) Deleting an event. 
Delete From Events
Where Event_Id = '3';

-- 4) Manage Track Attendees & Handle Events 
-- a) Inserting a new attendee. 

Insert Into Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES ('Yamuna', '4455667788', 'yamuna@example.com', 'Japan');
 
 Select * From Attendees;

-- b)Registering an attendee for an event. 
Insert Into Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (2, 5, '2025-07-10', 120.00);
Select * From Registrations;


-- 5.Develop queries to retrieve event information, generate attendee lists, and calculate event 
-- attendance statistics. 

-- a) Event Information
Select * From Events;

-- b) List Attendees

Select e.Event_Name, a.Attendee_Name, a.Attendee_Email , a.Attendee_Phone
From Registrations r
Join Events e ON r.Event_Id = e.Event_Id
Join Attendees a ON r.Attendee_Id = a.Attendee_Id;


-- c) Event Attendence Statistics
Select e.Event_Name, Count(r.Attendee_Id) As Total_Attendees
From Events e
Left Join Registrations r On e.Event_Id = r.Event_Id
Group By e.Event_Id;
