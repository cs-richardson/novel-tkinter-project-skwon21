BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Purchase" (
	"CustomerID"	INTEGER NOT NULL,
	"BookID"	INTEGER NOT NULL,
	"PurchaseDate"	INTEGER NOT NULL,
	PRIMARY KEY("CustomerID","BookID","PurchaseDate"),
	FOREIGN KEY("CustomerID") REFERENCES "Customer"("CustomerID"),
	FOREIGN KEY("BookID") REFERENCES "Novel"("BookID")
);
CREATE TABLE IF NOT EXISTS "Customer" (
	"CustomerID"	INTEGER NOT NULL,
	"CustomerName"	VARCHAR(50) NOT NULL,
	"CustomerDOB"	DATE NOT NULL,
	PRIMARY KEY("CustomerID")
);
CREATE TABLE IF NOT EXISTS "Novel" (
	"BookID"	INTEGER NOT NULL,
	"Title"	VARCHAR(50) NOT NULL,
	"NovelPD"	DATE NOT NULL,
	"AuthorID"	INTEGER NOT NULL,
	PRIMARY KEY("BookID"),
	FOREIGN KEY("AuthorID") REFERENCES "Author"("AuthorID")
);
CREATE TABLE IF NOT EXISTS "Author" (
	"AuthorID"	INTEGER NOT NULL,
	"AuthorDOB"	DATE NOT NULL,
	"AuthorName"	VARCHAR(50) NOT NULL,
	PRIMARY KEY("AuthorID")
);
INSERT INTO "Purchase" ("CustomerID","BookID","PurchaseDate") VALUES (1,6,'2020-1-3'),
 (1,3,'2020-2-24'),
 (1,7,'2019-11-27'),
 (2,1,'2019-11-25'),
 (2,4,'2019-12-24');
INSERT INTO "Customer" ("CustomerID","CustomerName","CustomerDOB") VALUES (1,'San Kwon','2003-2-7'),
 (2,'Albert Wang','2002-9-9'),
 (3,'Ben Nguyen','2003-10-7');
INSERT INTO "Novel" ("BookID","Title","NovelPD","AuthorID") VALUES (1,'Looking for Alaska','2005-3-3',1),
 (2,'The Fault in Our Stars','2012-1-10',1),
 (3,'The Shining','1977-1-28',2),
 (4,'The Grapes of Wrath','1939-4-14',3),
 (5,'Of Mice and Men','1937-11-23',3),
 (6,'East of Eden','1952-9-19',3),
 (7,'I Know Why the Caged Bird Sings','9-9-1969',4),
 (8,'And Still I Rise','1978-2-7',4),
 (9,'Paper Towns','2008-10-16',1),
 (10,'It','1986-12-02',2),
 (11,'Letter to My Daughter','2008-09-23',4),
 (12,'The Pearl','1947-07-09',3),
 (13,'Turtles All the Way Down','2017-10-10',1),
 (14,'The Outsider','2018-05-22',2),
 (15,'End of Watch','2016-06-07',2),
 (16,'Elevation','2018-10-30',2),
 (17,'The Institute','2019-09-10',2),
 (18,'Finders Keepers','2015-06-02',2);
INSERT INTO "Author" ("AuthorID","AuthorDOB","AuthorName") VALUES (1,'1977-8-24','John Green'),
 (2,'1947-9-21','Stephen King'),
 (3,'1902-2-27','John Steinbeck'),
 (4,'1928-4-4','Maya Angelou');
COMMIT;
