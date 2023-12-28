CREATE TABLE Train
(Train_No int PRIMARY KEY,
Name varchar(255),
Capacity int,
Train_Desc varchar(255)
)

CREATE TABLE Passenger
(Passenger_ID int PRIMARY KEY,
First_Name varchar(255),
Last_Name varchar(255),
Age int,
Gender varchar(255),
Address varchar(255),
Mobile_no varchar(255)
)

CREATE TABLE Ticket
(Ticket_NO int PRIMARY KEY,
Passenger_ID int FOREIGN KEY REFERENCES Passenger(Passenger_ID),
Train_No int FOREIGN KEY REFERENCES Train(Train_No),
Ticket_Price int
)

------------------------------------------------------------------------
CREATE TABLE Station
(Station_Name varchar(255) PRIMARY KEY,
Address varchar(255)
)

CREATE TABLE Route
(Route_ID int PRIMARY KEY,
Source_Station varchar(255) FOREIGN KEY REFERENCES Station(Station_Name),
Destination_Station varchar(255) FOREIGN KEY REFERENCES Station(Station_Name),
Distance varchar(255),
Duration varchar(255)
)

CREATE TABLE Route_Intermediate_Station
(Route_ID int FOREIGN KEY REFERENCES Route(Route_ID),
Station_Name varchar(255) FOREIGN KEY REFERENCES Station(Station_Name)
)

CREATE TABLE LostAndFound
(LostAndFound_ID int PRIMARY KEY,
Station_Name varchar(255) FOREIGN KEY REFERENCES Station(Station_Name),
Claimed_By_Passenger_ID int FOREIGN KEY REFERENCES Passenger(Passenger_ID),
Found_Date DATE,
Item_Description varchar(255),
Claimed varchar(255)
)
--------------------------------------------------------------------------
CREATE TABLE Schedule
(Train_No int FOREIGN KEY REFERENCES Train(Train_No),
Route_ID int FOREIGN KEY REFERENCES Route(Route_ID),
Departure_Date DATE,
Arrival_Date DATE,
Departure_Time varchar(255),
Arrival_Time varchar(255)
)

CREATE TABLE TrainDelayHistory
(DelayHistory_ID int PRIMARY KEY,
Train_No int FOREIGN KEY REFERENCES Train(Train_No),
Date DATE,
Delay_Duration varchar(255),
Cause varchar(255),
Resolution_Details varchar(255)
)

CREATE TABLE CateringService
(CateringService_Name varchar(255) PRIMARY KEY,
Train_No int FOREIGN KEY REFERENCES Train(Train_No),
Service_Type varchar(255),
Menu_Description varchar(255),
Cost int
)

CREATE TABLE Ticket_Status
(Train_No int FOREIGN KEY REFERENCES Train(Train_No),
Confirmed varchar(255),
Waiting varchar(255)
)

CREATE TABLE Reservation 
(Passenger_ID int FOREIGN KEY REFERENCES Passenger(Passenger_ID),
Ticket_NO int FOREIGN KEY REFERENCES Ticket(Ticket_NO),
Booking_Date DATE,
Status varchar(255)
)

CREATE TABLE Complaints
(Passenger_ID int FOREIGN KEY REFERENCES Passenger(Passenger_ID),
Ticket_NO int FOREIGN KEY REFERENCES Ticket(Ticket_NO),
Complaint_Text varchar(255),
Status varchar(255),
Resolution_Text varchar(255)
)