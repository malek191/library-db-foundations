-- Task 3: Insert Data
INSERT INTO Authors (author_id, name) VALUES
(1, 'George Orwell'),
(2, 'Jane Austen'),
(3, 'Mark Twain'),
(4, 'J.K. Rowling'),
(5, 'Ernest Hemingway');

INSERT INTO Publisher (publisher_id, name) VALUES
('C3', 'Secker & Warburg'),
('P1', 'T. Egerton'),
('P2', 'Chatto & Windus'),
('P3', 'Bloomsbury'),
('P4', 'Charles Scribner Sons');

INSERT INTO Books (book_id, title, Authors_List_id, year, publisher_id) VALUES
('L1', '1984', 1, 1949, 'C3'),
('C3', 'Pride and Prejudice', 2, 1813, 'P1'),
('D6', 'Adventures of Huckleberry Finn', 3, 1884, 'P2'),
('A8', 'Harry Potter and the Sorcerer’s Stone', 4, 1997, 'P3'),
('B7', 'The Old Man and the Sea', 5, 1992, 'P4');

INSERT INTO Members (member_id, name) VALUES
('#21', 'Alice Johnson'),
('#22', 'Bob Smith'),
('#23', 'Carol Davis'),
('#24', 'David Lee'),
('#25', 'Eva Brown');

INSERT INTO Loans (loan_id, book_id, member_id, loan_date, due_date, return_date) VALUES
('aok#306', 'L1', '#21', '2025-01-10', '2025-01-24', '2025-01-20'),
('aok#458', 'C3', '#22', '2025-02-01', '2025-02-15', '2025-02-10'),
('aok#513', 'D6', '#23', '2025-03-05', '2025-03-19', '2025-03-25'),
('aok#690', 'A8', '#24', '2025-04-12', '2025-04-26', '2025-04-30'),
('aok#727', 'B7', '#25', '2025-05-20', '2025-06-03', NULL);

INSERT INTO Fines (loan_id, amount, paid_date) VALUES
('aok#513', 5.00, '2025-03-30'),
('aok#727', 10.00, NULL);
