# Zepto E-Commerce Sales Analysis

An end-to-end data analytics project focused on understanding e-commerce sales performance, customer purchasing behaviour, product performance, store operations, and promotional effectiveness using Python, MySQL and Power BI.

## Project Overview

This project demonstrates an end-to-end data analytics workflow, starting with raw data inspection and cleaning in Python, followed by database loading, SQL-based business analysis, and interactive reporting in Power BI.

The project uses six related datasets covering sales transactions, customers, products, payments, promotions, and stores to explore business performance from multiple perspectives.

## Business Objective

The objective of this project is to analyse e-commerce sales and operational data to understand business performance, identify purchasing patterns, and support data-driven decision-making.

The analysis focuses on the following business questions:

- **Sales Performance:** How do sales and order volumes change over time, and which locations contribute most to business performance?
- **Product Performance:** Which products and categories perform well, and where are opportunities to improve product sales?
- **Customer Behaviour:** How do customer segments differ, and which customers contribute most to revenue?
- **Store & Delivery Operations:** How do stores perform across locations, and what patterns can be observed in delivery times and order statuses?
- **Payments & Promotions:** Which payment methods are commonly used, and how are promotions and discounts associated with sales performance?

The overall goal is to transform raw datasets into structured, reliable, and actionable business insights.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data inspection, cleaning, validation, transformation, and file processing |
| MySQL | Data validation, business queries, and analytical reporting |
| Power BI | Interactive reporting and visual analysis |

## Dataset Description

The project uses six related datasets:

| Dataset | Key Information |
|---|---|
| Sales | Orders, dates, customers, products, stores, quantities, prices, discounts, amounts, delivery times, and order statuses |
| Customers | Customer details, cities, sign-up dates, and customer segments |
| Products | Product names, categories, brands, and MRP |
| Payments | Payment IDs and payment methods |
| Promotions | Promotion types and discount percentages |
| Stores | Store names, locations, and opening years |

The working datasets contain approximately 650,000 sales records, 25,000 customers, 2,200 products, 5 payment methods, 120 promotions, and 180 stores.

Dataset Source
Dataset link: https://www.kaggle.com/datasets/dhruvsinghalanalyst/zepto-sales-data

## Project Workflow

### 1. Data Inspection & Preparation — Python

The data preparation stage focuses on understanding the structure and reliability of the six datasets before analysis.

Key activities include:

- Loading and inspecting datasets.
- Reviewing dataset dimensions, data types, and summary statistics.
- Checking missing values and duplicate records.
- Examining order-status distribution and potential data-quality issues.
- Validating customer references between related datasets.
- Handling missing promotion identifiers.
- Converting date columns into appropriate date formats.
- Performing final validation and exporting the cleaned datasets.

**Deliverable:** Deliverable: ZeptoPYTHON.ipynb

### 2. Database Integration — MySQL

The cleaned datasets are loaded into MySQL using a Python script, creating a structured foundation for business analysis across sales, customers, products, stores, payments, and promotions.

**Deliverable:** python_to_sql.py

### 3. Business Analysis — SQL

SQL is used to examine business performance across sales, products, customers, stores, payments, and promotions.

The analysis covers:

- Overall sales and order performance.
- Sales distribution across product categories, cities, and stores.
- Monthly sales trends and changes in performance over time.
- Best-performing products and categories.
- Customer purchasing patterns and repeat purchases.
- Average order value and customer segmentation.
- Payment method usage and promotion performance.
- Store operations and delivery-related metrics.

**Deliverable:** Zeptoproject.sql

### 4. Interactive Reporting — Power BI

The Power BI report presents key metrics and analytical findings in an interactive, business-oriented format.

The report is organised into five pages:

1. **Executive Overview** — Key performance indicators, monthly revenue trends, top products, revenue by city and category, and payment distribution.
2. **Product & Category Performance** — Category quantity and revenue, top products, and revenue by brand.
3. **Customer Analysis** — Customer-segment revenue, top customers, customer counts by city, and revenue by city.
4. **Store & Operations** —  City and store performance, order volumes, average order value, delivery times, and order-status distribution.
5. **Payment & Promotions** —  Orders and revenue by payment method, along with revenue and order distribution by promotion type.

**Deliverable:** Power BI report screenshots.

## Key Findings

### Key Performance Indicators

| Metric | Value Displayed |
|---|---:|
| Total Revenue | ₹121.69 crore |
| Total Customers | 25,000 |
| Total Orders | Approximately 6.05 lakh |
| Total Products | 2,200 |
| Average Order Value | Approximately ₹2,013 |
| Average Delivery Time | Approximately 21 minutes |

### Key Observations

- **Sales Performance:** The monthly revenue chart presents revenue trends and month-over-month movement, helping compare stronger and weaker periods across the selected reporting range.
- **Product & Category Performance:** The report compares eight product categories and presents product- and brand-level rankings to highlight relative sales performance.
- **Customer Behaviour:** The report compares Regular, Occasional, and Premium customer segments. Regular customers account for approximately 59.9% of the segment revenue shown in the customer analysis chart.
- **City & Store Performance:** City-level and store-level views support comparisons of revenue, order volumes, average order value, and delivery times.
- **Payment Preferences:** UPI represents approximately 65.08% of orders in the displayed payment-method distribution, making it the largest payment category in that chart.
- **Order Status:** The displayed order-status distribution shows approximately 93% Delivered, 5.02% Cancelled, and 1.98% Returned.
- **Promotion Performance:** The report compares Flat, Free Delivery, Percentage, and BOGO promotions by revenue and order volume, supporting further evaluation of promotional activity.

## Repository Structure

```text
zepto-ecommerce-sales-analysis/
├── README.md
├── .gitignore
├── ZeptoPYTHON.ipynb
├── python_to_sql.py
├── Zeptoproject.sql
└── power-bi/
    └── screenshots/
```

## How to Review the Project
1. Read this README to understand the business objective and report outcomes.
2. Open ZeptoPYTHON.ipynb to review data preparation and validation.
3. Review python_to_sql.py to understand how cleaned files are loaded into MySQL.
4. Explore Zeptoproject.sql to review the business analysis.
5. View the report screenshots or open the linked .pbix file in Power BI Desktop.

## Data & Metric Considerations

Revenue, order counts, and other KPIs depend on the metric definitions and filters used. For meaningful comparisons between SQL and Power BI, the same order-status filters, revenue fields, and calculation rules should be applied consistently.

Missing promotion identifiers are handled separately from actual promotion records to distinguish orders without an assigned promotion from orders associated with a promotion.

The dataset covers a defined reporting period and may not represent the complete or current operations of Zepto. This portfolio analysis should not be interpreted as an official company report.

## Disclaimer

This is a portfolio analytics project using a Zepto-related e-commerce dataset. It is intended for educational and demonstration purposes and should not be interpreted as an official business report or as verified findings published by Zepto.
