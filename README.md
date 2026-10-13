# Zepto E-Commerce Sales Analysis

An end-to-end data analytics project using **Python, MySQL, Excel, and Power BI** to analyse e-commerce sales, customer behaviour, product performance, store operations, payment methods, and promotions.

## Project Overview

This project follows a complete data analytics workflow, from data inspection and cleaning to SQL analysis and interactive Power BI reporting.

The project uses six related datasets to explore sales performance and identify business patterns across products, customers, stores, payments, and promotions.

## Tools & Technologies

- **Python:** Pandas, Jupyter Notebook
- **Database:** MySQL
- **SQL:** Joins, aggregations, CTEs, window functions, and ranking
- **Excel:** Data review and cleaned-data exports
- **Power BI:** Interactive dashboards, KPI cards, DAX measures, and slicers

## Dataset Description

The project uses six datasets:

| Dataset | Description |
|---|---|
| Sales | Order dates, customer IDs, product IDs, quantities, prices, discounts, revenue, delivery time, and order status |
| Customers | Customer details, city, sign-up date, and customer segment |
| Products | Product names, categories, brands, and MRP |
| Payments | Payment IDs and payment methods |
| Promotions | Promotion IDs, promotion types, and discount percentages |
| Stores | Store details, city, and opening year |

The working dataset contains approximately 650,000 sales records, 25,000 customers, 2,200 products, 5 payment methods, 120 promotions, and 180 stores.

## Project Workflow

### 1. Python — Data Inspection and Cleaning

The `ZeptoPYTHON.ipynb` notebook covers:

- Loading all six CSV datasets.
- Inspecting dataset dimensions, sample records, data types, and summary statistics.
- Checking missing values and duplicate records.
- Analysing order-status distribution.
- Checking selected sales fields for negative values.
- Validating customer IDs between sales and customer datasets.
- Replacing missing promotion IDs with `No Promotion`.
- Converting sign-up and order date columns to datetime.
- Validating the cleaned data.
- Exporting cleaned datasets to CSV files and an Excel workbook.

### 2. Excel — Cleaned Data Review

The cleaned datasets are exported as individual CSV files and as one Excel workbook containing separate worksheets for customers, sales, products, payments, promotions, and stores.

### 3. MySQL — Data Loading and SQL Analysis

The `python_to_sql.py` script loads the cleaned CSV files into MySQL.

SQL analysis includes:

- Data quality checks and row counts.
- Revenue, order, customer, and product KPIs.
- Sales analysis by category, city, and store.
- Monthly sales trends.
- Top-performing products.
- Repeat customer analysis.
- Average order value.
- Payment method and promotion performance.
- Customer segmentation.
- CTEs and window functions.
- Month-over-month revenue growth.
- Product rankings and category contribution analysis.

### 4. Power BI — Interactive Report

The Power BI report contains five pages:

1. **Executive Overview** — Overall business performance and key KPIs.
2. **Product & Category Performance** — Product and category sales analysis.
3. **Customer Analysis** — Customer behaviour and purchasing patterns.
4. **Store & Operations** — Store performance and delivery-related metrics.
5. **Payment & Promotions** — Payment methods, discounts, and promotion analysis.

## Repository Structure

```text
zepto-ecommerce-sales-analysis/
├── README.md
├── .gitignore
├── python/
│   ├── ZeptoPYTHON.ipynb
│   └── python_to_sql.py
├── sql/
│   └── Zeptoproject.sql
├── power-bi/
│   ├── Zepto_Sales_Analysis.pbix
│   └── screenshots/
├── excel/
│   └── Zepto_Cleaned_Data.xlsx
└── docs/
    └── data_dictionary.md
```

Adjust the folder and file names to match your actual repository.

## How to Run the Project

### Prerequisites

- Python installed
- MySQL Server installed
- MySQL database named `zepto_analytics`
- Power BI Desktop

Install the required Python packages:

```bash
pip install pandas openpyxl sqlalchemy mysql-connector-python
```

### Execution Steps

1. Place the six source CSV files in the folder expected by the Python notebook.
2. Open `ZeptoPYTHON.ipynb` and run the cells from beginning to end.
3. Verify that the cleaned CSV files and Excel workbook have been generated.
4. Configure the MySQL connection in `python_to_sql.py` using your local database credentials.
5. Ensure the loading script reads from the cleaned-data folder.
6. Run the Python loading script:

   ```bash
   python python_to_sql.py
   ```

7. Open `Zeptoproject.sql` in your MySQL client and execute the required queries.
8. Open the Power BI report and configure the data source paths or database connection for your computer.

## Important Metric Definitions

Revenue can refer to net revenue (`NetAmount`) or gross sales (`GrossAmount`). Order counts and revenue may also vary depending on whether all order statuses or only delivered orders are included.

Use consistent definitions and filters when comparing SQL results with Power BI measures.

## Key Learning Outcomes

- Data profiling and cleaning using Pandas.
- Handling missing values and converting date columns.
- Exporting cleaned datasets for further analysis.
- Loading data into MySQL using Python.
- Writing SQL queries for business analysis.
- Applying CTEs and window functions.
- Building interactive Power BI reports.
- Connecting Python, SQL, Excel, and Power BI in one analytics workflow.

## Future Improvements

- Standardise KPI definitions across SQL and Power BI.
- Document business rules and metric calculations.
- Add screenshots of the Power BI report pages.
- Document validated findings and business recommendations.
- Store database credentials securely using environment variables.

## Disclaimer

This project is intended for learning and portfolio demonstration. Business findings and recommendations should be based on validated data and clearly documented metric definitions.