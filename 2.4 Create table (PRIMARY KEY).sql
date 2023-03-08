/* Create table.sql
PRIMARY KEY constraint ជា ក្រិតក្រមដាក់លើជួរឈរ ដែលតាងអោយតារាង(table)តម្លៃវាសម្គាល់ជួរដេកនីមួយៗនៃតារាង។
វាត្រូវបានប្រើប្រាស់ផងដែរ ក្នុងការបង្កើតទំនាក់ទំនង(relationship)រវាងតារាង និងតារាង។
PRIMARY KEY ជាជួរឈរដំបូងគេ និងឈ្មោះរបស់វាផ្តើមដោយ ឈ្មោះតារាង និងបញ្ចប់ដោយ ID, Number, រឺ Code។
វាមានលក្ខណៈសម្បត្តិពីរគួបគ្នារួចជាស្រេច គឺចាំបាច់ត្រូវមានតម្លៃ (NOT NULL) និង មិនស្ទួន (UNIQUE)

FOREIGN KEY ជាក្រិតក្រមដាក់លើជួរឈរ ដើម្បីធានាថាតម្លៃរបស់ FOREIGN KEY ដូចគ្នាទៅនឹងតម្លៃ PRIMARY KEY
ដែលថិតក្នុងតារាងមួយផ្សេងទៀត។ វាក៏ចូលរួមក្នុងការបង្កើតទំនាក់ទំនងរវាងតារាង និងតារាងផងដែរ។
FOREIGN KEY ឈ្មោះរបស់វាតែងបញ្ចប់ដោយ ID, Number, ឬ Code គ្រាន់តែវាថិតនៅក្នុងតារាងដ៏ទៃ
តែដូចគ្នានឹងឈ្មោះ PRIMARY KEY របស់តារាងមួយផ្សេងទៀត។

៏៏***តារាងនីមួយៗត្រូវតែមាន PRIMARY KEY (PK) ឯ FOREIGN KEY (FK) វិញជួនមានជួនអត់។
ឧទាហរណ៍៖
	Category(CategoryID, CategoryName, Description)
	Product(ProductCode, ProductName, Cost, QuantityInstock, Description, CategoryID)
	Sale(OrderName, OrderDate, EmployeeID)
	SoldProduct(OrderNumber, ProductCode, Price, QuantityOrdered)
	Employee(EmployeeID, EmployeeName, Sex, BirthDate, Address, TelephoneNumber)
*/
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
Go
CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	EmployeeNAME VARCHAR(30) NOT NULL,
	Sex CHAR(1) NOT NULL,
	BirthDate DATE NOT NULL, 
	Address VARCHAR(350) NOT NULL,
	TelephoneNumber VARCHAR(10)
);
GO
CREATE TABLE Sale (
	SaleNumber INT PRIMARY KEY,
	OrderDate DATE NOT NULL,
	EmployeeID INT FOREIGN KEY REFERENCES Employee (EmployeeID)
);
Go
CREATE TABLE SoldProduct (
	SaleNumber INT FOREIGN KEY REFERENCES Sale (SaleNumber),
	ProductCode VARCHAR(16)	FOREIGN KEY REFERENCES Product (ProductCode),
	Price MONEY NOT NULL,
	QuantitySold SMALLINT NOT NULL,
	CONSTRAINT PK_SoldProduct_SaleNumber_ProductCode PRIMARY KEY (SaleNumber, ProductCode) 
);
