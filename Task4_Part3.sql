-- Task 4.3: Display all authors along with the titles of their books
SELECT Authors.name, Books.title 
FROM Authors
JOIN Books ON Authors.author_id = Books.Authors_List_id;