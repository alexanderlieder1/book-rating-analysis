-- Question 2: Find the mean, median, mode, and range for number of ratings made for book

DROP TABLE IF EXISTS number_ratings_booklevel;
-- Building temporary table to calculate number of ratings for each book
CREATE TEMPORARY TABLE number_ratings_booklevel

SELECT a.ISBN
, COUNT(b.`Book-Rating`) AS 'number_ratings'

FROM book.`bx-books` a

-- joining books and book ratings to ensure books without rating are not lost
LEFT JOIN book.`bx-book-ratings` AS b
ON a.ISBN = b.ISBN

WHERE 1=1
AND b.`Book-Rating` <> 0 -- Implicit rating neglected

GROUP BY 1;

-- Query to caclulate the mean, min, max, range values

SELECT AVG(number_ratings) AS mean_ratings
, MIN(number_ratings) AS min_ratings
, MAX(number_ratings) AS max_ratings
, MAX(number_ratings) - MIN(number_ratings) AS range_width

FROM number_ratings_booklevel;

-- Result: mean = 2.56; min = 1; max = 707; range = 706

-- Query to get median value

SET @rowindex := -1;

SELECT
   AVG(g.number_ratings) AS median
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex,
           number_ratings
    FROM number_ratings_booklevel
    ORDER BY 2) AS g
WHERE
g.rowindex IN (FLOOR(@rowindex / 2) , CEIL(@rowindex / 2));

-- Result: median = 1.00

-- Query to get mode

SELECT a.number_ratings AS mode

FROM

(SELECT number_ratings, COUNT(0) AS number_books

FROM number_ratings_booklevel

GROUP BY 1

ORDER BY 2 DESC) a

LIMIT 1;

-- Result: mode = 1.00
