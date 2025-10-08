# Project on IMDB Movies
# Prepared by- Kunal Krishna Thakare

-- Performed the Problem Queries:


-- a) Can you get all data about movies? 
SELECT * FROM movies;

-- b) How do you get all data about directors?
SELECT * FROM directors;

-- c) Check how many movies are present in IMDB.
SELECT COUNT(*) AS Total_Movies
FROM movies;

-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM directors
WHERE Name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e) Find all directors with name starting with S.
SELECT * 
FROM directors
WHERE Name LIKE 'S%';

-- f) Count female directors.
SELECT COUNT(*) AS Female_Directors
FROM directors
WHERE Gender = 1;

-- g) Find the name of the 10th first women directors?
SELECT Name
FROM directors
WHERE Gender = 1
ORDER BY Name
LIMIT 1 OFFSET 9;

-- h) What are the 3 most popular movies?
SELECT Original_title, Popularity
FROM movies
ORDER BY Popularity DESC
LIMIT 3;

-- i) What are the 3 most bankable movies?
SELECT Original_title, Revenue
FROM movies
ORDER BY Revenue DESC
LIMIT 3;

-- j) What is the most awarded average vote since the January 1st, 2000?
SELECT Original_title, Vote_Average, Release_Date
FROM movies
WHERE Release_Date >= '2000-01-01'
ORDER BY Vote_Average DESC
LIMIT 1;

-- k) Which movie(s) were directed by Brenda Chapman?
SELECT m.Original_title, d.Name AS Director_Name
FROM movies m
JOIN directors d ON m.Director_ID = d.ID
WHERE d.Name = 'Brenda Chapman';

-- l) Which director made the most movies?
SELECT d.Name, COUNT(m.UID) AS Movie_Count
FROM directors d
JOIN movies m ON d.ID = m.Director_ID
GROUP BY d.Name
ORDER BY Movie_Count DESC
LIMIT 1;

-- m) Which director is the most bankable?
SELECT d.Name, SUM(m.Revenue) AS Total_Revenue
FROM directors d
JOIN movies m ON d.ID = m.Director_ID
GROUP BY d.Name
ORDER BY Total_Revenue DESC
LIMIT 1;