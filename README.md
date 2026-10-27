# Uber Operations & Revenue Analytics - End-to-End Data Project

## Project Overview
This project is an end-to-end data analytics pipeline simulating a real-world mobility and ride-hailing business scenario (analogous to operations at companies like Vexere or Uber). Leveraging a dataset of 100,000+ NYC Taxi/Uber trip records, this project transforms raw transactional data into a highly optimized Star Schema, loads it into a cloud Data Warehouse, and visualizes it through an interactive executive dashboard.

**The primary goal** is to bridge the gap between raw data engineering and business strategy, providing actionable intelligence to optimize fleet allocation, evaluate vendor performance, and maximize revenue.

## Key Insights Discovered
Through advanced SQL queries and spatial analysis, several critical operational patterns were identified:
1. **Demand Hotspots & Spatial Distribution:** The geospatial bubble map reveals heavy concentration in specific commercial and transit hubs (e.g., Manhattan, JFK Airport). This allows for predictive driver positioning.
2. **Peak Hour Profitability:** Analysis of pick-up times highlights specific operational hours where trip volume spikes, but more importantly, identifies the hours with the highest percentage of long-distance trips (>10 miles).
3. **Payment Method Influence:** Credit card transactions consistently account for the highest average revenue and tip amounts compared to cash, indicating a need to incentivize cashless payments.
4. **Vendor Unit Economics:** By calculating the "Revenue Per Mile" (using Window Functions), we identified which vendor operates more efficiently and generates a higher financial yield per distance driven.

## Business Impact & Value
This data pipeline and dashboard provide direct value to enterprise operations and strategy teams:
* **Dynamic Surge Pricing:** By identifying peak hours and high-demand zones, operations teams can implement dynamic pricing models to balance supply and demand.
* **Optimized Fleet Allocation:** Geospatial heatmaps enable dispatchers to pre-position drivers in high-probability areas, reducing wait times for customers and idle times for drivers.
* **Data-Driven Vendor Management:** Tracking "Revenue Per Mile" allows the business to negotiate better terms with partners and prioritize high-performing vendors.
* **Self-Service Analytics:** The flattened Analytical Layer (One Big Table) empowers non-technical stakeholders (Marketing, Operations) to slice and dice data seamlessly in Data Studio without needing SQL expertise.

## 🛠️ Tech Stack & Methodology
* **Language & Libraries:** Python (Pandas) for data wrangling and transformation.
* **Data Modeling:** Dimensional Modeling (Star Schema) via Jupyter Notebooks.
* **Cloud Data Warehouse:** Google BigQuery (ELT process, OLAP architecture).
* **Advanced SQL:** CTEs, Window Functions, and Data Mart creation (One Big Table).
* **Business Intelligence:** Data Studio (Interactive dashboarding, Geospatial mapping, KPI scorecards).

## Repository Structure
| File Name | Format | Description |
| :--- | :--- | :--- |
| `uber_transform.ipynb` | Jupyter Notebook | Python code for data cleaning, type casting, and constructing the Star Schema. |
| `uber_analytics.sql` | SQL | Advanced BigQuery queries for the Analytical Layer and unit economics analysis. |
| `uber_data.csv` | CSV | The raw dataset containing 100,000 trip records. |
| `fact_table.csv` | CSV | The centralized Fact Table containing foreign keys and quantitative metrics. |
| `datetime_dim.csv` | CSV | Dimension table breaking down temporal data (hour, day, weekday, etc.). |
| `payment_type_dim.csv` | CSV | Dimension table mapping payment method codes to descriptive names. |
| `rate_code_dim.csv` | CSV | Dimension table mapping rate codes (Standard, Airport, etc.) to descriptive names. |
| `LICENSE` | Text | Open-source license for this repository. |

## Executive Dashboard
**[[Insert your Data Studio Dashboard Link Here]](https://datastudio.google.com/reporting/b2319e4d-a4e6-4003-93c1-f64c844480e0)**

The Data Studio dashboard features:
* **Dynamic Filter Controls:** Interactive slicing by Vendor, Payment Type, Rate Code, and Trip Distance.
* **Geospatial Analysis:** A map visualizing pickup locations for route and hotspot analysis.
* **KPI Scorecards:** High-level metrics tracking Total Revenue, Total Trips, Average Distance, and Average Fare.
