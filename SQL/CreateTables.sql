CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName NVARCHAR(255) NOT NULL,
    Website NVARCHAR(255) NULL,
    Type NVARCHAR(10) NULL,
    Address NVARCHAR(255) NULL,
    City NVARCHAR(100) NULL,
    State NVARCHAR(100) NULL,
    PostalCode NVARCHAR(20) NULL,
    Country NVARCHAR(100) NULL,
    TaxID NVARCHAR(50) UNIQUE NULL, -- VAT/GST/EIN
    RegistrationDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1,
);


CREATE TABLE CustomerContacts (
    ContactID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(20) NULL,
    JobTitle NVARCHAR(100) NULL,
    IsPrimaryContact BIT DEFAULT 0, -- Marks the main contact for the company
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
