-- Drop and recreate the database
DROP DATABASE IF EXISTS CaribResortDatasheet;
CREATE DATABASE CaribResortDatasheet;
USE CaribResortDatasheet;

-- Create Guest table
CREATE TABLE Guest (
    GuestID INT AUTO_INCREMENT,
    Guest_fname VARCHAR(50),
    Guest_lname VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Armband_color VARCHAR(10),
    Armband_qr_code VARCHAR(255),
    PRIMARY KEY (GuestID)
);

-- Create Bartender table first to avoid foreign key issues
CREATE TABLE Bartender (
    Bartender_ID INT AUTO_INCREMENT,
    Bartender_fname VARCHAR(50),
    Bartender_lname VARCHAR(50),
    PRIMARY KEY (Bartender_ID)
);

-- Now create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT,
    GuestID INT,
    Order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Bartender_id INT,
    OrderStatus VARCHAR(20),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (Bartender_id) REFERENCES Bartender(Bartender_ID)
);

-- Create Drink table
CREATE TABLE Drink (
    Drink_ID INT AUTO_INCREMENT,
    Drink_name VARCHAR(100),
    Category ENUM('Alcoholic', 'Non-Alcoholic'),
    Drink_price DECIMAL(10, 2),
    PRIMARY KEY (Drink_ID)
);

-- Create Report table
CREATE TABLE Report (
    Report_ID INT AUTO_INCREMENT,
    Date_range DATE,
    Drink_ID INT,
    Frequency INT,
    PRIMARY KEY (Report_ID),
    FOREIGN KEY (Drink_ID) REFERENCES Drink(Drink_ID)
);

-- Create Manager table
CREATE TABLE Manager (
    Manager_ID INT AUTO_INCREMENT,
    Manager_name VARCHAR(100),
    Manager_role VARCHAR(50),
    PRIMARY KEY (Manager_ID)
);

SHOW TABLES;

-- Insert a guest
INSERT INTO Guest (Guest_fname, Guest_lname, Gender, Age, Armband_color, Armband_qr_code)
VALUES ('John', 'Doe', 'Male', 25, 'Orange', 'QR123');

-- Insert a bartender
INSERT INTO Bartender (Bartender_fname, Bartender_lname)
VALUES ('Jane', 'Smith');

-- Insert a drink
INSERT INTO Drink (Drink_name, Category, Drink_price)
VALUES ('Margarita', 'Alcoholic', 7.50);

-- Insert an order (ensure the GuestID and Bartender_ID are valid from previous inserts)
INSERT INTO Orders (GuestID, Bartender_id, OrderStatus)
VALUES (1, 1, 'Completed');

-- Check the data in Guest
SELECT * FROM Guest;

-- Check the data in Bartender
SELECT * FROM Bartender;

-- Check the data in Orders
SELECT * FROM Orders;
