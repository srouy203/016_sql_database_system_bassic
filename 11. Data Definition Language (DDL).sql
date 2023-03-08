	-- Data Definition Language (DDL)CREATE DATABASE DDL;
GO
USE DDL;
CREATE TABLE t1(
	c1 INT PRIMARY KEY,
	c2 CHAR(3) NOT NULL
);
CREATE TABLE t2(
	a1 INT PRIMARY KEY,
	a2 CHAR(3) NOT NULL
);
	--Data Manipulation Language(DML)
USE DDL;
INSERT INTO t1(c1, c2) VALUES(1,'R1');			--ថែមជួរដេកទី១
INSERT INTO t1(c1, c2) VALUES(2,'R2');		--ថែមជួរដេកទី២
INSERT INTO t1(c1, c2) VALUES(3,'R3');		--ថែមជួរដេកទី៣
SELECT * FROM t1;	

-- Data Control Language(DCL) ភាសាគ្រប់គ្រងការចូលទៅកាន់និងប្រើប្រាស់ទិន្នន័យក្នុងមូលទិន្នន័យ។
១. login ត្រូវបានប្រើប្រាស់សម្រាប់ភ្ជាប់ទៅកាន់មេមូលទិន្នន័យ (database server)។
	--បង្កើត login
		CREATE LOGIN ឈ្មោះសម្រាប់ចូល
		WITH PASSWORD = 'ពាក្យសម្ងាត់'
		[,DEFAULT_DATABASE=ឈ្មោះមូលទិន្នន័យ]
		[,CHECK_POLICY={ON|OFF}];
	អធិប្បាយបន្ថែម៖
		DEFAULT_DATABASE = ឈ្មោះមូលទិន្នន័យដែល login អាចប្រើបាន បើមិនបញ្ជាាក់
		គឺប្រើមូលទិន្នន័យឈ្មោះ master។
		CHECK_POLICY បើមិនកំណត់គឺមានតម្លៃដើម ON នឹងបដិសេធនូវពាក្យសម្ងាត់ទាំងឡាយ
		ណាដែលមិនបំពេញលក្ខណៈ៤គឺ៖
			ក. មានអក្សរធំ		ខ. មានអក្សរតូច
			គ. មានលេខ		ឃ. មានសញ្ញា
	USE DDL;
		CREATE LOGIN user1 WITH PASSWORD = 'aaa', CHECK_POLICY = OFF;


២. User ត្រូវបានប្រើប្រាស់ដើម្បីភ្ជាប់ទៅកាន់មូលទិន្នន័យណាមួយ។

	USE ឈ្មោះមូលទិន្នន័យ;
	CREATE USER ឈ្មោះអ្នកប្រើប្រាស់ FOR LOGIN ឈ្មោះសម្រាប់ចូល;

--បង្កើត user ដាក់់ឈ្មោះ usr1 សម្រាប់ login ដែលបានបង្កើតរួច usr1។

	USE DDL;
	CREATE USER user1 FOR LOGIN user1;
	CREATE USER usr1 FOR LOGIN usr1;

៣. Privileges សិទ្ធនៃការប្រើប្រាស់វត្ថុណាមួយ។

	--ផ្តល់សិទ្ធអោយទៅអ្នកប្រើប្រាស់
		USE មូលទិន្នន័យ;
		GRANT សិទ្ធ ON វត្ថុ TO ឈ្មោះអ្នកប្រើប្រាស់់;

	-- ដកសិទ្ធពីអ្នកប្រើប្រាស់
		USE មូលទិន្នន័យ;
		REVOKE សិទ្ធ ON វត្ថុ FROM ឈ្មោះអ្នកប្រើប្រាស់;

*ចំណាំ សិទ្ធមូលដ្ឋានមួយចំនួន
	CREATE TABLE បង្កើតតារាង
	ALTER កែរចនាសម្ព័នតារាង
	VIEW DEFINITION មើលរចនាសម្ព័នតារាង
	INSERT ថែមព័ត៌មានថ្មី
	UPDATE កែទិន្នន័យមានស្រាប់
	DELETE លុបព័ត៌មានមានស្រាប់
	SELECT រើសយកទិន្នន័យ
	REFERENCES ទំនាក់ទំនង
	EXECUTE ដំណើរការ

	-- ផ្តល់សិទ្ធ SELECT លើតារាង t1 អោយទៅអ្នកប្រើប្រាស់ usr1។
		USE DDL;
		GRANT SELECT ON t1 TO usr1;

		SELECT * FROM t1;

	-- ដកសិទ្ធ SELECT លើតារាង t1 ពីអ្នកប្រើប្រាស់ usr1។
		USE DDL;
		REVOKE SELECT ON t1 FROM usr1;

	/*ផ្តល់សិទ្ធ អាន មើល ឬទាញយកព័ត៌មាន (SELECT). កែព័ត៌មាន(UPDATE), ថែមព៍ត៌មានថ្មី(INSERT)
		លើតារាង t1 នៃមូលទិន្នន័យ DDL ទៅកាន់អ្នកប្រើប្រាស់ usr1។ */
		GRANT SELECT,UPDATE,INSERT ON t1 TO usr1;
		INSERT INTO t1(c1,c2) VALUES (8,'R8');
		SELECT * FROM t1;

		REVOKE SELECT,UPDATE,INSERT ON t1 FROM usr1;

	/*ផ្តល់សិទ្ធ REFERENCES ទៅជួរឈរ C1 នៃតារាង t1 ក្នុងមូលទិន្នន័យ DDL ទៅកាន់អ្នកប្រើប្រាស់ 
	usr1 បានសេចក្តីថាអាចភ្ជាប់ទំនាក់ទំនងទៅតារាង t1 តាមរយៈជួរឈរ c1 ដែលជា primary key
	នៃតារាងនេះ ។*/
		USE DDL;
		GRANT REFERENCES(c1) ON t1 TO usr1;

	--ផ្តល់សិទ្ធ ALTER និង CREATE TABLE ក្នុងមូលទិន្នន័យ DDL ទៅកាន់អ្នកប្រើប្រាស់ usr1។
	GRANT ALTER CREATE TABLE TO usr1;
	ALTER TABLE t2 ADD c1 INT NULL;
	ALTER TABLE t2 ADD CONSTRAINT FK_t2_c1 FOREIGN KEY(c1) REFERENCES t1(c1);