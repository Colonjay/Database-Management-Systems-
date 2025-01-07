CREATE TABLE Properties (
    PropertyID INT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Status ENUM('Available', 'Sold', 'Rented') NOT NULL
);
