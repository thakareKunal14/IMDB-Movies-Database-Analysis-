# IMDB Movies Database Analysis (SQL)

- **Language:** SQL
- **Concepts Used:**
    - SELECT queries
    - JOIN operations
    - GROUP BY & Aggregations
    - ORDER BY & Filtering
    - Subqueries
    - LIMIT & OFFSET

---

## 🗂️ Dataset Description

### **Directors Table**

- **ID** – Unique director ID
- **Name** – Director’s name
- **Gender** – 0/2 = Male, 1 = Female
- **Department** – Director’s department

### **Movies Table**

- **ID** – Unique movie ID
- **Original_Title** – Movie name
- **Budget** – Movie budget
- **Popularity** – Popularity score
- **Release_Date** – Movie release date
- **Revenue** – Revenue generated
- **Vote_Average** – Average rating
- **Vote_Count** – Number of votes
- **Overview** – Movie description
- **Tagline** – Movie tagline
- **Director_ID** – Director reference ID

---

## 🔍 Key Business Questions Solved

- Retrieve complete movies and directors data
- Count total movies in the database
- Find specific directors by name
- Identify directors whose names start with specific letters
- Count female directors in the industry
- Determine the 10th female director alphabetically
- Discover the most popular movies
- Identify the most bankable movies by revenue
- Find the highest-rated movie since 2000
- Map movies to their directors
- Identify the most productive director
- Determine the most bankable director


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


![1.png](attachment:e253d0cd-c8e9-4ecb-bba7-368eb890ae94:1.png)

![2.png](attachment:432f8e3f-cb9a-45cd-8602-2cfae9ef37f4:2.png)

![3.png](attachment:9da7ef8d-3920-46e1-8d20-e106e72e9bb1:3.png)

![4.png](attachment:8a9fa84d-174a-4a77-89f5-eeee5e3c3788:4.png)

![5.png](attachment:371b0bbb-19b8-4d26-b4be-428153e859ff:5.png)

![6.png](attachment:dd2ee63c-4c1f-4483-8fea-45f2baa02926:6.png)

![7.png](attachment:a2d43900-3f04-4424-bf2f-7a4498e21abd:7.png)

![8.png](attachment:6d6aa8eb-2a7b-4124-9cd9-402afb34afdb:8.png)

![9.png](attachment:62939781-8607-4a3c-a4c0-7cd3bf83c75a:9.png)

![Red Black Modern Movie Cinema Presentation.png](attachment:56796e4c-a855-4b64-ac21-72d0ffdc310f:Red_Black_Modern_Movie_Cinema_Presentation.png)

## 📊 Key Insights

✔️ Identified top-performing movies based on popularity and ratings

✔️ Determined revenue leaders and most bankable titles

✔️ Analyzed gender distribution among directors

✔️ Discovered directors with the highest productivity

✔️ Measured director success using revenue aggregation

✔️ Evaluated trends in movie ratings post-2000

---

## 🚀 Project Impact

This project demonstrates the ability to:

- Work with relational databases
- Write optimized SQL queries
- Convert raw data into business insights
- Think analytically about real-world datasets
- Present findings in a structured format

It reflects practical skills valuable for **Data Analyst, SQL Developer, and BI roles**.

---

## 📎 Conclusion

The IMDb Movies SQL Analysis project highlights how SQL can be used to extract meaningful insights from entertainment data. From identifying blockbuster movies to evaluating director success, this project showcases strong data querying and analytical thinking skills.
