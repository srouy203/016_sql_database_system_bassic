CREATE TABLE Category(
CategoryID INT PRIMARY KEY,
CategoryNAME VARCHAR(50) NOT NULL UNIQUE,
Description VARCHAR(510)
);
Go
CREATE TABLE Product(
	ProductCode VARCHAR(16) PRIMARY KEY,
	ProductName VARCHAR(50),
	Cost MONEY,
	QuantityInStock SMALLINT,	
	Description VARCHAR(510),
	CategoryID INT FOREIGN KEY REFERENCES Category (CategoryID)
);