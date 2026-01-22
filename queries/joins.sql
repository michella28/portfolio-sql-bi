/*
Requête 1 : Chiffre d'affaires total par client
Objectif : Identifier les clients les plus rentables
*/

SELECT
    c.customer_id,
    c.country,
    ROUND(SUM(s.quantity * s.unit_price), 2) AS chiffre_affaires
FROM sales s
INNER JOIN customers c -- Jointure entre les ventes et les clients
    ON s.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.country
ORDER BY chiffre_affaires DESC; -- Analyse des clients les plus rentables

/*
Requête 2 : Clients sans commandes
Objectif : Identifier les clients qui n’ont passé aucune commande
*/

SELECT 
    c.CustomerID,
    c.Country
FROM customers c
LEFT JOIN sales s
    ON c.CustomerID = s.CustomerID
WHERE s.InvoiceNo IS NULL
ORDER BY c.CustomerID;

/*
Requête 3 : Chiffre d'affaires par produit
Objectif : Identifier les produits les plus rentables
*/

SELECT 
    p.StockCode, 
    p.Description, 
    SUM(s.Quantity * s.UnitPrice) AS chiffre_affaires
FROM produits p
INNER JOIN sales s
    ON p.StockCode = s.StockCode
GROUP BY 
    p.StockCode, 
    p.Description
ORDER BY 
    chiffre_affaires DESC;

/*
Requête 4 : Chiffre d'affaires par pays
Objectif : Identifier les pays les plus rentables
*/

SELECT 
    c.Country,
    SUM(s.Quantity * s.UnitPrice) AS chiffre_affaires
FROM clients c
INNER JOIN sales s
    ON c.CustomerID = s.CustomerID
GROUP BY 
    c.Country
ORDER BY 
    chiffre_affaires DESC;

