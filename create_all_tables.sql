-- Create database (optional)
CREATE DATABASE TruckingBusiness;
USE TruckingBusiness;

-- DRIVER table
CREATE TABLE Driver (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address TEXT,
    DOB DATE,
    SSN VARCHAR(20) UNIQUE
);

-- BUSINESS OWNER table
CREATE TABLE BusinessOwner (
    OwnerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address TEXT,
    DOB DATE,
    SSN VARCHAR(20) UNIQUE,
    USDOT VARCHAR(20)
);

-- DISPATCHER table
CREATE TABLE Dispatcher (
    DispatcherID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address TEXT,
    DOB DATE,
    SSN VARCHAR(20) UNIQUE
);

-- TRUCK table
CREATE TABLE Truck (
    TruckID INT PRIMARY KEY AUTO_INCREMENT,
    PlateNumber VARCHAR(20) UNIQUE,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Status VARCHAR(20) -- e.g., Active, Repair, Retired
);

-- TRAILER table
CREATE TABLE Trailer (
    TrailerID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(50),
    Length DECIMAL(5,2), -- in feet
    Capacity DECIMAL(10,2) -- in lbs or tons
);

-- BROKER table
CREATE TABLE Broker (
    BrokerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    USDOT VARCHAR(20)
);

-- FACTORING COMPANY table
CREATE TABLE FactoringCompany (
    FactoringCompanyID INT PRIMARY KEY AUTO_INCREMENT,
    BankName VARCHAR(100),
    RoutingNumber VARCHAR(20)
);

-- LOAD table (central table that connects everything)
CREATE TABLE Load (
    LoadID INT PRIMARY KEY AUTO_INCREMENT,
    PickupLocation VARCHAR(100),
    DropoffLocation VARCHAR(100),
    PickupDate DATE,
    DropoffDate DATE,
    Weight DECIMAL(10,2),
    DriverID INT,
    TruckID INT,
    TrailerID INT,
    DispatcherID INT,
    BrokerID INT,
    FactoringCompanyID INT,
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (TruckID) REFERENCES Truck(TruckID),
    FOREIGN KEY (TrailerID) REFERENCES Trailer(TrailerID),
    FOREIGN KEY (DispatcherID) REFERENCES Dispatcher(DispatcherID),
    FOREIGN KEY (BrokerID) REFERENCES Broker(BrokerID),
    FOREIGN KEY (FactoringCompanyID) REFERENCES FactoringCompany(FactoringCompanyID)
);
