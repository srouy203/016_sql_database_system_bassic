/*	Insert new information.sql
	INSERT statement ប្រើសម្រាប់បន្ថែមព័ត៌មានថ្មីទៅក្នុងជួរដេកទទេរថ្មីមួយនៃតារាង។
	Syntax
		INSERT INTO តារាង​ (ជួរឈរទី១, ជួរឈរទី២, ........, ជួរឈរទីn )VALUES (តម្លៃទី១, តម្លៃទី២,..., តម្លៃទី N)
	រឺ
		INSERT INTO តារាង VALUES (តម្លៃទី១, តម្លៃទី២,....,តម្លៃទីn)
*/
INSERT INTO Course (CouseID, CourseName, Abbreviation) VALUES (3, 'Database System','DB');
INSERT INTO Course VALUES (1, 'Data Comunication',Null);
INSERT INTO Course VALUES (5, '21st centerry','ABC');

SELECT * FROM Course;

SELECT * FROM Course WHERE CouseID<4; 
DELETE FROM Course WHERE CouseID=1;
SELECT * FROM Course WHERE Abbreviation IS NULL;

SELECT * FROM Course WHERE CourseName LIKE 'da%';
SELECT * FROM Course ORDER BY CourseName ASC;

SELECT SUM(CouseID) FROM Course;





INSERT INTO Book (BookID, BookName, BookCategory) VALUES (1, 'Social', 'Khmer');
UPDATE Book SET BookName = 'Physic' WHERE BookName = 'Math';

SELECT * FROM Book WHERE BookID = 3;

DELETE FROM Book WHERE BookID = 3;

TRUNCATE TABLE Book;

ALTER TABLE Book ADD Bookshop VARCHAR (90);
ALTER TABLE Book ALTER COLUMN Bookshop INT;