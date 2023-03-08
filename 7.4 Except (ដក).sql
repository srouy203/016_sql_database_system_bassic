/*	7.4 EXPEPT
*EXPEPT ឬ MINUS (ដក) គឺ យកជួរដេកដែលមានក្នុងតារាងទីមួយ និងមិនមានក្នុងតារាងទីពីរ
	ជ្រើសយកទីក្រុង និងប្រទេស ដែលមានក្នុងតារាងអតិថិជន តែមិនមានក្នុងតារាងបុគ្គលិក។
	SELECT City, Country FROM Customers
	EXCEPT
	SELECT City, Country FROM Employees
	--លទ្ធផលបាន 66 មានក្នុងតារាងអតិថិជន តែគ្មានក្នុងតារាងបុគ្គលិក។
	
	ជ្រើសយកទីក្រុង និងប្រទេស ដែលមានក្នុងតារាងបុគ្គលិក តែមិនមានក្នុងតារាងអតិិថិជន។
	SELECT City, Country FROM Employees
	EXCEPT
	SELECT City, Country FROM Customers
	--លទ្ធផលបាន 2 មានក្នុងតារាងបុគ្គលិក តែគ្មានក្នុងតារាងអតិថិជន។
*/