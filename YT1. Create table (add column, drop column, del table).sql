CREATE TABLE Youtubeeee(
	Channel_id int primary key,
	Username varchar(20),
	Contain varchar(20)
);
DROP TABLE test;		/*delete dable*/
ALTER TABLE Youtube ADD age decimal(3,2);		/*add column*/
ALTER TABLE Youtube DROP COLUMN subject;			/*delete column*/
INSERT Youtubeeee VALUES (3,NULL,'Game');
INSERT Youtubeeee (Channel_id,Username) VALUES (2,'Revenblaze');
UPDATE Youtubeeee SET Username='Sok chanda' WHERE  Channel_id=2;
DELETE Youtubeeee WHERE Channel_id=2;
			SELECT
SELECT * FROM Youtubeeee;
SELECT * FROM Youtubeeee WHERE Channel_id=1;
SELECT * FROM Youtubeeee WHERE Channel_id>=2;