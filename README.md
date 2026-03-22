# Analyse de Performance Commerciale - ClassicModels

## Présentation du Projet
![Page 1](img/classicmodels_page_1.png)
Ce projet consiste en une analyse de données complète de la base de données **ClassicModels** (entreprise spécialisée dans la vente de modèles réduits de véhicules). L'objectif est d'extraire des indicateurs clés (KPI) pour aider la direction à comprendre la rentabilité et la performance des ventes par région, par type de véhicule et par modèle.

Le projet combine **SQL** pour l'exécution de requêtes (jointures, CTE, agrégations) et le nettoyage des données (ETL), et **Power BI** pour la création d'un tableau de bord interactif.

---

## Stack Technique

* **Base de données :** MySQL (Base ClassicModels)
* **Langage :** SQL (Jointures, CTE, Agrégations)
* **Visualisation :** Power BI (`.pbix`)
* **Environnement :** MySQL Workbench

---

## Indicateurs Clés (KPI) Analysés

### 1. Performance Financière

* **Chiffre d'Affaires Global :** 8 853 839,23 $
* **Analyse Temporelle :** Suivi de l'évolution annuelle (2003, 2004 et de janvier à juin 2005). Un pic saisonnier est observé sur la période novembre-décembre.
* **Panier Moyen :** 29 460,71 $
* **Taux de livraisons réussies :** 92,94 %

### 2. Analyse de la Rentabilité

L'analyse se concentre sur la comparaison entre les prix catalogue et les prix réels pratiqués :

* **Marge Théorique :** Basée sur le `MSRP` (Prix de vente conseillé).
* **Marge Observée :** Calculée à partir du `priceEach` réel présent dans les bons de commande. Elle est inférieure à la marge théorique, ce qui indique que les produits sont vendus en dessous du prix recommandé.
* **Taux de marge moyen global :** 39,48 %
* **Performance par catégorie :** Les **Motorcycles** (40,70 %) et **Vintage Cars** (40,40 %) affichent les meilleures marges. Les **Trains** (36,06 %) sont en queue de peloton avec un volume de ventes très faible (2 818 unités).

### 3. Ventes par Produit

* **Catégorie la plus vendue :** Classic Cars (35 582 unités), loin devant les Vintage Cars (22 933 unités).
* **Modèle le plus vendu :** 1992 Ferrari 360 Spider Red (1 808 commandes).
* **Catégorie la moins vendue :** Trains (2 818 unités).

### 4. Géographie et Clients

* **Top pays :** États-Unis (3,04 M$), Espagne (0,99 M$) et France (0,97 M$).
* **Top clients :** Identifiés par volume d'achat total et pays d'origine.

---

## Focus : Rentabilité par Type de Véhicule

Le script SQL inclus permet d'analyser la santé financière de chaque catégorie en comparant marge théorique et marge observée. L'analyse montre que certaines catégories maintiennent une marge élevée malgré les remises commerciales, tandis que d'autres sont plus sensibles aux fluctuations de prix.

> **Extrait de la logique SQL :**
> - Calcul de la marge moyenne observée par `productLine` via `avg(MSRP - priceEach)`.
> - Calcul de l'écart entre le prix conseillé (`MSRP`) et le prix de vente final (`priceEach`).

---

## Recommandations

* Capitaliser sur les **Trucks and Buses** dont la marge est élevée (40,15 %) mais le volume encore limité (11 001 unités).
* Reconsidérer la vente de modèles de **trains** étant donné le faible volume de ventes (2 818 unités).
* Adopter une stratégie commerciale pour **augmenter les ventes hors période novembre-décembre** afin de réduire la dépendance saisonnière.
* Revoir la politique de remises pour **rapprocher le prix de vente réel du prix recommandé** (MSRP).
* Renforcer la qualité des livraisons pour **garantir la satisfaction client** et dépasser les 92,94 % actuels.

---

## Structure du Dépôt

| Fichier | Description |
| :--- | :--- |
| `classicmodels script.sql` | Script SQL complet : agrégations et calculs de rentabilité. |
| `Dashboard ClassicModels.pbix` | Rapport Power BI interactif (4 pages de visualisations). |
| `README.md` | Documentation du projet. |

---

## Comment utiliser ce projet ?

1. **Partie SQL :** Importer la base ClassicModels dans MySQL Workbench, puis exécuter `classicmodels script.sql`.
2. **Partie Power BI :** Ouvrir `Dashboard ClassicModels.pbix` dans Power BI Desktop et actualiser la connexion à la base de données.
