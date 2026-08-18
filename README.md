# SQL Data Warehouse & Analytics Project

## Overview
This project demonstrates an end-to-end data warehousing and analytics solution built on **SQL Server**, following **Medallion Architecture** (Bronze, Silver, Gold layers). The goal is to consolidate sales data from multiple source systems into a structured, analysis-ready data warehouse and deliver actionable business insights through SQL-based analytics.


---

## Data Architecture

The project follows the **Medallion Architecture** pattern:

**Bronze Layer** 
- Ingests raw CSV data as it is from source systems (ERP and CRM)
- No transformations applied, preserves original data fidelity
- Loaded directly into SQL Server using bulk ingestion scripts

**Silver Layer** 
- Data cleansing, standardization, and normalization
- Resolves data quality issues from the Bronze layer
- Prepares data for analytical modeling

**Gold Layer** 
- Business-ready data modeled into a **Star Schema**
- Fact and dimension tables optimized for analytical queries
- Foundation for reporting and dashboards

---

## BI: Analytics & Reporting

**Objective:** Develop SQL-based analytics to deliver detailed insights into:

- **Customer Behavior** — understanding purchasing patterns and customer segments
- **Product Performance** — identifying top and underperforming products
- **Sales Trends** — tracking revenue patterns over time

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---

## Project Scope

- **Data Sources:** Two source systems — ERP and CRM — provided as CSV files
- **Database:** Microsoft SQL Server (SQL Server Express)
- **Approach:** ETL pipelines built entirely in T-SQL
- **Goal:** Enable SQL-based analytics on customer behavior, product performance, and sales trends

---

## Tools Used

- **Database:** Microsoft SQL Server Express
- **IDE:** SQL Server Management Studio (SSMS)/ VS Code
- **Language:** T-SQL (DDL, DML, Stored Procedures)
- **Version Control:** GitHub

---

## Repository Structure

```
sql-data-warehouse-project/
│
├── datasets/          # Raw CSV source files (ERP & CRM)
│
├── docs/              # Project documentation
│   ├── data_catalog.md          # Dataset field descriptions and metadata
│   └── naming-conventions.md   # Naming guidelines for tables, columns, files
│
├── scripts/           # SQL scripts for ETL and transformations
│   ├── bronze/        # Raw data extraction and loading scripts
│   ├── silver/        # Data cleansing and transformation scripts
│   └── gold/          # Analytical model and star schema scripts
│
├── tests/             # Data quality and test scripts
├── README.md
├── .gitignore
└── requirements.txt
```

---

## Key Learning Outcomes

- Medallion Architecture design and implementation
- ETL pipeline development in SQL Server
- Data modelling — fact and dimension tables, star schema
- Data quality handling and standardization
- SQL-based analytics and reporting for business insights

---

## Author
**Sawrave Ahmed**
- GitHub: [github.com/Sawrave007](https://github.com/Sawrave007)
- LinkedIn: [linkedin.com/in/sawrave-ahmed007](https://linkedin.com/in/sawrave-ahmed007)

---

*Inspired by the Data With Bara tutorial series on data warehousing.*

