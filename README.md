# IMDB Movies Database Analysis (SQL)
•	Queried and analysed movies and directors data using SQL to extract key insights.
•	Performed joins, aggregations, and filtering to identify top directors, popular movies, and most bankable titles.
•	Delivered a comprehensive understanding of trends in movie ratings, popularity, and director performance.

IMDB Movies

Perform the Problem Queries:

Can you get all data about movies? 
How do you get all data about directors?
Check how many movies are present in IMDB.
Find these 3 directors: James Cameron ; Luc Besson ; John Woo
Find all directors with name starting with S.
Count female directors.
Find the name of the 10th first women directors?
What are the 3 most popular movies?
What are the 3 most bankable movies?
What is the most awarded average vote since the January 1st, 2000?
Which movie(s) were directed by Brenda Chapman?
Which director made the most movies?
Which director is the most bankable?

Attribute Information:

Table Directors:
Name: Name of the Director
ID: Unique ID of the Directors
Gender: Gender of the Director→ 0/2=Male, 1=Female
Department: Department of the Directors.

Table Movies:
ID: Unique Id for Movies
Original title: Movie name
Budget: Budget of the movie
Popularity: Popularity of the Movie
Release Date: Release date for the movies
Revenue: Revenue collected movie
Title: Initial title of the movie
Vote Average: Average IMDB rating
Vote Count: Number of Vote the movie got
Overview: Description of the movie
Tagline: Tagline of the Movie
UID: Unique ID for Movie
Director ID: Director ID

-- Project on IMDB Movies
-- Prepared by- Kunal Krishna Thakare
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
