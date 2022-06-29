SELECT t2.customerId, t2.productName
FROM(
    SELECT 
          t1.customerId, 
          t1.productName, 
          MAX(t1.orderDate)
    FROM(
        SELECT 
              pb.customerId, 
              p.productName, 
              pb.orderId, 
              pb.orderDate, 
              MAX(p.UnitPrice)
        FROM ProductsBuyed pb
        JOIN Products p
            ON pb.productId = p.productId
        GROUP BY pb.orderId
        ORDER BY pb.customerId, pb.orderDate DESC) as t1
    GROUP BY customerId)as t2
