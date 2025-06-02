-- Task 6.1: INNER JOIN: Show the member name, book title, and loan date for all active loans
SELECT Members.name, Books.title, Loans.loan_date
FROM Loans
JOIN Members ON Loans.member_id = Members.member_id
JOIN Books ON Loans.book_id = Books.book_id
WHERE Loans.return_date IS NULL;