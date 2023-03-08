/*		7.1 ONION
*ONION (ប្រជុំ) គឺប្រមូលជួរដេកទាំងអស់ក្នុងតារាងទាំងពីមកដាក់ជុំគ្នា ដោយជួរដេកដែលដូចគ្នារួម
បញ្ចូលយកតែមួយ។
	ជ្រើសយកទីក្រុង និងប្រទេសរបស់អតិថិជនផង របស់បុគ្គលិកផង។
	SELECT City, Country FROM Customers
	UNION
	SELECT City, Country FROM Employees
	--លទ្ធផលបាន 71 គឺដោយសារទិន្នន័យឬព័ត៌មានដូចគ្នា ត្រូវបានរួមបញ្ចូលយកតែមួយ។
	
	SELECT City, Country FROM Customers
	UNION ALL
	SELECT City, Country FROM Employees
	--លទ្ធផលបាន 100 គឺដោយសារ UNION ALL មិនបានរួមបញ្ចូលយកតែមួយ កាលណាទិន្នន័យ
	  ឬព័ត៌មានដូចគ្នា។
*/
