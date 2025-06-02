-- Task 7.1: Count the number of books per author (group by author)
SELECT Authors.name, COUNT(Books.book_id) AS book_count
FROM Authors
JOIN Books ON Authors.author_id = Books.Authors_List_id
GROUP BY Authors.name;