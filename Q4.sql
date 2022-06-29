SELECT 
  MONTHNAME(pb.orderDate)as Month,
  COUNT(DISTINCT pb.orderId) as 'Nombre de commandes',
  COUNT(DISTINCT pb.customerId) as 'Nombre de clients actifs',
  SUM(pb.quantity*p.UnitPrice) as "Chiffre d'affaire",
  SUM(pb.quantity*p.UnitPrice) / COUNT(DISTINCT pb.orderId) as 'Panier moyen',
  SUM(pb.quantity) as 'Nombre de produits achetés',
  ROUND(AVG(p.UnitPrice), 2) as "Prix moyen d'un produit"
FROM ProductsBuyed pb
LEFT JOIN Products p
  ON pb.productId = p.productId
GROUP BY Month
ORDER BY orderDate ASC;
