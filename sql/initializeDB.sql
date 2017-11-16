DROP DATABASE IF EXISTS BikeStore;
CREATE DATABASE BikeStore;

USE BikeStore;
CREATE TABLE Bikes
(
  bikeID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  gender ENUM('male','female','neutral') NOT NULL,
  seatHeight DOUBLE,
  type ENUM('mountain', 'road', 'other') NOT NULL,
  picture VARCHAR(200),
  availability ENUM('pending', 'reserved', 'available') NOT NULL,
  currentHolderID INT
);

CREATE TABLE Reservations
(
  reservationID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  receiverID INT NOT NULL,
  bikeID INT NOT NULL,
  reservationTime TIMESTAMP NOT NULL
);

CREATE TABLE Users
(
  userID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  name VARCHAR(50),
  isManager BOOLEAN DEFAULT FALSE  NOT NULL,
  isPending BOOLEAN,
  phone VARCHAR(15),
  currentBikeID INT
);
CREATE UNIQUE INDEX Users_email_uindex ON Users (email);

CREATE TABLE Stores
(
  storeID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  hours VARCHAR(50),
  streetAddress VARCHAR(50),
  description VARCHAR(200)
);
CREATE UNIQUE INDEX Stores_name_uindex ON Stores (name);

ALTER TABLE Bikes
  ADD CONSTRAINT Bikes_Users_userID_fk
FOREIGN KEY (currentHolderID) REFERENCES Users (userID);

ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Users_userID_fk
FOREIGN KEY (receiverID) REFERENCES Users (userID);
ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Bikes_bikeID_fk
FOREIGN KEY (bikeID) REFERENCES Bikes (bikeID);

ALTER TABLE Users
  ADD CONSTRAINT Users_Bikes_bikeID_fk
FOREIGN KEY (currentBikeID) REFERENCES Bikes (bikeID);

INSERT INTO Users (email, password, name, isManager, isPending, phone, currentBikeID) VALUES
  ('admin@admin.com', 'admin', 'admin', 1, NULL, '1234567890', NULL),
  ('1@customer.com', 'tom', 'password', 0, NULL, '1111111111', NULL),
  ('2@customer.com','jack', 'password',0,NULL,'2222222222',NULL );

INSERT INTO Stores(name, hours, streetAddress) VALUES
  ('Small Store', '10AM-5PM', '2333 E 80th St');

INSERT INTO Bikes(gender, seatHeight, type, picture, availability, currentHolderID) VALUES
  ('male', 1.2, 'road', 'https://i.ytimg.com/vi/EGtno5IguNk/maxresdefault.jpg', 'available', NULL);

