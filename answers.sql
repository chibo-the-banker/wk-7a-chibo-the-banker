-- Question 1
CREATE TABLE OrderDetails_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Each product inserted
INSERT INTO OrderDetails_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO OrderDetails_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO OrderDetails_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO OrderDetails_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO OrderDetails_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO OrderDetails_1NF VALUES (103, 'Emily Clark', 'Phone');


-- Question 2
-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- OrderItems table 
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Populate Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Populate OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
