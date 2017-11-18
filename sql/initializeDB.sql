DROP DATABASE IF EXISTS BikeStore;
CREATE DATABASE BikeStore;

USE BikeStore;
CREATE TABLE Bikes
(
  bikeID          INT PRIMARY KEY                           NOT NULL AUTO_INCREMENT,
  gender          ENUM ('male', 'female', 'neutral')        NOT NULL,
  seatHeight      DOUBLE,
  type            ENUM ('mountain', 'road', 'other')        NOT NULL,
  picture         VARCHAR(200),
  availability    ENUM ('pending', 'reserved', 'available') NOT NULL,
  currentHolderID INT,
  model           VARCHAR(20)
);

CREATE TABLE Reservations
(
  reservationID   INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  customerID      INT             NOT NULL,
  bikeID          INT             NOT NULL,
  reservationTime TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX Reservations_customerID_uindex
  ON Reservations (customerID);
CREATE UNIQUE INDEX Reservations_bikeID_uindex
  ON Reservations (bikeID);

CREATE TABLE Users
(
  userID        INT PRIMARY KEY        NOT NULL AUTO_INCREMENT,
  email         VARCHAR(50)            NOT NULL,
  password      BINARY(16)            NOT NULL,
  /*                    ^ size in bytes     */
  name          VARCHAR(50),
  isManager     BOOLEAN DEFAULT FALSE  NOT NULL,
  isPending     BOOLEAN,
  phone         VARCHAR(15),
  currentBikeID INT
);
CREATE UNIQUE INDEX Users_email_uindex
  ON Users (email);
CREATE UNIQUE INDEX Users_currentBikeID_uindex
  ON Users (currentBikeID);

CREATE TABLE Stores
(
  storeID       INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name          VARCHAR(50)     NOT NULL,
  hours         VARCHAR(50),
  streetAddress VARCHAR(50),
  description   VARCHAR(200)
);
CREATE UNIQUE INDEX Stores_name_uindex
  ON Stores (name);

ALTER TABLE Bikes
  ADD CONSTRAINT Bikes_Users_userID_fk
FOREIGN KEY (currentHolderID) REFERENCES Users (userID);

ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Users_userID_fk
FOREIGN KEY (customerID) REFERENCES Users (userID);
ALTER TABLE Reservations
  ADD CONSTRAINT Reservations_Bikes_bikeID_fk
FOREIGN KEY (bikeID) REFERENCES Bikes (bikeID);

ALTER TABLE Users
  ADD CONSTRAINT Users_Bikes_bikeID_fk
FOREIGN KEY (currentBikeID) REFERENCES Bikes (bikeID);

INSERT INTO Stores (name, hours, streetAddress) VALUES
  ('Small Store', '10AM-5PM', '2333 E 80th St');

INSERT INTO Bikes (gender, seatHeight, type, picture, availability, currentHolderID) VALUES
<<<<<<< HEAD
  ('male', 19, 'road', 'https://i.imgur.com/j9Z6QBY.jpg', 'available', NULL),
  ('male', 20, 'road', 'https://i.imgur.com/dSCj6Rj.jpg', 'available', NULL),
  ('male', 1.2, 'road', 'https://i.imgur.com/xjNjByG.jpg?1', 'available', NULL);
#   ('female', 1.1, 'other', 'https://i.imgur.com/ivGFUn1.jpg', 'available', NULL);
=======
  ('male', 1.2, 'road', 'https://i.ytimg.com/vi/EGtno5IguNk/maxresdefault.jpg', 'available', NULL),
  ('male', 19, 'road', 'https://i.imgur.com/j9Z6QBY.jpg', 'available', NULL),
  ('female', 1.1, 'other', 'https://i.imgur.com/ivGFUn1.jpg', 'available', NULL);
>>>>>>> 673eeffa2cd760d6b62258ca14f45b74d4720626

/* Password: 11111111A */
INSERT INTO Users (email, password, name, isManager, isPending, phone, currentBikeID) VALUES
  ('admin@admin',
   0xE3908E5C68A1C7637ABE3DB2B3C91938,
   'admin', 1, 0, '1234567890', NULL),
  ('1@1',
   0xE3908E5C68A1C7637ABE3DB2B3C91938,
   '11', 0, 0, '1111111111', NULL),
  ('2@2',
   0xE3908E5C68A1C7637ABE3DB2B3C91938,
   '22', 0, 0, '2222222222', NULL),
  ('3@3',
   0xE3908E5C68A1C7637ABE3DB2B3C91938,
   '44', '0', '0', '123456', '1'),
  ('4@4',
   0xE3908E5C68A1C7637ABE3DB2B3C91938,
   '55', '0', '1', '123456', '2');

INSERT INTO Reservations (customerID, bikeID) VALUES
  (2, 3);

