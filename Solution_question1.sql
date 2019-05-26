-- Question 1: How many users have made exactly 2 ratings?

DROP TABLE IF EXISTS number_ratings_userlevel;
-- Building temporary table to calculate tnumber of ratings from each user
CREATE TEMPORARY TABLE number_ratings_userlevel

SELECT a.`User-ID`
, COUNT(0) AS 'number_ratings'

FROM books.`bx-book-ratings` AS a

WHERE 1=1
AND a.`Book-Rating` <> 0 -- implicit rating neglected

GROUP BY 1;

-- Query to count the users with a specific amount of given ratings

SELECT number_ratings
, COUNT(0) AS number_users

FROM number_ratings_userlevel

WHERE 1=1
AND number_ratings = 2; -- Filter set to 2 ratings as requested

-- Result: 9855 users have rated books exactly 2 times (explicit ratings)
