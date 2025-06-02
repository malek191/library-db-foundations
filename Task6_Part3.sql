-- Task 6.3: FULL JOIN: Combine member and loan information so that every member is listed (even if they have no loans), and every loan is included. 
SELECT Members.name, Loans.loan_id, Loans.loan_date
FROM Members
LEFT JOIN Loans ON Members.member_id = Loans.member_id
UNION
SELECT Members.name, Loans.loan_id, Loans.loan_date
FROM Members
RIGHT JOIN Loans ON Members.member_id = Loans.member_id;