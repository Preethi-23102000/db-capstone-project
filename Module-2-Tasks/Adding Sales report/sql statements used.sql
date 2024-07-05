SELECT c.CustomerID, c.CustomerName as FullName, o.OrderId as OrderID, o.TotalCost as Cost,
 m.MenuName, mi.CourseName, mi.StarterName
FROM `littlelemondb`.customer c
JOIN `littlelemondb`.orders o ON c.CustomerID = o.CustomerID
JOIN `littlelemondb`.orderdetails od ON o.OrderID = od.OrderID
JOIN `littlelemondb`.menus m ON od.MenuID = m.MenuID
JOIN `littlelemondb`.menuitemrelation mr ON m.MenuID = mr.MenuID
JOIN `littlelemondb`.menuitem mi ON mi.MenuItemId = mr.MenuItemId
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;

SELECT  m.MenuName
FROM `littlelemondb`.orders o
JOIN `littlelemondb`.orderdetails od ON o.OrderID = od.OrderID
JOIN `littlelemondb`.menus m ON od.MenuID = m.MenuID
JOIN `littlelemondb`.menuitemrelation mr ON m.MenuID = mr.MenuID
JOIN `littlelemondb`.menuitem mi ON mi.MenuItemId = mr.MenuItemId
WHERE od.QuantityOfMenuItem > 2;


CALL GetMaxQuantity();
CALL CancelOrder(101);

PREPARE GetOrderDetail FROM 'SELECT OrderId,Quantity,TotalCost FROM littlelemondb.orders where CustomerID=?;';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DEALLOCATE PREPARE GetOrderDetail;