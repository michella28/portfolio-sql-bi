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
