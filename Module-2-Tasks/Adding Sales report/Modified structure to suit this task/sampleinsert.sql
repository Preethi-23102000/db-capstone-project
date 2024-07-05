INSERT INTO littlelemondb.customer
VALUES
(1, 'John Doe', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane Smith', '987-654-3210', 'jane.smith@example.com'),
(3, 'Michael Johnson', '111-222-3333', 'michael.johnson@example.com');

INSERT INTO littlelemondb.bookings 
VALUES
(1, '2024-07-03', 5, 1),
(2, '2024-07-04', 8, 2),
(3, '2024-07-05', 3, 3);

INSERT INTO littlelemondb.orders 
VALUES
(101, '2024-07-03', 2, 50.00, 1),
(102, '2024-07-04', 3, 75.00, 2),
(103, '2024-07-05', 1, 25.00, 3);


INSERT INTO littlelemondb.menus
VALUES
(1, 'Summer Menu', 'Italian'),
(2, 'Winter Menu', 'French'),
(3, 'Spring Menu', 'Asian');

INSERT INTO littlelemondb.orderdeliverystatus
VALUES
(201, 101, 'Delivered', '2024-07-04'),
(202, 102, 'In Progress', '2024-07-05'),
(203, 103, 'Delivered', '2024-07-06');

INSERT INTO littlelemondb.staff
VALUES
(1, 'Sarah Brown', 'Waiter', 2500.00),
(2, 'Mark Davis', 'Chef', 3500.00),
(3, 'Emily White', 'Manager', 4500.00);

INSERT INTO littlelemondb.orderdetails
VALUES
(301, 101, 1, 2, 50.00),
(302, 102, 2, 3, 75.00),
(303, 103, 3, 1, 25.00);

INSERT INTO littlelemondb.staffandorder
VALUES
(401, 101, 1),
(402, 102, 2),
(403, 103, 3);

INSERT INTO littlelemondb.menuitem
VALUES
(1, 'Pasta Carbonara', 'Caprese Salad', 'Tiramisu'),
(2, 'Coq au Vin', 'French Onion Soup', 'Crème Brûlée'),
(3, 'Sushi Platter', 'Miso Soup', 'Green Tea Ice Cream');

INSERT INTO littlelemondb.menuitemrelation 
VALUES
(501, 1, 1),
(502, 2, 2),
(503, 3, 3);
