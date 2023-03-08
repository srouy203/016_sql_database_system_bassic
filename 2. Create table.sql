/*		create table.sql
		ស្នើបង្កើតតារាង course មួយក្នុងមូលទិន្នន័យ SLS ដោយក្នុងតារានេះមាន
		ជួរឈរទី ១ CourseID ជាលេខចំនួនគត់តូចជាងគេ
		ជួរឈរទី ២ Coursename ជាឃ្លាមានអក្សរច្រើនបំផុតត្រឹម ៥៥ តួ
		ជួរឈរទី ៣ Abbreviation ជាឃ្លាមានប្រវែងស្មើគ្នាគឺ៣តួរ
		*ចំណាំ CourseID លេខសម្គាល់វគ្គសិក្សា, CourseName ឈ្មោះវគ្គសិក្សា, Abbriviation អក្សរកាត់នៃវគ្គសិក្សា។

CREATE TABLE ឈ្មោះតារាង (ឈ្មោះជួរឈរទី១ ប្រភេទទិន្នន័យរបស់ជួរឈរ,
											  ឈ្មោះជួរឈរទី២ ប្រភេទទិន្នន័យរបស់ជួរឈរ,
											  .....
											  )
*/
CREATE TABLE CourseTest(
CourseID TINYINT,
CourseName VARCHAR(55),
Abbreviation CHAR(3)
);

CREATE TABLE Book (
	BookID TINYINT,
	BookName VARCHAR(60),
	BookCategory VARCHAR(128)
)