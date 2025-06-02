-- Task 8.2: Create a view that summarizes, for each member with overdue loans, both the total number of fines and the sum of fine amounts. This view should join the Members, Loans, and Fines tables, filter for overdue loans, and group the results by member. 
CREATE VIEW MemberFines AS
SELECT Members.name, COUNT(Fines.fine_id) AS total_fines, SUM(Fines.amount) AS fine_amount 
FROM Members
JOIN Loans ON Members.member_id = Loans.member_id
JOIN Fines ON Loans.loan_id = Fines.loan_id
WHERE Loans.due_date < CURDATE() AND Loans.return_date IS NULL
GROUP BY Members.name;