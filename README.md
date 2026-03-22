# Analyse de Performance Commerciale - ClassicModels

## Présentation du Projet
Ce projet consiste en une analyse de données complète de la base de données **ClassicModels** (entreprise spécialisée dans la vente de modèles réduits de véhicules). L'objectif est d'extraire des indicateurs clés (KPI) pour aider la direction à comprendre la rentabilité et la performance des ventes par région, par type de véhicule et par modèle.

Le projet combine **SQL** pour l'exécution de requêtes (jointures, CTE, agrégations) et le nettoyage des données (ETL), et **Power BI** pour la création d'un tableau de bord interactif.

---

## 🛠️ Stack Technique
* **Base de données :** MySQL (Base ClassicModels)
* **Langage :** SQL (Jointures, CTE, Agrégations)
* **Visualisation :** Power BI (`.pbix`)
* **Environnement :** MySQL Workbench

---

## 📈 Indicateurs Clés (KPI) Analysés

### 1. Performance Financière
* **Chiffre d'Affaires Global :** 8 853 839,23 $
* **Analyse Temporelle :** Suivi de l'évolution annuelle (2003, 2004 et de janvier à juin 2005).
* **Panier Moyen :** 29 460,71 $

### 2. Analyse de la Rentabilité (Le cœur du projet)
L'analyse se concentre sur la comparaison entre les prix catalogue et les prix réels pratiqués :
* **Marge Théorique :** Basée sur le `MSRP` (Prix de vente conseillé).
* **Marge Observée :** Calculée à partir du `priceEach` réel présent dans les bons de commande.
* **Performance par catégorie :** Identification des types de véhicules les plus rentables --> Classic Cars et Trucks and Buses.

### 3. Logistique et Clients
* **Top Clients :** Identification des clients les plus importants par volume d'achat et pays.
* **Gestion des Stocks :** Analyse des niveaux de stock par rapport à la demande pour éviter les ruptures.

---

## 🔍 Focus : Rentabilité par Type de Véhicule
Le script SQL inclus permet d'analyser la santé financière de chaque catégorie. Par exemple, l'analyse montre que certaines catégories maintiennent une marge élevée malgré les remises commerciales, tandis que d'autres sont plus sensibles aux fluctuations de prix.

> **Extrait de la logique SQL :**
> - Calcul de la marge moyenne observée par `productLine`.
> - Calcul de l'écart entre le prix conseillé et le prix de vente final.

---

## 📁 Structure du Dépôt
| Fichier | Description |
| :--- | :--- |
| `classicmodels script.sql` | Script SQL complet : création des tables, agrégations et calculs de rentabilité. |
| `projet sql Darius Bengo .pbix` | Rapport Power BI interactif (Visualisation des données). |
| `README.md` | Documentation du projet. |

---

## 🚀 Comment utiliser ce projet ?

1.  **Partie SQL :** *
