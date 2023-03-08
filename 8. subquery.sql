/* subquery.sql
subquery ជា query មួយដែលថិតក្នុង query មួយផ្សេងទៀតដែល query ខាងក្នុងត្រូវបានហៅថា
subquery ឯ query ខាងក្រៅត្រូវបានហៅថា main query។ ជាធម្មតា subquery ដើរមុនហើយអោយ
លទ្ធផលទៅ main query ដើម្បីយកទៅដំណើរការបន្ត។

	ឧទាហរណ៍ បង្ហាញព័ត៌មានរបស់បុគ្គលិក ដែលចូលបំរើការនៅថ្ងៃខែឆ្នាំជាមួយគ្នា (HireDate)
	និង បុគ្គលិក Steven Bunchanan (First Name Last Name)។
	SELECT * FROM Employees WHERE HireDate = (
	SELECT HireDate FROM Employees WHERE FirstName = 'Steven' AND
	LastName='Buchanan');

	បង្ហាញឈ្មោះនិងតម្លៃផលិតផលទាំងឡាយណាដែលថ្លៃស្មើគ្នា(UnitPrice)
	និង តម្លៃផលិតផលឈ្មោះ Aniseed Syrup (ProductName)
	ឬ ស្មើគ្នានិងតម្លៃផលិតផលឈ្មោះ Chai (ProductName)។
	SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice IN(
	SELECT UnitPrice FROM Products WHERE ProductName IN('Aniseed Syrup', 'Chai'));

	***កាលណា subquery ផ្តល់តម្លៃច្រើនជាងមួយអោយទៅ main query នោះ main query
	ត្រូវប្រើសញ្ញាប្រមាណវិធី
	IN							ជំនួស	=
	>ALL , >ANY				ជំនួស	>
	>=ALL , >=ANY			ជំនួស	>=				
	<ALL , <ANY				ជំនួស	<		
	<=ALL , <=ANY			ជំនួស	<=				
	NOT IN						ជំនួស	<>  ឬ  !=		
*/





