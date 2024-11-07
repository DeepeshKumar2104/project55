-- CREATE DATABASE MemberManagementDB;
USE MemberManagementDB;

CREATE TABLE Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),                -- Optional Phone Number field
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Education (
    EducationId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    Degree VARCHAR(100) NOT NULL,
    FieldOfStudy VARCHAR(100),                  -- Specific field of study (e.g., Computer Science)
    Institution VARCHAR(255) NOT NULL,
    YearOfCompletion YEAR NOT NULL,
    GPA DECIMAL(3, 2),
    GradeType ENUM('GPA', 'Percentage') DEFAULT 'GPA',  -- Grade system type
    Achievements TEXT,                          -- List of notable achievements (optional)
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE
);

CREATE TABLE Employment (
    EmploymentId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    JobTitle VARCHAR(100) NOT NULL,
    CompanyName VARCHAR(255) NOT NULL,
    Location VARCHAR(255),                     -- Job location
    StartDate DATE NOT NULL,
    EndDate DATE DEFAULT NULL,
    IsCurrentJob BOOLEAN DEFAULT FALSE,        -- Flag to mark current job
    Description TEXT,
    Responsibilities TEXT,                     -- Specific responsibilities (optional)
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE
) ;
CREATE TABLE Address (
    AddressId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    AddressType ENUM('Home', 'Work', 'Other') DEFAULT 'Home', -- Type of address
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(20),
    Country VARCHAR(100) DEFAULT 'India',         -- Country name (default to India)
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE
);
CREATE TABLE UserSessions (
    SessionId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    Token VARCHAR(512) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiresAt TIMESTAMP NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE,
    INDEX (Token)
);



