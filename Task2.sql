-- Task 2: Create Tables
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Publisher (
    publisher_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Books (
    book_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255),
    Authors_List_id INT,
    year INT,
    publisher_id VARCHAR(10),
    FOREIGN KEY (Authors_List_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

CREATE TABLE Members (
    member_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Loans (
    loan_id VARCHAR(10) PRIMARY KEY,
    book_id VARCHAR(10),
    member_id VARCHAR(10),
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id VARCHAR(10),
    amount DECIMAL(10,2),
    paid_date DATE,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);
