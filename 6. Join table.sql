/* Join table.sql
	កាលណាត្រូវប្រើទិន្នន័យក្នុងតារាងពីរឡើងទៅ ចាំបាច់ត្រូវភ្ជាប់តារាង (join table) ដោយ
	ប្រើលក្ខខណ្ឌ PK=FK។
		Syntax:
			SELECT columnlist FROM table1, table2 WHERE joincondition;
			SELECT columnlist FROM table1 INNER JOIN table2 ON joincondition;
			------------------------------------------------------------------------------------------------------
			Categories(CategoryID, CategoryName, Description, Pricture)
			Products(ProductID, ProductName, SupplierID, CategoryID,
							QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder,
							ReorderLevel, Discontinued)
			Customers(CustomerID, CompanyName, ContactName, ContactTitle,...)
			Employees(EmployeeID, LastName, FirstName, Title, TitleOfCourtesy,
							BirthDate, Address, City, Region, PostalCode, Country,...)
			Orders(OrderId, CostomerID, EmployeeID, OrderDate, RequiredDate, 
							ShippedDate, ShipVia,....)
			Order Details(OrderID, ProductID, UnitPrice, Quantity, Discount)
			-------------------------------------------------------------------------------------------------------
		ភ្ជាប់តារាង Categories និង Products
	SELECT * FROM Categories, Products WHERE Categories.CategoryID=Products.CategoryID;
	SELECT * FROM Categories INNER JOIN Products ON Categories.CategoryID=Products.CategoryID

	SELECT * FROM Categories AS Cat, Products AS Pro WHERE Cat.CategoryID=Pro.CategoryID
	SELECT * FROM Categories AS Cat INNER JOIN Products AS Pro ON Cat.CategoryID=Pro.CategoryID
	
		ជ្រើសយកឈ្មោះផលិតផល តម្លៃផលិតផល និង​ប្រភេទផលិតផល(ឈ្មោះ)មកបង្ហាញ។
	SELECT Pro.ProductName, Pro.UnitPrice, Cat.CategoryName
	FROM Categories AS Cat,Products AS Pro
	WHERE Cat.CategoryID=Pro.CategoryID
	
	SELECT Pro.ProductName, Pro.UnitPrice, Cat.CategoryName
	FROM Categories AS Cat INNER JOIN Products AS Pro ON Cat.CategoryID=Pro.CategoryID	

	*មិនគួរសរសេរ
	SELECT ProductName, UnitPrice, CategoryName
	FROM Categories AS Cat,Products AS Pro
	WHERE Cat.CategoryID=Pro.CategoryID
	
	SELECT ProductName, UnitPrice, CategoryName
	FROM Categories AS Cat INNER JOIN Products AS Pro ON Cat.CategoryID=Pro.CategoryID	
	**ចំណាំ កាលណាប្រើតារាងចាប់ពី២ឡើងទៅ គួរសរសេរ tablename.columnname ដើម្បីអោយដំណើរការលឿន។
	
	
	*/
			Categories(CategoryID, CategoryName, Description, Pricture)
			Products(ProductID, ProductName, SupplierID, CategoryID,
							QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder,
							ReorderLevel, Discontinued)
			Customers(CustomerID, CompanyName, ContactName, ContactTitle,...)
			Employees(EmployeeID, LastName, FirstName, Title, TitleOfCourtesy,
							BirthDate, Address, City, Region, PostalCode, Country,...)
			Orders(OrderId, CostomerID, EmployeeID, OrderDate, RequiredDate, 
							ShippedDate, ShipVia,....)
			Order Details(OrderID, ProductID, UnitPrice, Quantity, Discount)
		SELECT O.CustomerID, O.OrderDate, OD.Quantity FROM Orders AS O INNER JOIN [Order Details] AS OD ON O.OrderID=OD.OrderID;
		SELECT O.OrderID, O.CustomerID, Emp.LastName FROM Employees AS Emp INNER JOIN Orders AS O ON O.EmployeeID=Emp.EmployeeID


		SELECT * FROM Customers
		SELECT Ord.OrderID, Cus.CustomerID, Ord.OrderDate FROM Orders AS Ord INNER JOIN Customers AS Cus ON Ord.CustomerID = Cus.CustomerID;