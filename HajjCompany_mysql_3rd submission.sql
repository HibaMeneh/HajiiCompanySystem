CREATE DATABASE HajjCompany;
USE HajjCompany;

CREATE TABLE Supervisors (
    Supervisor_id INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(20),
    Email VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    experience_years INT
) ENGINE=InnoDB;

CREATE TABLE Transport_company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    Rating INT,
    Email VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    company_name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Campaigns (
    Campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Campaign_name VARCHAR(50) NOT NULL,
    SupervisorID INT,
    companyID INT,
    FOREIGN KEY (SupervisorID) REFERENCES Supervisors(Supervisor_id),
    FOREIGN KEY (companyID) REFERENCES Transport_company(company_id)
) ENGINE=InnoDB;

CREATE TABLE Country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    Country_name VARCHAR(100),
    currecy VARCHAR(50),
    continent VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Hajji (
    Hajji_id INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(20),
    Email VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    Experience_years INT,
    countryID INT,
    CompanyID INT,
    FOREIGN KEY (countryID) REFERENCES Country(country_id),
    FOREIGN KEY (CompanyID) REFERENCES Transport_company(company_id)
) ENGINE=InnoDB;

CREATE TABLE Hotels (
    Hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    Hotel_name VARCHAR(50) NOT NULL,
    Rating INT,
    street_address VARCHAR(200) NOT NULL,
    zip VARCHAR(10),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Hajji_Hotels (
    Hajji_id INT,
    Hotel_id INT,
    PRIMARY KEY (Hajji_id, Hotel_id),
    FOREIGN KEY (Hajji_id) REFERENCES Hajji(Hajji_id),
    FOREIGN KEY (Hotel_id) REFERENCES Hotels(Hotel_id)
) ENGINE=InnoDB;

CREATE TABLE Employees (
    Employee_id INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE AirlineEmployees (
    Employee_id INT,
    Airline_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id)
) ENGINE=InnoDB;

CREATE TABLE CampaignEmployees (
    Employee_id INT,
    Campaign_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id)
) ENGINE=InnoDB;

CREATE TABLE HotelEmployees (
    Employee_id INT,
    Hotel_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id)
) ENGINE=InnoDB;

CREATE TABLE Hotel_HotelEmployees (
    Employee_id INT,
    Hotel_id INT,
    PRIMARY KEY (Employee_id, Hotel_id),
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id),
    FOREIGN KEY (Hotel_id) REFERENCES Hotels(Hotel_id)
) ENGINE=InnoDB;

CREATE TABLE Campaign_CompaignEmployees (
    Employee_id INT,
    Campaign_id INT,
    PRIMARY KEY (Employee_id, Campaign_id),
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id),
    FOREIGN KEY (Campaign_id) REFERENCES Campaigns(Campaign_id)
) ENGINE=InnoDB;

CREATE TABLE Transport_AirlineEmployees (
    Employee_id INT,
    company_id INT,
    PRIMARY KEY (Employee_id, company_id),
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id),
    FOREIGN KEY (company_id) REFERENCES Transport_company(company_id)
) ENGINE=InnoDB;