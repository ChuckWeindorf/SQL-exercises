CREATE DATABASE quiltingdb;

DROP TABLE customers;

CREATE TABLE customers (
    CustomerID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    State varchar(2),
    Zip varchar(10),
    eMail varchar(255),
    CellPhone varchar(14),
    HomePhone varchar(14)
);

DROP TABLE sales;

CREATE TABLE sales (
    SaleID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CustomerID int,
    Worktype varchar(20),
    WorkDescription text(2000),
    OrderDate date,
    ReceivedData date,
    StartDate date,
    CompleteDate date,
    TargetDate date,
    QuoteAmount decimal(4,2),
    Paid boolean,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

DROP TABLE sales_artifacts;

CREATE TABLE sales_artifacts (
    SaleArtifactID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SaleID int,
    ArtifactID int,
    FOREIGN KEY (SaleID) REFERENCES sales(SaleID),
    FOREIGN KEY (ArtifactID) REFERENCES artifacts(ArtifactID)
);


DROP TABLE artifacts;

CREATE TABLE artifacts (
    ArtifactID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ArtType varchar(20),
    ArtDescription text(2000),
    Category varchar(20),
    FileName varchar(100),
    CreateDate date
);