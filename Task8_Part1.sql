-- Task 8.1: Create a view called OverdueBooks that displays details (book_id, title, member name, due_date) for overdue books.
CREATE VIEW OverdueBooks AS
SELECT Books.book_id, Books.title, Members.name AS member_name, Loans.due_date 
FROM Loans
JOIN Books ON Loans.book_id = Books.book_id
JOIN Members ON Loans.member_id = Members.member_id
WHERE Loans.due_date < CURDATE() AND Loans.return_date IS NULL;