-- 1. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień
SELECT EmployeeID,
       COUNT(*)
FROM Orders
GROUP BY EmployeeID

-- 2. Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień
SELECT ShipVia,
       OrderID,
       SUM(Freight) AS 'freight_price'
FROM Orders
GROUP BY ShipVia, OrderID
WITH ROLLUP

-- 3. Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień
-- w latach od 1996 do 1997
SELECT ShipVia,
       OrderID,
       SUM(Freight) AS 'freight_price'
FROM Orders
WHERE YEAR(ShippedDate) BETWEEN 1996 AND 1997
GROUP BY ShipVia, OrderID
WITH ROLLUP