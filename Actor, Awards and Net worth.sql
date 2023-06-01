Use SuperStoreOrders

CREATE TABLE Actors (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  firstname TEXT,
  lastname TEXT,
  gender TEXT,
  age INTEGER
);

CREATE TABLE Awards (
id INTEGER PRIMARY KEY IDENTITY(1,1), 
ActorID INTEGER, 
Title TEXT, 
YearAwarded INTEGER);

CREATE TABLE NetWorth (id INTEGER PRIMARY KEY IDENTITY(1,1), 
ActorID INTEGER, 
ActorNetWorth INTEGER);

-- Insert data into the Actors table
INSERT INTO Actors (firstname, lastname, gender, age)
VALUES
  ('Brad', 'Pitt', 'Male', 58),
  ('Angelina', 'Jolie', 'Female', 46),
  ('Tom', 'Cruise', 'Male', 59),
  ('Jennifer', 'Lawrence', 'Female', 31),
  ('Robert', 'Downey Jr.', 'Male', 56),
  ('Emma', 'Stone', 'Female', 33),
  ('Matt', 'Damon', 'Male', 51),
  ('Natalie', 'Portman', 'Female', 40),
  ('Johnny', 'Depp', 'Male', 58),
  ('Scarlett', 'Johansson', 'Female', 37),
  ('Leonardo', 'DiCaprio', 'Male', 47),
  ('Charlize', 'Theron', 'Female', 46),
  ('Denzel', 'Washington', 'Male', 67),
  ('Anne', 'Hathaway', 'Female', 39),
  ('Ryan', 'Reynolds', 'Male', 45);

-- Insert data into the Awards table
INSERT INTO Awards (ActorID, Title, YearAwarded)
VALUES
  (1, 'Best Actor', 2005),
  (1, 'Best Supporting Actor', 2014),
  (2, 'Best Actress', 2000),
  (2, 'Best Supporting Actress', 2009),
  (3, 'Best Actor', 2004),
  (3, 'Best Supporting Actor', 2008),
  (4, 'Best Actress', 2013),
  (5, 'Best Actor', 2009),
  (6, 'Best Actress', 2017),
  (7, 'Best Actor', 1998),
  (8, 'Best Actress', 2011),
  (9, 'Best Actor', 2002),
  (10, 'Best Actress', 2019),
  (11, 'Best Actor', 2016),
  (12, 'Best Actress', 2005),
  (13, 'Best Actor', 2001);

-- Insert data into the NetWorth table
INSERT INTO NetWorth (ActorID, ActorNetWorth)
VALUES
  (1, 250000000),
  (2, 160000000),
  (3, 450000000),
  (4, 75000000),
  (5, 300000000),
  (6, 28000000),
  (7, 170000000),
  (8, 50000000),
  (9, 200000000),
  (10, 140000000),
  (11, 260000000),
  (12, 80000000),
  (13, 150000000),
  (14, 90000000),
  (15, 180000000);


  Select * from Actors
  SELECT * FROM Awards;
SELECT * FROM NetWorth;


--This query utilizes 2 LEFT JOIN's in order to connect all 3 tables and allows us to visualize how all the information is connected.

Select a.firstname, a.lastname, a.age, aw.Title, nw.ActorNetWorth
from Actors a
LEFT JOIN Awards aw
on a.id = aw.ActorID
left  join NetWorth nw	
on a.id = nw.ActorID

--This query allows us to see which Actors from table have a networth of over 300 Million. We find out that those actors are Dwayne Johnson and Will Smith.

Select a.firstname, a.lastname, nw.ActorNetWorth
from Actors a
left join NetWorth nw
on a.id = nw.ActorID
where nw.ActorNetWorth > 30000000


--This query searches our database to see which Actors have won the Honrary Cesar Award. We are able to find out the award belongs to both Will Smith and Meryl Streep.
SELECT A.firstname, A.lastname,  AW.Title
FROM Actors A
LEFT JOIN Awards AW
ON A.id = AW.actorID
WHERE AW.Title = "Honorary Cesar"
;


SELECT AVG(age) AS average_age FROM Actors;

SELECT a.firstname, a.lastname, n.ActorNetWorth
FROM Actors a
JOIN NetWorth n ON a.id = n.ActorID
ORDER BY n.ActorNetWorth DESC





