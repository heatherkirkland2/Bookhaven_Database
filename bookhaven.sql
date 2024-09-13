-- Create the BookHaven database
CREATE DATABASE BookHaven;
USE BookHaven;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    publication_year INT,
    price DECIMAL(12, 2),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

-- Create Transactions table
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    transaction_date DATETIME NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (first_name, last_name, birthdate, nationality) VALUES
('George', 'Orwell', '1903-06-25', 'British'),
('Jane', 'Austen', '1775-12-16', 'British'),
('Mark', 'Twain', '1835-11-30', 'American'),
('J.K.', 'Rowling', '1965-07-31', 'British'),
('Ernest', 'Hemingway', '1899-07-21', 'American');

-- Insert sample data into Books table
INSERT INTO Books (title, genre, publication_year, price, author_id) VALUES
('1984', 'Dystopian', 1949, 15.99, 1),
('Pride and Prejudice', 'Romance', 1813, 9.99, 2),
('Adventures of Huckleberry Finn', 'Adventure', 1884, 12.99, 3),
('Harry Potter and the Sorcerer's Stone', 'Fantasy', 1997, 29.99, 4),
('The Old Man and the Sea', 'Literary Fiction', 1952, 14.99, 5);

-- Insert sample data into Customers table
INSERT INTO Customers (first_name, last_name, email, phone_number, address) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak Avenue'),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '789 Pine Road'),
('Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', '101 Maple Lane'),
('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234', '202 Birch Boulevard');

-- Insert sample data into Transactions table
INSERT INTO Transactions (customer_id, book_id, transaction_date, quantity, total_price) VALUES
(1, 1, '2024-08-01 10:00:00', 1, 15.99),
(2, 2, '2024-08-02 11:30:00', 2, 19.98),
(3, 3, '2024-08-03 14:45:00', 1, 12.99),
(4, 4, '2024-08-04 16:00:00', 1, 29.99),
(5, 5, '2024-08-05 09:15:00', 3, 44.97);
