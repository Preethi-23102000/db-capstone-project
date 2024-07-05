DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE max_quantity INT;

    SELECT MAX(Quantity) INTO max_quantity
    FROM `littlelemondb`.orders;

    SELECT max_quantity AS max_ordered_quantity;
END //

DELIMITER ;
