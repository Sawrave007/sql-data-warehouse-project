# Data Warehouse & Sales Analytics
Building a modern warehouse with SQL Server, including ETL process, data modeling and analytics

# Overview
 
This project demonstrates the design and implementation of a modern data warehouse using SQL Server. The objective is to transform raw ERP and CRM datasets into a structured analytical database that supports business reporting and decision-making.

The project covers the complete data engineering workflow, including data ingestion, data cleansing, dimensional modeling, and SQL-based business analytics.

# Project Objectives
Build a centralized SQL Server data warehouse from multiple business data sources.
Clean and standardize raw ERP and CRM datasets.
Design an analytical data model using a Star Schema.
Develop SQL queries that provide meaningful business insights.
Practice real-world ETL and data warehousing concepts.
# Technology Stack
SQL Server Express
SQL Server Management Studio (SSMS)
T-SQL
Git & GitHub
Draw.io (Data Modeling)
CSV Data Sources
Data Warehouse Architecture

# The warehouse follows a Medallion-inspired architecture consisting of three logical layers.

# Bronze Layer
Raw ERP and CRM datasets
Imported directly from CSV files
Minimal transformations
# Silver Layer
Data cleansing
Standardized formats
Removed duplicates
Corrected inconsistent values
Prepared data for integration
# Gold Layer

Business-ready dimensional model containing:

Fact tables
Dimension tables
Optimized for analytical queries
Supports reporting and dashboard creation


