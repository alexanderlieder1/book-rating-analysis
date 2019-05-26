# Analysis of book ratings
The basis for the analysis is data from the Book-Crossing dataset [Book rating data](http://www2.informatik.uni-freiburg.de/~cziegler/BX/).

The dataset consists of 3 tables (Users, Books, Ratings), whose details can be found in the provided link.

The first task is to load the scraped data into a database. Here I used MySQL 8.0.12, but you are free to use another system (Code changes might be necessary).

The second task is to answer the following question by analysing the given data:

1) How many users have made exactly 2 ratings?

2) Find the mean, median, mode, and range for number of ratings made for book (that's actually 4 tasks :-)

3) If you look for users and ratings, does Pareto principle hold?

### Usage
First you need to load the 3 provided tables into a database. I used MySQL 8.0.12 and created a database **book**:
- Download the SQL dump script from the provided link and run the SQL code to create and populate the 3 mentioned tables.
- To do so you can execute the code from the MySQL workbench IDE or a similar interface

Now you can run the SQL code for the 3 solutions:
- **Solution_question_1.sql**
- **Solution_question_2.sql**
- **Solution_question_3.sql**

You can find detailed comments describing the solution in each file. The results are provided in each file as well (and in the **Solution_book-rating-analysis.txt** file).

### Program output
**Question 1: How many users have made exactly 2 ratings?**

Result 1: 9855 users have rated books exactly 2 times (explicit ratings)

**Question 2: Find the mean, median, mode, and range for number of ratings made for book.**

Result 2: mean = 2.56
min = 1
max = 707
range = 706
median = 1.00
mode = 1.00

**Question 3: If you look for users and ratings, does Pareto principle hold?**

Result: The top 20% users account for 35.8% of ratings; Pareto doesn't hold
