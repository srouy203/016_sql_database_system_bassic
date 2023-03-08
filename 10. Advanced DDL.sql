-- Database SLS

--បង្កើតតារាង
CREATE TABLE Courses(
	CourseID INT NOT NULL,
	CourseName VARCHAR(35),
	Abbreviation VARCHAR(3)
);
--Add column
ALTER TABLE Courses ADD Sex VARCHAR(1);
--insert information
INSERT INTO Courses VALUES(3,'Ang LeangSrouy','SLS','M','Hi','Hi jdfj',NULL)
--delete information
DELETE FROM Courses WHERE CourseID = 2;

៊--ស្នើកែតារាង courses ដោយដូរ ប្រភេទទិន្នន័យនៃ Abbreviation ទៅឃ្លាមានប្រវែងស្មើៗគ្នាគឺ៣អក្សរ CHAR(3)។
ALTER TABLE Courses ALTER COLUMN Abbreviation CHAR(3);

--ស្នើកែតារាង Courses ដោយថែម ជួរឈរថ្មីមួយឈ្មោះ Description ជា VARCHAR(150)។
ALTER TABLE Courses ADD "Descript" VARCHAR(150);

	--ស្នើកែតារាង Courses ដោយកំណត់យក CourseID ជា Primary Key។
--របៀបទី១
	ALTER TABLE Courses ADD PRIMARY KEY(CourseID);

--របៀបទី២ នៃការដាក់ Primary Key
	ALTER TABLE Courses ADD CONSTRAINT PK_Courses_CourseID PRIMARY KEY(CourseID);

--ស្នើកែតារាង Courses ដោយលុបជួរឈរមួយឈ្មោះ Description
	ALTER TABLE Courses DROP COLUMN Descript; 

--ស្នើកែតារាង Courses ដោយលុប PRIMARY KEY នៃតារាង Courses
	ALTER TABLE Courses DROP CONSTRAINT PK_Courses_CourseID;

