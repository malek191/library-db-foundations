-- Task 5.2: List all loans for which the due date has passed
SELECT * 
FROM Loans 
WHERE due_date < CURDATE() AND return_date IS NULL;