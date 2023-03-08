6.2 OuterJoin
CREATE DATABASE OuterJoin;
បង្កើតតារា Classes នៅក្នុងមូលទិន្នន័យ OuterJoin
CREATE TABLE	Classes(
	ClassID INT NOT NULL,
	ClassName VARCHAR(3) NOT NULL,
	RoomNumber VARCHAR(3) ,
CONSTRAINT PK_Classes_ClassID PRIMARY KEY(ClassID),
);
GO
CREATE TABLE Students(
	StudentID INT NOT NULL,
	StudentName VARCHAR(35) NOT NULL,
	Sex CHAR NOT NULL,
	BirthDate DATE NOT NULL,
	Address VARCHAR(350) NOT NULL,
	Telephone NCHAR(10),
	ClassID INT,
	CONSTRAINT PK_Students_StudentID PRIMARY KEY (StudentID),
/*	CONSTRAINT FK_Students_ClassID FOREIGN KEY (ClassID) REFERENCES  Classes(ClassID),*/
);

INSERT INTO Classes VALUES (1001,'M20',201)
INSERT INTO Classes VALUES (1002,'M21',202)
INSERT INTO Classes VALUES (1003,'A10',201)
INSERT INTO Classes VALUES (1004,'E10',202)
SELECT * FROM Classes;

INSERT INTO Students VALUES(1000001,'An Pin','M','2002-01-01','SR','010123456',1000)
INSERT INTO Students VALUES(1000005,'In Dano','M','2002-05-05','PP','017123456',1001)
SELECT * FROM Students

/* Left Join
	Left Join ជា OUTER JOIN ដែលផ្តល់គ្រប់ជួរដេកទាំងអស់នៃតារាខាងឆ្វេង
	ឯតារាខាងស្តាំវិញផ្តល់តែជួរដេកដែលបំពេញលក្ខខណ្ឌនៃការភ្ជាប់ប៉ុណ្ណោះ។

	USE OuterJoin;
	SELECT * FROM Classes AS C LEFT OUTER JOIN Students AS S ON C.ClassID=S.ClassID
*/
	SELECT * FROM Classes AS C LEFT OUTER JOIN Students AS S ON C.ClassID=S.ClassID
	SELECT * FROM Classes AS C RIGHT OUTER JOIN Students AS S ON C.ClassID=S.ClassID
	SELECT * FROM Classes AS C FULL OUTER JOIN Students AS S ON C.ClassID=S.ClassID

	/*		Right Join
	Right Join ជា OUTER JOIN ដែលផ្តល់គ្រប់ជួរដេកទាំងអស់នៃតារាងខាងស្តាំ ឯតារាងខាងឆ្វេង
	វិញផ្តល់តែជួរដេកដែលបំពេញលក្ខខណ្ឌនៃការភ្ជាប់ប៉ុណ្ណោះ។

			USE Outer Join;
	SELECT * FROM Classes AS C RIGHT JOIN Students AS S ON C.ClassID=S.ClassID
	*/
		SELECT * FROM Classes AS C RIGHT OUTER JOIN Students AS S ON C.ClassID=S.ClassID

		/*		Full Join
	Full Join ជា OUTER JOIN ដែលផ្តល់គ្រប់ជួរដេកទាំងអស់នៃតារាងខាងឆ្វេង និងស្តាំ 
	ទោះបំពេញឬ មិនបំពេញលក្ខខណ្ឌនៃការភ្ជាប់ក៏ដោយ។

			USE Outer Join;
	SELECT * FROM Classes AS C FULL OUTER JOIN Students AS S ON C.ClassID=S.ClassID
	*/
	SELECT * FROM Classes AS C FULL OUTER JOIN Students AS S ON C.ClassID=S.ClassID