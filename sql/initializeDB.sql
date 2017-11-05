DROP DATABASE IF EXISTS BikeStore;
CREATE DATABASE BikeStore;

USE BikeStore;
CREATE TABLE Bikes
(
  bikeID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  gender BOOLEAN,
  seatHeight DOUBLE,
  type VARCHAR(20),
  picture VARCHAR(50),
  availablity VARCHAR(1) NOT NULL,
  currentHolderID INT,
  storeID INT
);

CREATE TABLE Reservations
(
  reservationID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  senderID INT NOT NULL,
  receiverID INT NOT NULL,
  bikeID INT NOT NULL,
  reservationTime TIMESTAMP NOT NULL
);

CREATE TABLE Users
(
  userID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  name VARCHAR(20),
  isManager BOOLEAN DEFAULT FALSE  NOT NULL,
  isPending BOOLEAN,
  phone VARCHAR(15),
  currentBikeID INT
);
CREATE UNIQUE INDEX Users_email_uindex ON Users (email);

CREATE TABLE Stores
(
  storeID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  hours VARCHAR(20),
  streetAddress VARCHAR(50),
  managerID INT NOT NULL
);

ALTER TABLE Bikes
  ADD CONSTRAINT Bikes_Users_userID_fk
FOREIGN KEY (currentHolderID) REFERENCES Users (userID);
ALTER TABLE Bikes
  ADD CONSTRAINT Bikes_Stores_storeID_fk
FOREIGN KEY (storeID) REFERENCES Stores (storeID);

ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Users_userID_fk
FOREIGN KEY (receiverID) REFERENCES Users (userID);
ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Users_userID_fk2
FOREIGN KEY (senderID) REFERENCES Users (userID);
ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Bikes_bikeID_fk
FOREIGN KEY (bikeID) REFERENCES Bikes (bikeID);

ALTER TABLE Stores
  ADD CONSTRAINT Stores_Users_userID_fk
FOREIGN KEY (managerID) REFERENCES Users (userID);

ALTER TABLE Users
  ADD CONSTRAINT Users_Bikes_bikeID_fk
FOREIGN KEY (currentBikeID) REFERENCES Bikes (bikeID);
