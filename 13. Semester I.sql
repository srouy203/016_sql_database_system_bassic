1. សរសេរកូដ SQL បង្កើត
 - មូលទិន្នន័យឈ្មោះ SQLMA
 - login ឈ្មោះ User 1 ដែលមានពាក្យសម្ងាត់ User One
 - user ឈ្មោះ User 1 សម្រាប់ login ឈ្មោះ User 1

CREATE DATABASE SQLMA;
CREATE LOGIN User1 WITH PASSWORD ='User One' , CHECK_POLICY = OFF;
CREATE USER user1 FOR LOGIN user1;

2. ដោយប្រើប្រាស់មូលទិន្នន័យ SQLMA បង្កើតតារាងតាមរចនាសម្ព័ន្ធខាងក្រោម៖
- តារាងផលិតផល(Product) មាន លេខសម្គាល់ផលិតផល(ProID) ជា INT ហើយចាំបាច់ និងជា PRIMAY KEY, ឈ្មោះផលិតផល(ProName) ជា VARCHAR(25) ហើយចាំបាច់, តម្លៃ(Price) ជា MONEY ហើយចាំបាច់, បរិមាណដែលមាន(QtyInStock) ជា INT ហើយចាំបាច់។
- តារាងពេលលក់(Sale) មាន លេខសម្គាល់ពេលលក់(SaleID) ជា INT ហើយចាំបាច់ និងជា PRIMAY KEY, កាលបរិច្ឆេទលក់(SaleDate) ជា DATE ហើយចាំបាច់, លក់ដុំឬលក់រាយ isWholeSale ជា BIT មិនសូវចាំបាច់។
- តារាងផលិតផលបានលក់(SoldProduct) មាន លេខសម្គាល់ពេលលក់(SaleID) ជា INT ហើយចាំបាច់ជា FOREIGN KEY, លេខសម្គាល់ផលិតផល(​​ProID) ជា INT ហើយចាំបាច់ជា FOREIGN KEY, បរិមាណបានលក់(SoldQty) ជា INT ចាំបាច់។
USE SQLMA;
CREATE TABLE Product(
	ProID INT NOT NULL,
	ProName VARCHAR(25) NOT NULL,
	Price MONEY NOT NULL,
	QtyInStock INT NOT NULL,
	CONSTRAINT PK_Product_ProID PRIMARY KEY(ProID),
);
INSERT INTO Product(ProID,ProName,Price,QtyInStock) VALUES (4,'Book',8,100)
GO
CREATE TABLE Sale(
	SaleID INT NOT NULL,
	SaleDate DATE NOT NULL,
	isWholeSale BIT,
	CONSTRAINT PK_Sale_SaleID PRIMARY KEY (SaleID),
);
GO
CREATE TABLE SoldProduct(
	SaleID INT NOT NULL,
	ProID INT NOT NULL,
	SoldQty INT NOT NULL,
	CONSTRAINT FK_SoldProduct_SaleID FOREIGN KEY (SaleID) REFERENCES Sale(SaleID),
	CONSTRAINT FK_SoldProduct_ProID FOREIGN KEY (ProID) REFERENCES Product(ProID),
);
3. កែ តារាង 
- Product ដាក់ដាក់លក្ខន្តិកៈ Price មានតម្លៃនៅចន្លោះ 0.51 និង 200។
- SoldProduct ដាក់លក្ខន្តិកៈ SoldQty មានតម្លៃចាប់ពី 1 ឡើងទៅ។។
- SoldProductដាក់ SaleID និង ProID ជា Primary Key។

ALTER TABLE Product ADD CONSTRAINT CK_Product_Price​ CHECK(Price BETWEEN 0.51 AND 200);
ALTER TABLE SoldProduct ADD CONSTRAINT CK_SoldProduct_SoldQty CHECK(SoldQty>=1);
ALTER TABLE SoldProduct ADD CONSTRAINT PK_SoldProduct_SaleID_ProID PRIMARY KEY(SaleID, PayID);

4. ផ្តល់សិទ្ធ ទាញយកព័ត៌មាន(SELECT), កែព័ត៌មាន(UPDATE), ថែមព័ត៌មានថ្មី(INSERT) លើតារាង Product  នៃមូលទិន្នន័យ SQLMA ទៅកាន់អ្នកប្រើប្រាស់ User 1។
GRANT SELECT,UPDATE,INSERT ON Product TO User1;

5. ផ្តល់សិទ្ធ ALTER, CREATE TABLE,  និងសិទ្ធ REFERENCES ទៅជួរឈរ ProID នៃតារាង Product ក្នុងមូលទិន្នន័យ SQLMA ទៅកាន់អ្នកប្រើប្រាស់ User 1។
USE SQLMA;
GRANT ALTER,CREATE TABLE,REFERENCES(ProID) ON Product TO User1;

6. ថែមព័ត៌មានពីផលិតផលថ្មីមួយ 101, 'XYZ' , 6.9, 300។
INSERT INTO Product(ProID, ProName, Price, QtyInStock) VALUES(101, 'XYZ' , 6.9, 300);

7. កែព័ត៌មានពីផលិតផល មានលេខសម្គាល់ 101 ដាក់បរិមាណដែលមាន 800 និងតម្លៃ 9.6។
UPDATE Product SET QtyInStock=800, Price=9.6 WHERE ProID=101;

8. លុបផលិតដែលបរិមាណមានស្មើសូន្យ ។
DELETE FROM Product WHERE QtyInStock=0;

9. បង្ហាញកាលបរិច្ឆេទលក់(SaleDate) និងប្រាក់សរុបត្រូវបង់ សម្រាប់ពេលលក់ដែលមានលេខសម្គាល់(SaleID)ស្មើ 1000001។
SELECT S.SaleDate, (SP.SoldQty* P.Price) AS AmountPay FROM (Product AS P INNER JOIN SoldProduct AS SP ON P.ProID=SP.ProID) INNER JOIN Sale AS S ON S.SaleID=SP.SaleID WHERE SP.SaleID=10000001;

10. បង្ហាញព័ត៌មានរបស់ផលិតផលពីរមុខ ដែលទីមួយឈ្មោះ Product One រីឯទី២មានឈ្មោះ 2nd Product ។
SELECT * FROM Product WHERE ProName='Product One' AND ProName='2nd Product';

11. បង្ហាញលេខសម្គាល់ពេលលក់(SaleID), កាលបរិច្ឆេទលក់(SaleDate), ឈ្មោះផលិតផល(ProName)ុ, តម្លៃ(Price), និងបរិមាណបានលក់(SoldQty)។
SELECT S.SaleID, S.SaleDate, P.ProName, P.Price, SP.SoldQty FROM(Product AS P INNER JOIN SoldProduct AS SP ON P.ProID=SP.ProID) INNER JOIN Sale AS S ON S.SaleID=SP.SaleID;

12. បង្ហាញលេខសម្គាល់ពេលលក់(SaleID), កាលបរិច្ឆេទលក់(SaleDate) និងប្រាក់សរុបត្រូវបង់។
SELECT S.SaleID, S.SaleDate, (P.Price*SP.SoldQty) FROM(Product AS P INNER JOIN SoldProduct AS SP ON P.ProID=SP.ProID) INNER JOIN Sale AS S ON S.SaleID=SP.SaleID;

13. បង្ហាញព័ត៌មានពីពេលលក់ដុំ ពោលគឺជួរឈរ isWholeSale មានតម្លៃ ។
SELECT * FROM Sale WHERE isWholeSale IS NOT NULL;

14. បង្ហាញលេខសម្គាល់ពេលលក់(SaleID), កាលបរិច្ឆេទលក់(SaleDate), ឈ្មោះផលិតផល(ProName) និង តម្លៃ(Price)។
SELECT S.SaleID, S.SaleDate, P.ProName, P.Price FROM (Sale AS S INNER JOIN SoldProduct AS SP ON S.SaleID=SP.SaleID) INNER JOIN Product AS P ON P.ProID=SP.ProID;

15. បង្ហាញ លេខសម្គាល់ផលិតផល(ProID), បរិមាណដែលមាន(QtyInStock), តម្លៃជាដុល្លារ(Price), តម្លៃជារៀល គិតអត្រា១ដុល្លារស្នើ៤១០០រៀល។
SELECT ProID, QtyInStock, Price, (Price*4100) AS PriceReal FROM Product;

16. បង្ហាញព័តមានពីផលិតផលដែលឈ្មោះរបស់វាបញ្ចប់ដោយ ab។
SELECT * FROM Product WHERE ProName LIKE '%ab';

17. បង្ហាញលេខសម្គាល់ពេលលក់(SaleID), កាលបរិច្ឆេទលក់(SaleDate) និងប្រាក់សរុបត្រូវបង់ ដែលមានប្រាក់សរុបត្រូវបង់ចាប់ពី ១០០០ពាន់ដុល្លាឡើងទៅ។
SELECT S.SaleID, S.SaleDate, (P.Price*SP.SoldQty) FROM(Product AS P INNER JOIN SoldProduct AS SP ON P.ProID=SP.ProID) INNER JOIN Sale AS S ON S.SaleID=SP.SaleID WHERE P.Price*SP.SoldQty>=1000;

18. បង្ហាញលេខសម្គាល់ពេលលក់(SaleID), កាលបរិច្ឆេទលក់(SaleDate), ឈ្មោះផលិតផល(ProName)ុ, តម្លៃ(Price), និងបរិមាណបានលក់(SoldQty) ដែលបានលក់ក្នុងឆ្នាំ២០២១។
SELECT S.SaleID, S.SaleDate, P.ProName, P.Price, SP.SoldQty FROM (Sale AS S INNER JOIN SoldProduct AS SP ON S.SaleID=SP.SaleID) INNER JOIN Product AS P ON P.ProID=SP.ProID WHERE S.SaleDate LIKE '2021-%-%';

19. បង្ហាញព័ត៌មានពីផលិតផលមានតម្លៃចន្លោះ ១០ ដល់ ១០០ដុល្លារ។
SELECT * FROM Product WHERE Price>10 AND Price<100;

20. បង្ហាញលេខសម្គាល់ពេលលក់(SaleID), កាលបរិច្ឆេទលក់(SaleDate) និងប្រាក់សរុបត្រូវបង់ ដែលមានប្រាក់សរុបត្រូវបង់ចាប់ពី ១០០០ពាន់ដុល្លាឡើងទៅ ក្នុងខែមេសា ដោយតម្រៀបព័ត៌មានតាមលំដាប់កើននៃប្រាក់សរុបត្រូវបង់។
SELECT S.SaleID, S.SaleDate, (P.Price*SP.SoldQty) AS AmountPay FROM (Sale AS S INNER JOIN SoldProduct AS SP ON S.SaleID=SP.SaleID) INNER JOIN Product AS P ON P.ProID=SP.ProID WHERE P.Price*SP.SoldQty>=1000 AND S.SaleDate LIKE '%-04-%' ORDER BY P.Price*SP.SoldQty ASC;



