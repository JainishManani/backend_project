CREATE DATABASE book_tracker;
USE book_tracker;
CREATE TABLE Users (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Username VARCHAR(50) NOT NULL UNIQUE,
  Email VARCHAR(100) NOT NULL UNIQUE,
  PasswordHash VARCHAR(255) NOT NULL,
  Role ENUM('User', 'Admin') DEFAULT 'User',
  CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Users (Username, Email, PasswordHash, Role)
VALUES ('testuser', 'test@example.com', 'hashedpassword123', 'User'),
       ('admin1', 'admin@example.com', 'hashedpassword456', 'Admin');