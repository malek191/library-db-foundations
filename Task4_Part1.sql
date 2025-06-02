-- Task 4.1: List all books (showing book_id, title, year) sorted by publication year (descending order)
SELECT book_id, title, year 
FROM Books 
ORDER BY year DESC;