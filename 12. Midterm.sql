១. បង្កើតមូលទិន្នន័យ MIDMA
CREATE DATABASE MIDMA;

២. ដោយប្រើប្រាស់មូលទិន្នន័យ MIDMA បង្កើតតារាងតាមរចនាសម្ព័នខាងក្រោម៖
- តារាងនិស្សិត(Student) មាន៖
លេខសម្គាល់និស្សិត(StuID) ជា INT ហើយចាំបាច់ និងជា PRIMAY KEY, 
ឈ្មោះនិស្សិត(StuName) ជា VARCHAR(30) ហើយចាំបាច់, 
ភេទ(Sex) ជា VARCHAR(6) ហើយចាំបាច់, 
ថ្ងៃខែឆ្នាំកំណើត(BirthDate) ជា DATE ហើយចាំបាច់, 
អាស័យដ្ឋាន(Address) ជា VARCHAR(318)ហើយចាំបាច់, 
ទូរស័ព្ទ(Telephone) ជា VARCHAR(16) ហើយមិនសូវចាំបាច់។ 
- តារាងពេលបង់ប្រាក់(Pay) មាន៖
លេខសម្គាល់ពេលបង់ប្រាក់(PayID) ជា INT ហើយចាំបាច់ និងជា PRIMAY KEY, 
លេខសម្គាល់និស្សិត(StuID) ជា INT ហើយចាំបាច់ ជា FOREIGN KEY, 
កាលបរិច្ឆេទបង់ប្រាក់(PayDate) ជា DATE ហើយចាំបាច់។
- តារាងលម្អិតនៃការបង់ប្រាក់(Paymentl) មាន៖
លេខសម្គាល់ពេលបង់ប្រាក់(PayID) ជា INT ហើយចាំបាច់ជា FOREIGN KEY, 
ចំនួនប្រាក់បានបង់(Amount) ជា MONEY ហើយចាំបាច់, 
បង់សម្រាប់ឆ្នាំសិក្សា(SchoolYear) ជា CHAR(11)ហើយចាំបាច់*/
CREATE TABLE Student(
	StuID INT,				--Primary key is have index automatic (not null)
	StuName VARCHAR(30) NOT NULL,
	Sex VARCHAR(6) NOT NULL,
	BirthDate DATE NOT NULL,
	Address VARCHAR(318) NOT NULL,
	Telephone VARCHAR(16),
	CONSTRAINT PK_Student_StuID PRIMARY KEY(StuID),
);
INSERT INTO Student VALUES(10000004,'Adono','Famale','01-02-2002','Kandal','010222');

GO
CREATE TABLE Pay(
	PayID INT,
	StuID INT NOT NULL,
	PayDate Date NOT NULL,
	CONSTRAINT PK_Pay_ID PRIMARY KEY(PayID),
	CONSTRAINT FK_Pay_StuID FOREIGN KEY (StuID) REFERENCES Student(StuID),
);
INSERT INTO Pay(PayID,StuID,PayDate) VALUES(40,10000004,'2022-05-24')

GO
CREATE TABLE Payment(
	PayID INT, 
	Amount MONEY NOT NULL, 
	SchoolYear CHAR(11) NOT NULL,
	CONSTRAINT FK_Payment_PayID FOREIGN KEY(PayID) REFERENCES Pay(PayID),
);
INSERT INTO Payment(PayID,Amount,SchoolYear) VALUES(40,400,2004)

៣. កែតារាង -Student ដាក់លក្ខន្តិកៈ StuID មានតម្លៃចាប់ពី 100000 ឡើងទៅ។
				- Payment ដាក់លក្ខន្តិក: Amount ត្រូវមានតម្លៃចន្លោះ 275 និង 550។
				- Payment ដាក់ PayID និង SchoolYear ជា Primary Key។	
ALTER TABLE Student ADD CONSTRAINT CK_Student_StuID​ CHECK(StuID>=100000);
ALTER TABLE Payment ADD CONSTRAINT CK_PaymentDetail_Amount	CHECK (Amount BETWEEN 275 AND 550);
ALTER TABLE Payment ADD CONSTRAINT PK_PaymentDetail_PayID_SchoolYear PRIMARY KEY(PayID, SchoolYear);


៤. ថែមព័ត៌មានពីពេលបង់ប្រាក់ថ្មីមួយ 10000001, 1001 , '22/01/222'។
INSERT INTO Pay VALUES(10000001, 1001 ,'22-01-2022');
INSERT INTO Pay(PayId, StuID, PayDate) VALUES (10000001,1001,'2022/01/22');

៥. កែព័ត៌មាននិស្សិត មានលេខសម្គាល់ 10000001 ដាក់ឈ្មោះ Puth Chetrey និងភេទជា Female។
INSERT INTO Student VALUES(10000002,'Puth e','Male','01-02-2002','pp','0101066');
UPDATE Student SET StuName='Puth Chetre', Sex='Famale' WHERE StuID=10000001;

៦. លុបព័ត៌មានលម្អិតពីការបង់ប្រាក់ដែលមានលេខសម្គាល់ 1000001។
DELETE FROM Payment WHERE PayID=1000001;

៧. បង្ហាញលេខសម្គាល់ពេលបង់ប្រាក់(PayID), ចំនួនប្រាក់បានបង់(Amount) ជាដុល្លា, ចំនួនប្រាក់បានបង់(Amount) ជារៀលគិតអត្រា១ដុល្លារស្មើ ៤០០០រៀល, បង់សម្រាប់ឆ្នាំសិក្សា(SchoolYear)។
SELECT PayID,Amount,Amount * 4000,SchoolYear FROM PaymentDetail;

៨. បង្ហាញព័ត៌មានរបស់និស្សិតដែលទូរស័ព្ទរបស់គាត់មានលេខ 22។
SELECT * FROM Student WHERE Telephone LIKE '%22%';

៩. បង្ហាញ ឈ្មោះនិងទូរស័ព្ទ របស់និស្សិតនារីដែលអាស័យដ្ឋាននៃគាត់មានពាក្យ Phnom Penh ។
SELECT StuName,Telephone FROM Student WHERE Sex='Female' AND Address LIKE 'Phnom Penh';

១០. បង្ហាញឈ្មោះនិសិ្សត លេខសម្គាល់និស្សិត និងកាលបរិច្ឆេទបង់ប្រាក់។
SELECT S.StuName, S.StuID, P.PayDate FROM Student AS S INNER JOIN Pay AS P ON S.StuID=P.StuID;

១១. ឈ្មោះនិស្សិត លេខសម្គាល់ពេលបង់ប្រាក់ កាលបរិច្ឆេទបង់ប្រាក់ ចំនួនប្រាក់បានបង់ នៅក្នុងខែកុម្ភៈឆ្នាំ២០២២។			--JOIN 3 TABLE
SELECT S.StuName, P.PayID, P.PayDate, D.Amount FROM (Student AS S INNER JOIN Pay AS P ON S.StuID=P.StuID) INNER JOIN Payment AS D ON P.PayID=D.PayID 
WHERE P.PayDate LIKE '2022-02-%';

១២. តម្រៀបព័ត៌មានរបស់និស្សិត តាមថ្ងៃខែឆ្នាំកំណើតពីក្មេងទៅចាស់និងតាមឈ្មោះ។
SELECT * FROM Student ORDER BY BirthDate DESC, StuName;

១៣. បង្ហាញចំនួននិស្សិតប្រុសទាំងអស់។
SELECT * FROM Student WHERE Sex='Male';
SELECT COUNT(*) FROM Student WHERE Sex='Male';

១៤. បង្ហាញ ភេទ និង ចំនួននិស្សិតតាមភេទនីមួយៗ(ស្រីប៉ុន្មាននាក់, ប្រុសប៉ុន្មាននាក់)។
SELECT Sex, COUNT(*) FROM Student GROUP BY Sex;

១៥. បង្ហាញ លេខសម្គាល់និស្សិត ឈ្មោះនិស្សិត និង សរុបចំនួនប្រាក់ដែលបានបង់កន្លងមក។			--JOIN 3 TABLE
SELECT S.StuID,S.StuName, SUM(D.Amount) FROM(Student AS S INNER JOIN Pay AS P ON S.StuID=P.StuID) INNER JOIN Payment AS D
ON P.PayID = D.PayID GROUP BY S.StuID, S.StuName;

១៦. បង្ហាញ ឈ្មោះនិសិ្សត និងសរុបចំនួនប្រាក់ដែលបានបង់កន្លងមក ដែលចំនួនប្រាក់សរុបបានបង់តិចជាង 550 ដែលបានបង់ក្នុងឆ្នាំ 2022 ដោយតម្រៀបតាមលំដាប់ចុះនៃចំនួនប្រាក់សរុបបានបង់។	  --Join 3 tables
SELECT S.StuName, Sum(D.Amount) FROM(Student AS S INNER JOIN Pay AS P ON S.StuID=P.StuID) INNER JOIN Payment AS D
ON P.PayID=D.PayID WHERE P.PayDate LIKE '2022%' GROUP BY S.StuID, S.StuName HAVING SUM(D.Amount)<550 ORDER BY SUM(D.Amount) DESC;





