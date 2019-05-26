-- Question 3: If you look for users and ratings, does Pareto principle hold?

DROP TABLE IF EXISTS number_ratings_userlevel;
-- Building temporary table to calculate number of ratings from each user
CREATE TEMPORARY TABLE number_ratings_userlevel

SELECT a.`User-ID`
, COUNT(0) AS 'number_ratings'

FROM book.`bx-book-ratings` AS a

WHERE 1=1
AND a.`Book-Rating` <> 0 -- Implicit ratings neglected

GROUP BY 1;

-- Creating temporary table to get the top 20% users and their amount of ratings

SET @rowindex := 0;

CREATE TEMPORARY TABLE pareto_users_ratings

SELECT * FROM

(SELECT @rowindex:=@rowindex + 1 AS rowindex
, `User-ID`
,  number_ratings

FROM number_ratings_userlevel

ORDER BY 3 DESC) a

JOIN (SELECT COUNT(0) AS total_users FROM book.`bx-users`) b


WHERE rowindex <= 0.2*total_users;

-- Summing up all ratings for top 20% users and building % (of overall ratings)

SELECT SUM(number_ratings) / total_ratings AS relative_amount_ratings_top20_users

FROM pareto_users_ratings

JOIN (SELECT COUNT(0) AS total_ratings FROM book.`bx-book-ratings`) a

GROUP BY total_ratings;

-- Result: The top 20% users account for 35.8% of ratings; Pareto doesn't hold
