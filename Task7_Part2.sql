-- Task 7.2: Count the total number of loans per member
SELECT Members.name, COUNT(Loans.loan_id) AS loan_count
FROM Members
JOIN Loans ON Members.member_id = Loans.member_id
GROUP BY Members.name;