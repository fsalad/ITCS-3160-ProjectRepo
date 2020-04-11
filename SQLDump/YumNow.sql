-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Persons` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Persons` (
  `PersonsID` INT NOT NULL,
  `Name` VARCHAR(100) NULL,
  `Email` VARCHAR(65) NULL,
  `PhoneNumber` VARCHAR(12) NULL,
  PRIMARY KEY (`PersonsID`))
ENGINE = InnoDB;
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (1, 'Rahsaan Collins', 'rcollins@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (2, 'AnselWelch', 'awelch@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (3, 'Axel Bins PhD', 'abins@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (26, 'Frank Leffler', 'fleffler@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (27, 'EdenSchowalter', 'eschowalter@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (28, 'Eldridge Von', 'evon@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (39, 'Dagmar Kassulke', 'dkassulke@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (46, 'Haylee Hickle', 'hayleehickle@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (47, 'Mallory Rolfson', 'mrolfson@uncc.edu');INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (48, 'Lelia Tromp', 'ltromp@uncc.edu');

-- -----------------------------------------------------
-- Table `mydb`.`Faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Faculty` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Faculty` (
  `FacultyID` INT NOT NULL,
  `Title` VARCHAR(80) NULL,
  `HighestDegree` VARCHAR(80) NULL,
  `DegreeCollege` VARCHAR(100) NULL,
  PRIMARY KEY (`FacultyID`),
  CONSTRAINT `FacultyID`
    FOREIGN KEY (`FacultyID`)
    REFERENCES `mydb`.`Persons` (`PersonsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `faculty` (`faculty_id`, `title`, `degree_college`, `highest_degree`) VALUES (1, 'Assistant Professor', 'UF', 'PhD');INSERT INTO `faculty` (`faculty_id`, `title`, `degree_college`, `highest_degree`) VALUES (2, 'Professor', 'SJSU', 'Master');INSERT INTO `faculty` (`faculty_id`, `title`, `degree_college`, `highest_degree`) VALUES (3, 'Adjunct Professor', 'UNCC', 'Master');

-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Staff` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `StaffID` INT NOT NULL,
  `Position` VARCHAR(80) NULL,
  `AdminYorN` CHAR(1) NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Persons` (`PersonsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (26, 'VP Acad Affairs', 'Y');INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (27, 'Lab Assistant', 'N');INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (28, 'Dean Engineering', 'Y');

-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Students` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `StudentID` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `GradYear` YEAR(4) NULL,
  `Major` VARCHAR(80) NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `StudentID`
    FOREIGN KEY (`StudentID`)
    REFERENCES `mydb`.`Persons` (`PersonsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE INDEX `StudentID_idx` ON `mydb`.`Students` (`StudentID` ASC) ;
INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (39, 1987, 'Philosophy', 'Undergraduate');INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (47, 1986, 'Accounting', 'Undergraduate');INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (48, 1978, 'Electronics', 'Graduate');INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (27, 2008, 'Computer Science', 'Graduate');

-- -----------------------------------------------------
-- Table `mydb`.`Drivers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Drivers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Drivers` (
  `DriverID` INT NOT NULL,
  `StudentID` INT NULL,
  `DateHired` DATE NULL,
  `Ratings` VARCHAR(45) NULL,
  `LicenseNumber` VARCHAR(15) NULL,
  PRIMARY KEY (`DriverID`),
  CONSTRAINT `StudentID`
    FOREIGN KEY (`StudentID`)
    REFERENCES `mydb`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE INDEX `StudentID_idx` ON `mydb`.`Drivers` (`StudentID` ASC) ;
INSERT INTO `driver` (`driver_id`, `student_id`, `license_number`, `date_hired`, `rating`) VALUES (101, 47, 'fi3980', '2019-06-29', '4');INSERT INTO `driver` (`driver_id`, `student_id`, `license_number`, `date_hired`, `rating`) VALUES (201, 27, 'js4003', '2020-02-15', '5');

-- -----------------------------------------------------
-- Table `mydb`.`Restaurants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Restaurants` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Restaurants` (
  `RestaurantID` INT NOT NULL,
  `RestaurantType` VARCHAR(60) NULL,
  `RestaurantName` VARCHAR(100) NULL,
  `RestaurantAddress` VARCHAR(200) NULL,
  `RestaurantPhoneNumber` VARCHAR(12) NULL,
  `RestaurantWebsite` VARCHAR(80) NULL,
  `RestaurantSchedule` VARCHAR(200) NULL,
  PRIMARY KEY (`RestaurantID`))
ENGINE = InnoDB;
INSERT INTO `Restaurants` (`RestaurantID`, `RestaurantType`, `RestaurantName`, `RestaurantAddress`, `RestaurantPhoneNumber`, `RestaurantWebsite`, `RestaurantSchedule`) VALUES (101, 'fastfood', 'Chic-fil-a', '2158 Victory St', '7043339291', 'www.chicfila.com', 'Monday-Friday 9am-10pm"');INSERT INTO `Restaurants` (`RestaurantID`, `RestaurantType`, `RestaurantName`, `RestaurantAddress`, `RestaurantPhoneNumber`, `RestaurantWebsite`, `RestaurantSchedule`) VALUES (102, 'fastfood', 'Wendys', '5188 Tasty Rd', '7048912247', 'www.wendys.com', 'Everyday 7am-11pm"');INSERT INTO `Restaurants` (`RestaurantID`, `RestaurantType`, `RestaurantName`, `RestaurantAddress`, `RestaurantPhoneNumber`, `RestaurantWebsite`, `RestaurantSchedule`) VALUES (103, 'fastfood', 'McDonalds', '331 Rival Avenue', '9802724001', 'www.McDonalds.com', 'Open 24/7"');

-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL,
  `RestaurantID` INT NULL,
  `CustomerID` INT NULL,
  `DriverID` INT NULL,
  `FoodOrdered` VARCHAR(200) NULL,
  `FoodCost` FLOAT NULL,
  `DeliveryFee` FLOAT NULL,
  `TotalCost` FLOAT NULL,
  `DeliveryTime` TIME NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `RestaurantID`
    FOREIGN KEY (`RestaurantID`)
    REFERENCES `mydb`.`Restaurants` (`RestaurantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Persons` (`PersonsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DriverID`
    FOREIGN KEY (`DriverID`)
    REFERENCES `mydb`.`Drivers` (`DriverID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `Restaurants` (`OrderID`, `RestaurantID`, `CustomerID`, `DriverID`, `FoodOrdered`, `FoodCost`, `DeliveryFee`,`TotalCost`, `DeliveryTime`) VALUES (0001, '101', '1', '101', 'food', '18.25', '2.00', '20.25','Monday 5pm"');INSERT INTO `Restaurants` (`OrderID`, `RestaurantID`, `CustomerID`, `DriverID`, `FoodOrdered`, `FoodCost`, `DeliveryFee`,`TotalCost`, `DeliveryTime`) VALUES (0002, '102', '2', '102', 'food', '16.25', '2.00', '18.25','Friday 3pm"');INSERT INTO `Restaurants` (`OrderID`, `RestaurantID`, `CustomerID`, `DriverID`, `FoodOrdered`, `FoodCost`, `DeliveryFee`,`TotalCost`, `DeliveryTime`) VALUES (0003, '101', '1', '103', 'food', '10.00', '2.00', '12.00','Wednesday 12pm"');
CREATE INDEX `CustomerID_idx` ON `mydb`.`Orders` (`CustomerID` ASC) ;

CREATE INDEX `RestaurantID_idx` ON `mydb`.`Orders` (`RestaurantID` ASC) ;

CREATE INDEX `DriverID_idx` ON `mydb`.`Orders` (`DriverID` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Locations` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Locations` (
  `LocationID` INT NOT NULL,
  `LocationName` VARCHAR(100) NULL,
  `LocationAddress` VARCHAR(200) NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB;
INSERT INTO `Locations` (`LocationID`, `LocationName`, `LocationAddress`) VALUES (101, 'Chic-fil-a', '2158 Victory St"');INSERT INTO `Locations` (`LocationID`, `LocationName`, `LocationAddress`) VALUES (102, 'Wendys', '5188 Tasty Rd"');INSERT INTO `Locations` (`LocationID`, `LocationName`, `LocationAddress`) VALUES (103, 'McDonalds', '331 Rival Avenue"');

-- -----------------------------------------------------
-- Table `mydb`.`Orders_has_Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders_has_Locations` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders_has_Locations` (
  `Orders_OrderID` INT NOT NULL,
  `Locations_LocationID` INT NOT NULL,
  PRIMARY KEY (`Orders_OrderID`, `Locations_LocationID`),
  CONSTRAINT `fk_Orders_has_Locations_Orders1`
    FOREIGN KEY (`Orders_OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_Locations_Locations1`
    FOREIGN KEY (`Locations_LocationID`)
    REFERENCES `mydb`.`Locations` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Orders_has_Locations_Locations1_idx` ON `mydb`.`Orders_has_Locations` (`Locations_LocationID` ASC) ;

CREATE INDEX `fk_Orders_has_Locations_Orders1_idx` ON `mydb`.`Orders_has_Locations` (`Orders_OrderID` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
