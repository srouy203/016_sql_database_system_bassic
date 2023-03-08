/*		6.1 Self Join
	Self Join ជាករណីពិសេសដែល តារាងភ្ជាប់នឹងតារាខ្លួនឯង។ ដូចករណីតារាង Employess អាច
	ភ្ជាប់នឹងតារាង Employees ខ្លួនឯងដោយសារ បុគ្គលិកម្នាក់ៗមានលេខសម្គាល់ អ្នកដឹកនាំគាត់ផ្ទុក
	ក្នុងជួរឈរ ReportsTo អីចឹង! គេប្រើ EmployeeID និង ReportsTo ជាលក្ខខណ្ឌនៃការភ្ជាប់។

	ជ្រើសយកមកបង្ហាញនូវ ឈ្មោះបុគ្គលិក តំណែងរបស់បុគ្គលិក ឈ្មោះអ្នកដឹកនាំ និងតំណែងរបស់អ្នកដឹកនាំ។
	USER Northwind;
	
	SELECT E.FirstName AS EmployeeName, E.Title AS EmployeeTitle, L.FirstName
	AS LeaderName, L.Title AS LeaderTitle FROM Employees AS E, Employees AS L
	WHERE E.ReportsTo=L.EmployeeID

	SELECT E.FirstName AS EmployeeName, E.Title AS EmployeeTitle,
	L.FirstName AS LeaderName, L.Title AS LeaderTitle
	FROM Employees AS E INNER JOIN Employees AS L ON E.ReportsTo=L.EmployeeID

*/
SELECT E.FirstName AS EmployeeName, E.Title AS EmployeeTitle, L.FirstName
	AS LeaderName, L.Title AS LeaderTitle FROM Employees AS E, Employees AS L
	WHERE E.ReportsTo=L.EmployeeID
	GO
SELECT * FROM Employees

SELECT * FROM Classes AS C LEFT OUTER JOIN Students AS S ON C.ClassID=S.Class.ID

SELECT * FROM Classes AS C RIGHT OUTER JOIN Students AS S ON C.ClassID=S.ClassID

SELECT * FROM Classes AS C FULL OUTER JOIN Students AS S ON C.ClassID=S.ClassID

	SELECT E.FirstName AS EmployeeName, E.Title AS EmployeeTitle,
	L.FirstName AS LeaderName, L.Title AS LeaderTitle
	FROM Employees AS E INNER JOIN Employees AS L ON E.ReportsTo=L.EmployeeID


