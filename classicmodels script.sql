/* Analyse de performance commercial de ClassicModels */

/*Chiffre d'affaires de Classic Models */

select *  from classicmodels.payments;
/*CA total = 8 853 839.23 $*/

select
sum(amount) as CA_global
from classicmodels.payments;

/*CA 2003 = 3 250 217.7 $*/
select
SUM(amount) as CA_2003
FROM classicmodels.payments
WHERE YEAR(paymentDate) = 2003 ;

/*CA 2004 = 4 313 328.25 $*/
select 
sum(amount) as CA_2004
from classicmodels.payments
Where year (paymentDate) = 2004;

/*CA 2005 = 1 290 293.28$ */
SELECT 
SUM(amount) as CA_2005
FROM classicmodels.payments
WHERE YEAR(paymentDate) = 2005;


/*extraction de la table products pour éviter la prise en compte 
des virgules présentes dans productDescription lors de l'exportation csv*/
SELECT 
    productCode, 
    productName, 
    productLine, 
    productScale, 
    productVendor, 
    quantityInStock, 
    buyPrice, 
    MSRP
FROM classicmodels.products;

 /* plus gros clients et leurs caracteristiques*/
 select 
 customers.customerName,
 payments.customerNumber,
 customers.country,
 sum(amount) as montant_total
 from classicmodels.payments 
 join classicmodels.customers 
 on payments.customerNumber = customers.customerNumber
 group by payments.customerNumber, customerName
 ORDER BY SUM(amount) DESC;
 
 /*pays les plus demandeurs*/
  select 
 customers.country,
 sum(amount) as montant_toal
 from classicmodels.payments 
 join classicmodels.customers 
 on payments.customerNumber = customers.customerNumber
 group by customers.country
 ORDER BY SUM(amount) DESC;
 
 /*type de véhicules le plus commandé*/
 SELECT * FROM classicmodels.orderdetails;
 select
 products.productline,
 sum(orderdetails.quantityOrdered) as nombre_de_ventes
 from classicmodels.orderdetails
 join classicmodels.products
 on orderdetails.productCode = products.productCode
 group by products.productline
 order by sum(orderdetails.quantityOrdered) desc;
 
 /*modeles les plus vendus */
 select
 products.productName,
 products.productline,
 sum(orderdetails.quantityOrdered) as nombre_de_ventes
 from classicmodels.orderdetails
 join classicmodels.products
 on orderdetails.productCode = products.productCode
 group by products.productName, products.productLine
 order by sum(orderdetails.quantityOrdered) desc;
 
 /*modeles les + rentables*/
 SELECT 
    productName,
    buyPrice, 
    MSRP, 
    (MSRP - buyPrice) AS marge
FROM classicmodels.products
ORDER BY marge DESC;

/*type de vehicule le + rentable*/
SELECT 
    productLine,
    AVG(buyPrice) AS cout_achat_moyen, 
    AVG(priceEach) AS prix_vente_moyen,
    AVG(priceEach - buyPrice) AS marge_reelle_moyenne, 
    (AVG(priceEach - buyPrice) / AVG(priceEach)) * 100 AS taux_de_marge_pourcent
FROM classicmodels.products
JOIN classicmodels.orderdetails ON products.productCode = orderdetails.productCode 
GROUP BY productLine
ORDER BY marge_reelle_moyenne DESC;

/*panier moyen */
with commandes as (
select
 orderNumber,
 sum(quantityOrdered*priceEach) as montant_par_commande
 from classicmodels.orderdetails
 group by orderNumber)
 select avg(montant_par_commande) as panier_moyen from commandes ;

 
 /*taux de livraison réussies*/
 SELECT 
    COUNT(CASE WHEN status = 'Shipped' THEN orderNumber END) * 100.0 / COUNT(orderNumber) AS taux_livraisons_reussies
FROM classicmodels.orders;

 