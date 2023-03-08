/*	7.Distinct
	ជ្រើសយក ទីក្រុង និងប្រទេសរបស់អតិិថិជនទាំងអស់ ដោយតម្រៀបព័ត៌មានផងដែរ។
		SELECT City, Country FROM Customers ORDER BY City, Country
		- លទ្ធផលបាន 91 ដែលមានទីក្រុង និងប្រទេសខ្លះដូចគ្នា។
		SELECT DISTINCT City, Country FROM Customers ORDER BY City, Country
		-លទ្ធផលបាន 69 គឺ ដោយសារ DISTINCT រួមបញ្ចូលយកតែមួយកាលណាទិន្នន័យ ឬព័ត៌មានដូចគ្នា។

	ជ្រើសយក ទីក្រុង និងប្រទេស របស់បុគ្គលិកទាំងអស់ដោយតម្រៀបព័ត៌មានផងដែរ។
		SELECT City, Country FROM Employees ORDER BY City, Country
		- លទ្ធផលបាន 9 ដែលមានទីក្រុង និងប្រទេសខ្លះដូចគ្នា។
		SELECT DISTINCT City, Country FROM Employees ORDER BY City, Country
		-លទ្ធផលបាន 5 គឺ ដោយសារ DISTINCT រួមបញ្ចូលយកតែមួយកាលណាទិន្នន័យ ឬព័ត៌មានដូចគ្នា។
*/

		SELECT City, Country FROM Employees ORDER BY City, Country
GO
		SELECT DISTINCT City, Country FROM Employees ORDER BY City, Country
