-- Task 7.3: Calculate the total fines per member by summing the amounts from the Fines table, grouping by member
SELECT Members.name, SUM(Fines.amount) AS total_fines
FROM Members
JOIN Loans ON Members.member_id = Loans.member_id
JOIN Fines ON Loans.loan_id = Fines.loan_id
GROUP BY Members.name;