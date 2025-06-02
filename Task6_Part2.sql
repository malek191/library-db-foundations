-- Task 6.2: LEFT JOIN: List all books and any associated loan details (books with no loans still appear)
SELECT Books.title, Loans.loan_id, Loans.loan_date
FROM Books
LEFT JOIN Loans ON Books.book_id = Loans.book_id;