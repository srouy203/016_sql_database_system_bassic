/*
	ចូរនិស្សិតចុច Database Syntems Course Resources ដើម្បីចម្លងឯកសារ Create northwind
	Sample database.sql ដាក់ថតផ្ទុកមេរៀន database របស់អ្នក។
	១. ជ្រើសយកព័ត៌មានទាំងអស់នៃតារាង		//database Northwing
		SELECT * FORM តារាង;
		SELECT * FROM Categories;
		SELECT * FROM Products;
	២. ជ្រើសរើសយកតែមួយជួរដេកពីតារាង
		SELECT * FROM តារាង WHERE PK=value;		ប្រើ Primary key
		SELECT * FROM តារាង WHERE UQ=value;		ប្រើ Unique Key, Unique constraint រឺ Unique Index
		SELECT * FROM Products WHERE ProductID=25;
	៣. ជ្រើសយកជួរដេកមួយរឺច្រើនតាមលក្ខខណ្ឌជាក់ស្តែង
		SELECT * FROM តារាង WHERE លក្ខខណ្ឌជាក់ស្តែង
			៣.ក សញ្ញាប្រមាណវិធីប្រៀបធៀប
				= ស្មើ	   > ធំជាង	>= ធំជាងឬស្មើ   <   តូចជាង	   <=	តូចជាងឬស្មើ	   <>	មិនស្មើ
				SELECT * FROM Products WHERE CategoryID < 4;
			៣.ខ ប្រើឈ្នាប់
				AND	និង (ថយជួរដេក)		OR ឬ	(កើនជួរដេក)		NOT មិន 
				SELECT * FROM Products WHERE CategoryID=3;
				SELECT * FROM Products WHERE (CategoryID=3) AND (SupplierID=8);
				OR
				SELECT * FROM Products WHERE ProductID=3 or ProductID=8;
				SELECT * FROM Products WHERE ProductID IN (3,8);
			៣.គ សញ្ញាប្រមាណវិធីពិសេស
				- BETWEEN	តម្លៃទី ១  AND តម្លៃទី ២
				SELECT * FROM Products WHERE UnitsInStock > 1 AND UnitsInStock<10;
				SELECT * FROM Products WHERE UnitsInStock BETWEEN 2 AND 9;
				- IS NOT NULL មានតម្លៃ
				ជ្រើសរើសព័ត៌មានបុគ្គលិកទាំងឡាយណាដែលតំបន់(Region)របស់គាត់មិនទទេ(មានតម្លៃ)
				SELECT * FROM Employees WHERE Region IS​ NOT NULL;
				- IS NULL គ្មានតម្លៃ
				ជ្រើសរើសព័ត៌មានបុគ្គលិកទាំងឡាយណាដែលតំបន់(Region)របស់គាត់ទទេ(គ្មានតម្លៃ)
				SELECT * FROM Employees WHERE Region IS NULL;
				- LIKE ប្រៀបធៀបនិងផ្នែកមួយនៃតម្លៃ
				ជ្រើសយកផលិតផលទាំងឡាយណាដែលឈ្មោះផលិតផលផ្តើមដោយអក្សរ Ca
				SELECT * FROM Products WHERE ProductName LIKE 'Ca%';	---សញ្ញា% តាងផ្នែកដែលមិនដឹង។
				ជ្រើសយកផលិតផលទាំងឡាយណាដែលឈ្មោះផលិតផលបញ្ចប់ដោយអក្សរ Ca
				SELECT * FROM Products WHERE ProductName LIKE '%Ca';
				ជ្រើសយកផលិតផលទាំងឡាយណាដែលឈ្មោះផលិតផលមានអក្សរ Ca
				SELECT * FROM Products WHERE ProductName LIKE '%Ca%';
	៤. តម្រៀបព័ត៌មានតាមតម្លៃជួរឈរ
		SELECT * FROM តារាង ORDER BY ជួរឈរ ASC;		តម្រៀបជួរដេកតាមលំដាប់កើននៃតម្លៃជួរឈរ (0 ទៅ 9 ឬ A ទៅ Z)
		SELECT * FROM Products ORDER BY ProductID ASC;
		SELECT * FROM Products ORDER BY ProductName ASC;
		SELECT * FROM តារាង ORDER BY ជួរឈរ DESC;		តម្រៀបជួរដេកតាមលំដាប់ចុះនៃតម្លៃជួរឈរ (9 ទៅ 0  ឬ Z ទៅ A)
		SELECT * FROM Products ORDER BY ProductID DESC;
		SELECT * FROM Products ORDER BY ProductName DESC;

		ជ្រើសផលិតផលទាំងអស់ដោយតម្រៀបតាមលំដាប់ចុះនៃ Unitprice
		បើតម្លៃUnitpriceដូចគ្នានោះបន្តតម្រៀបតាមលំដាប់កើននៃ UnitInstock។
		SELECT * FROM Products ORDER BY UnitPrice DESC, UnitsInStock ASC;
		--ចំណាំ លំដាប់ធម្មជាតិនៃការតម្រៀបគឺកើន អ៊ីចឹង! កាលណាដាក់ ASC និង មិនដាក់ ASC បានលទ្ធផលដូចគ្នា។
		SELECT * FROM Products ORDER BY UnitPrice DESC,UnitsInStock;
	៥. អនុគមន៍បូកសរុប និងសនិដ្ឋាន (Aggregation function)
		COUNT(*) រាប់ចំនួនជួរដេក
		COUNT(ជួរឈរ) រាប់ចំនួនតម្លៃមានក្នុងជួរឈរ
		SUM(ជួរឈរ) សរុបតម្លៃលេខក្នុងជួរឈរ
		AVG(ជួរឈរ) តម្លៃមធ្យមក្នុងជួរឈរ
		MIN(ជួរឈរ) តម្លៃតូចជាងគេក្នុងជួរឈរ
		MAX(ជួរឈរ) តម្លៃធំជាងគេក្នុងជួរឈរ
			៥.ក  អនុគមន៍បូកសរុប និងសនិដ្ឋានចំពោះជួរដេកមួយក្រុម

				រាប់ចំនួនផលិតផលទាំងអស់
				SELECT COUNT(*) FROM  Products;			//No column name
				SELECT COUNT(*) AS CountOfAllProducts FROM Products;
				--AS ប្រើសម្រាប់ដាក់ឈ្មោះជួរឈរបណ្តោះអាសន្ន
				
				សរុបតម្លៃនៃផលិតផលទាំងអស់
				SELECT SUM(UnitPrice) FROM Products;
				SELECT SUM(UnitPrice) AS SumOfAllProductsPrice From Products;
				
				តម្លៃមធ្យមនៃផលិតផលទាំងអស់
				SELECT AVG(UnitPrice) FROM Products;

				SELECT AVG(UnitPrice) AS AveragePriceOfAllProducts FROM Products;
				SELECT SUM(UnitPrice) AS SUM, COUNT(*)AS COUNT, SUM(UnitPrice)/COUNT(*) AS AVG FROM Products;

				តម្លៃថោកជាងគេក្នុងចំណោមតម្លៃផលិតផលទាំងអស់
				SELECT MIN(UnitPrice) FROM Products;
				SELECT MIN(UnitPrice) AS MinimumPriceOfAllProductsPrice From Products;

				តម្លៃថ្លៃជាងគេក្នុងចំណោមតម្លៃផលិតផលទាំងអស់
				SELECT MAX(UnitPrice) FROM Products;
				SELECT MAX(UnitPrice) AS MaximumPriceOfAllProductsPrice From Products;

			៥.ខ  អនុគមន៍បូកសរុប និងសនិដ្ឋានចំពោះច្រើនក្រុមនៃជួរដេក ****
				
				រាប់ចំនួនផលិតផល តាមប្រភេទផលិតផល(CategoryID)
				SELECT CategoryID, COUNT(*) AS CountOfProduct
				FROM Products GROUP BY CategoryID;
				- SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID
				
				សរុបតម្លៃនៃផលិតផល តាមប្រភេទផលិតផល(CategoryID)
				SELECT CategoryID, SUM(UnitPrice) AS SumOfPrice
				FROM Products GROUP BY CategoryID;
				- SELECT CategoryID, UnitPrice FROM Products;

				តម្លៃមធ្យមនៃផលិតផល តាមប្រភេទផលិតផល(CategoryID)
				SELECT CategoryID, AVG(UnitPrice) AS AvgPrice 
				FROM Products GROUP BY CategoryID;

				តម្លៃថោកជាងគេ តាមប្រភេទផលិតផល(CategoryID)
				SELECT CategoryID, MIN(UnitPrice) AS MinPrice 
				FROM Products GROUP BY CategoryID;

				តម្លៃថ្លៃជាងគេ តាមប្រភេទផលិតផល(CategoryID)
				SELECT CategoryID, MAX(UnitPrice) AS MaxPrice
				FROM Products GROUP BY CategoryID;
03/03/2022
		កាលណាប្រើ GROUP BY បន្ទាប់មក COUNT, SUM, AVG, MIN ឬ MAX នោះអាចឲ្យលទ្ធផល
		ជាច្រើន តែប្រើ COUNT, SUM, AVG, MIN ឬ MAX អត់មាន GROUP BY វិញ នោះអាចឲ្យលទ្ធ
		ផលយ៉ាងច្រើនមួយ។

		លំហាត់ 
		រាប់ចំនួនផលិតផលដែលថ្លៃជាង ១០០ ដុល្លា (UnitPrice)
		SELECT COUNT (*) AS CountOfProduct FROM Products WHERE UnitPrice>100;

		រាប់ចំនួនបុគ្គលិកទាំងអស់ តាមមុខងារនិមួយៗ
		SELECT Title, COUNT(*) FROM Employees GROUP BY Title;

		ចំពោះពេលលក់ម្តងៗ(OrderID)បង្ហាញប្រាក់សរុបត្រូវបង់មុនបញ្ចុះតម្លៃ និង ប្រាក់សរុបត្រូវបង់ក្រោយបញ្ចុះតម្លៃ
		SELECT * FROM [Order Details];
		SELECT OrderID , SUM(UnitPrice*Quantity) AS Total,
		SUM(UnitPrice*Quantity) - SUM(UnitPrice*Quantity*Discount) AS [Total-Discount]
		FROM [Order Details] GROUP BY OrderID;

14/03/2022
		ចំពោះពេលលក់ ដែលមានប្រាក់សរុបត្រូវបង់ក្រោយបញ្ចុះតម្លៃច្រើនជាង ១០០០ ដុល្លា
		បង្ហាញប្រាក់សរុបត្រូវបង់មុនបញ្ចុះតម្លៃ និងប្រាក់សរុបត្រូវបង់ក្រោយបញ្ចុះតម្លៃ។
		SELECT OrderID, SUM(UnitPrice * Quantity) AS Total, SUM(UnitPrice*Quantity) -
		SUM(UnitPrice * Quantity * Discount) AS [Total - Discount]
		FROM [Order Details] GROUP BY OrderID
		HAVING SUM(UnitPrice * Quantity)- SUM(UnitPrice * Quantity * Discount)>1000;
		--HAVING សម្រាប់ជ្រើសរើសជួរដេកដោយប្រើអនុគមន៍បូកសរុប និងសនិដ្ឋាន(COUNT, SUM , 
			AVG, MIN, MAX) ជាលក្ខខណ្ឌ។
		--អនុគមន៍បូកសរុប និងសនិដ្ឋាន(COUNT, SUM, AVG, MIN, MAX) មិនអាចប្រើជាមួយ WHERE បានទេ។

	SELECT * FROM Product --- សញ្ញា * សម្រាប់ជ្រើសរើសគ្រប់ជួរឈរ។

	SELECT ជួរឈរ FROM តារាង  --SELECT សម្រាប់ជ្រើសជួរឈរបានបញ្ជាក់ឈ្មោះ
	បង្ហាញលេខសម្គាល់ផលិតផល ឈ្មោះផលិតផល ព្រមទាំងតម្លៃផលិតផល។
	SELECT ProductID,ProductName FROM Products;

	SELECT កន្សោមប្រមាណវិធី FROM តារាង  -- SELECT សម្រាប់ជ្រើសរើសផលនៃ
	ប្រមាណវិធីបង្ហាញ លេខសម្គាល់ផលិតផល ឈ្មោះផលិតផល ព្រមទាំងតម្លៃជាប្រាក់រៀល
	របស់ផលិតផល(១ដុល្លារស្មើ៤០០០)។
	SELECT ProductID, ProductName, UnitPrice * 4000 AS [តម្លៃរៀល] FROM Products;

	SELECT
	FROM
	[WHERE]
	[GROUP BY]
	[HAVING]
	[ORDER BY]
	-- SELECT និង FROM ត្រូវសរសេរជានិច្ច។
	-- ឯពាក្យគន្លឹះ WHERE, GROUP BY, HAVING, ORDER BY ជួនសរសេរឬមិនសរសេរ អាស្រ័យការស្នើ (query)។


*/

	
