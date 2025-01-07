CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
);
CREATE TABLE VisitRecord (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    VisitDate DATE,
    Symptoms TEXT,
    Diagnosis TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
CREATE TABLE LaboratoryTest (
    TestID INT PRIMARY KEY,
    VisitID INT,
    TestName VARCHAR(255),
    TestResult TEXT,
    TestDate DATE,
    FOREIGN KEY (VisitID) REFERENCES VisitRecord(VisitID)
);
CREATE TABLE Facility (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(255)
);
CREATE TABLE Resource (
    ResourceID INT PRIMARY KEY,
    FacilityID INT,
    ResourceName VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (FacilityID) REFERENCES Facility(FacilityID)
);
CREATE TABLE UserRole (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(255)
);
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255)
);
CREATE TABLE User_UserRole (
    UserID INT,
    RoleID INT,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoleID) REFERENCES UserRole(RoleID)
);
CREATE TABLE SupplyChain (
    SupplyChainID INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    ContactInformation TEXT
);

-- Add a relationship between Facility and Visit Record (if required)
ALTER TABLE VisitRecord ADD COLUMN FacilityID INT,
    FOREIGN KEY (FacilityID) REFERENCES Facility(FacilityID);
