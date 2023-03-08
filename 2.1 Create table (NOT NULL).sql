/*		create table.sql
		ស្នើបង្កើតតារាង course មួយក្នុងមូលទិន្នន័យ SLS ដោយក្នុងតារានេះមាន
		ជួរឈរទី ១ CourseID ជាលេខចំនួនគត់តូចជាងគេ និងចាំបាច់ត្រូវមាន
		ជួរឈរទី ២ Coursename ជាឃ្លាមានអក្សរច្រើនបំផុតត្រឹម ៥០ តួនិងចាំបាច់ត្រូវមាន
		ជួរឈរទី ៣ Abbreviation ជាឃ្លាមានប្រវែងស្មើគ្នាគឺ៣តួរ និងចាំបាច់ត្រូវមាន
		ជួរឈរទី ៤ Description ជាឃ្លាមានអក្សរច្រើនបំផុតត្រឹម២៥៥តួរ
		*ចំណាំ CourseID លេខសម្គាល់វគ្គសិក្សា, CourseName ឈ្មោះវគ្គសិក្សា, Abbriviation អក្សរកាត់នៃវគ្គសិក្សា។

CREATE TABLE ឈ្មោះតារាង (ឈ្មោះជួរឈរទី១ ប្រភេទទិន្នន័យរបស់ជួរឈរ,
											  ឈ្មោះជួរឈរទី២ ប្រភេទទិន្នន័យរបស់ជួរឈរ,
											  .....
											  )
*/
CREATE TABLE Course1(
CourseID TINYINT NOT NULL,
CourseName VARCHAR(50) NOT NULL,
Abbreviation CHAR(3) NOT NULL,
Description VARCHAR(255)
);