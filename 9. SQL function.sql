SQL function.slq
SQL function អនុគមន៍អាចប្រើក្នុងសេចក្តីណែនាំ SQL ជាមួយតម្លៃ ឬជួរឈរ។
១. អនុគមន៍ប្រើជាមួយកាលបរិច្ឆេទនិងពេលវេលា 

	DAY, MONTH, YEAR ផ្តល់ ថ្ងៃ, ខែ, ឆ្នាំ របស់កាលបរិច្ឆេទបានបញ្ជាក់។
		--បង្ហាញ ឈ្មោះ ថ្ងៃកំណើត ខែកំណើត និង ឆ្នាំកំណើត របស់បុគ្គលិក
		SELECT FirstName, DAY(BirthDate) AS Birthday,
			MONTH(BirthDate) AS BirthMonth, YEAR(BirthDate) AS BirthYear
		FROM Employees
		SELECT * FROM Employees
	GETDATE ផ្តល់កាលបរិច្ឆេទ និងពេលវេលាបច្ចុប្បន្ន។
		--បង្ហាញ កាលបរិច្ឆេទ និងពេលវេលាបច្ចុប្បន្ន
		SELECT GETDATE() AS "Current date and time"

	DATEADD បូកកាលបរិច្ឆេទគោល គិតជាខ្នាត តាមលេខ វិជ្ជមានទៅអនាគត ឬ អវិជ្ជមានទៅ
	អតីត។
	ខ្នាតមានដូចជា second, minute, hour, day, week, month, quarter, year។ល។
		SELECT GETDATE() AS Now,
			DATEADD(MINUTE,5,GETDATE()) AS Add5Minutes,
			DATEADD(HOUR,1,GETDATE()) AS Add1Hour,
			DATEADD(DAY,3,GETDATE()) AS Add3Days

		SELECT GETDATE() AS Now,
			DATEADD(MINUTE,-5,GETDATE()) AS Minus5Minutes,
			DATEADD(HOUR,-1,GETDATE()) AS Minus1Hour,
			DATEADD(DAY,-3,GETDATE()) AS Minus3Days

	DATEDIFF ផលដកតាមខ្នាតបានកំណត់ រវាងកាលបរិច្ឆេទឬពេលវេលាទី២ និងកាលបរិច្ឆេទឬពេលវេលាទី១។
		--បង្ហាញ ឈ្មោះ ថ្ងៃខែឆ្នាំកំណើត និងអាយុ របស់បុគ្គលិក
			SELECT FirstName, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
			FROM Employees

២. អនុគមន៍ប្រើជាមួយឃ្លា
	សញ្ញា + អាចប្រើដើម្បីតភ្ជាប់ឃ្លាពីរបញ្ចូលគ្នា។
		SELECT '1'+'1'
	UPPER(ឃ្លា) ប្តូរទៅអក្សរធំទាំងអស់។
	LOWER(ឃ្លា) ប្តូរទៅអក្សរតូចទាំងអស់។
		SELECT UPPER(LastName) AS LastName, LOWER(FirstName) AS FirstName FROM Employees

	SUBSTRING(ឃ្លាដើម, ទីតាំងចាប់ផ្តើម, ប្រវែង) អោយផ្នែកមួយនៃឃ្លាដើមចាប់ទីតាំងអក្សរ
	បញ្ជាប់តាមប្រវែងបានកំនត់។
		SELECT LastName, SUBSTRING(LastName,1,1) AS [យកអក្សរទី១នៃនាមត្រកូល],
									   SUBSTRING(LastName,1,3) AS [យកអក្សរទី3នៃនាមត្រកូល],
									   SUBSTRING(LastName,4,3) AS [យកអក្សរ3នៃនាមត្រកូលចាប់ពីអក្សរទី៤]
		FROM Employees

	LEN(ឃ្លា) អោយប្រវែងឃ្លាជាចំនួនតួរអក្សរ។
		SELECT LastName, LEN(LastName) FROM Employees

៣. អនុគមន៍ប្រើជាមួយលេខ
	ABS(លេខ) អោយនូវតម្លៃដាច់ខាតនៃលេខ។
		SELECT ABS(98.89), ABS(-98.89)
	ROUND(លេខ, ចំនួនខ្ទង់ក្រោក្បៀស) បង្គត់ ឡើងឬចុះ អាស្រ័យផ្នែកទសភាគរបស់លេខ។
		SELECT ROUND(98.48,0), ROUND(98.49,0), ROUND(98.50,0), ROUND(98.51,0)
		SELECT ROUND(98.4848,3), ROUND(98.49494,2),ROUND(98.5050,2), ROUND(98.5151,2)

	CEILING(លេខ) តែងតែបង្គត់ឡើង។ FLOOR(លេខ) តែងតែបង្គត់ចុះ។
		SELECT CEILING(98.10), CEILING(98.99)
		SELECT FLOOR(98.10), FLOOR(98.99)

៤. អនុគមន៍ដូរប្រភេទទិន្នន័យ 
	ដូរប្រភេទទិន្នន័យ អាចប្រើអនុគមន៍ CAST ឬ CONVERT ឱ្យលទ្ធផលដូចគ្នា
	តែរបៀបសរសេរខុសគ្នា។
	CONVERT (ប្រភេទទិន្នន័យត្រូវប្តូរទៅ, ទិន្នន័យឬកន្សោម)
	CAST (ទិន្នន័យឬកន្សោម AS ប្រភេទទិន្នន័យត្រូវប្តូរទៅ)

		SELECT SUBSTRING(CONVERT(CHAR(11), OrderDate),1,11),
		SUBSTRING(CAST(OrderDate AS CHAR(11)),1,11)
		FROM Orders