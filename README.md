# SQL Data Warehouse & Analytics Project

## Overview
This project demonstrates an end-to-end data warehousing and analytics solution built on **SQL Server**, following **Medallion Architecture** (Bronze, Silver, Gold layers). The goal is to consolidate sales data from multiple source systems into a structured, analysis-ready data warehouse.



## Data Architecture

The project follows the **Medallion Architecture** pattern:

**Bronze Layer** *(In Progress)*
- Ingests raw CSV data as-is from source systems (ERP and CRM)
- No transformations applied — preserves original data fidelity
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

## Project Scope

- **Data Sources:** Two source systems — ERP and CRM — provided as CSV files
- **Database:** Microsoft SQL Server (SQL Server Express)
- **Approach:** ETL pipelines built entirely in T-SQL
- **Goal:** Enable SQL-based analytics on customer behavior, product performance, and sales trends

---

## Tools Used

- **Database:** Microsoft SQL Server Express
- **IDE:** SQL Server Management Studio (SSMS)
- **Language:** T-SQL (DDL, DML, Stored Procedures)
- **Version Control:** GitHub

---

## Repository Structure

```
sql-data-warehouse-project/
│
├── datasets/          # Raw CSV source files (ERP & CRM)
├── bronze/            # Raw ingestion scripts
├── silver/            # Cleansing and transformation scripts
├── gold/              # Star schema and analytical model scripts
└── README.md
```

---

## Key Learning Outcomes

- Medallion Architecture design and implementation
- ETL pipeline development in SQL Server
- Data modelling — fact and dimension tables, star schema
- Data quality handling and standardization
- SQL-based analytics and reporting

---

## Author
**Sawrave Ahmed**
- GitHub: [github.com/Sawrave007](https://github.com/Sawrave007)
- LinkedIn: [linkedin.com/in/sawrave-ahmed007](https://linkedin.com/in/sawrave-ahmed007)

---

*Inspired by the Data With Bara tutorial series on data warehousing.*


