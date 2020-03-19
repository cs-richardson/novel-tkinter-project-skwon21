
DROP TABLE IF EXISTS Purchase;
DROP TABLE IF EXISTS Novel;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Author (
	AuthorID	 INTEGER NOT NULL,
	AuthorDOB	DATE NOT NULL,
	AuthorName	VARCHAR(50) NOT NULL,
	PRIMARY KEY(AuthorID)
);

CREATE TABLE Novel (
	BookID	INTEGER NOT NULL,
	Title	VARCHAR(50) NOT NULL,
	NovelPD	 DATE NOT NULL,
	AuthorID	 INTEGER NOT NULL,
	PRIMARY KEY(BookID),
	FOREIGN KEY(AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Customer (
	CustomerID	INTEGER NOT NULL,
	CustomerName	VARCHAR(50) NOT NULL,
	CustomerDOB	DATE NOT NULL,
	PRIMARY KEY(CustomerID)
);

CREATE TABLE Purchase (
	CustomerID	INTEGER NOT NULL,
	BookID	INTEGER NOT NULL,
	PurchaseDate	INTEGER NOT NULL,
	PRIMARY KEY(CustomerID, BookID, PurchaseDate),
	FOREIGN KEY(BookID) REFERENCES Novel(BookID),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Author(AuthorID, AuthorDOB, AuthorName) VALUES (1, '1977-8-24', 'John Green');
INSERT INTO Author(AuthorID, AuthorDOB, AuthorName) VALUES (2, '1947-9-21', 'Stephen King');
INSERT INTO Author(AuthorID, AuthorDOB, AuthorName) VALUES (3, '1902-2-27', 'John Steinbeck');
INSERT INTO Author(AuthorID, AuthorDOB, AuthorName) VALUES (4, '1928-4-4', 'Maya Angelou');

INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (1, 'Looking for Alaska', '2005-3-3', 1);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (2, 'The Fault in Our Stars', '2012-1-10', 1);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (3, 'The Shining', '1977-1-28', 2);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (4, 'The Grapes of Wrath', '1939-4-14', 3);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (5, 'Of Mice and Men', '1937-11-23', 3);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (6, 'East of Eden', '1952-9-19', 3);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (7, 'I Know Why the Caged Bird Sings', '9-9-1969', 4);
INSERT INTO Novel(BookID, Title, NovelPD, AuthorID) VALUES (8, 'And Still I Rise', '1978-2-7', 4);

INSERT INTO Customer(CustomerID, CustomerDOB, CustomerName) VALUES (1, '2003-2-7', 'San Kwon');
INSERT INTO Customer(CustomerID, CustomerDOB, CustomerName) VALUES (2, '2002-9-9', 'Albert Wang');
INSERT INTO Customer(CustomerID, CustomerDOB, CustomerName) VALUES (3, '2003-10-7', 'Ben Nguyen');

INSERT INTO Purchase(PurchaseDate, CustomerID, BookID) VALUES ('2020-1-3', 1, 6);
INSERT INTO Purchase(PurchaseDate, CustomerID, BookID) VALUES ('2020-2-24', 1, 3);
INSERT INTO Purchase(PurchaseDate, CustomerID, BookID) VALUES ('2019-11-27', 1, 7);
INSERT INTO Purchase(PurchaseDate, CustomerID, BookID) VALUES ('2019-11-25', 2, 1);
INSERT INTO Purchase(PurchaseDate, CustomerID, BookID) VALUES ('2019-12-24', 2, 4);
