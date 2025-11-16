# Superstore Sales Project — Data Dictionary

This data dictionary documents the fields in `data/raw/Superstore.csv` (the Superstore dataset). It contains the column name, inferred data type, an illustrative sample value (from the first data rows), a short description, and notes on cleaning or Power BI mapping.

> Source file: `data/raw/Superstore.csv`

## How to use this document
- Use this as the project reference for field meanings, types, and suggested transformations.
- Keep descriptions updated when you change raw data or transformation logic.
- Use the reproducible generation snippet below to regenerate the dictionary programmatically.

---

## Column reference

| Column name | Inferred type | Sample value | Description | Notes / Power BI mapping |
|-------------|---------------|--------------|-------------|--------------------------|
| Row ID | int | 1 | Integer row identifier (dataset-specific, not an Order ID). | Keep as integer; not typically used for joins.
| Order ID | string | CA-2016-152156 | Unique order identifier for each order (can repeat if one order has multiple line items). | Keep as text; use as order key.
| Order Date | date (MM/DD/YYYY) | 11/8/2016 | Date the order was placed. | Parse as Date in Power BI; set appropriate locale (MDY). Create Year, Month columns.
| Ship Date | date (MM/DD/YYYY) | 11/11/2016 | Date the order was shipped. | Parse as Date; compute shipping lag (Ship Date - Order Date).
| Ship Mode | string | Second Class | Shipping method (Second Class, Standard Class, First Class, etc.). | Categorical; consider standardizing casing/spaces.
| Customer ID | string | CG-12520 | Unique customer identifier. | Use as join key to customer dimension.
| Customer Name | string | Claire Gute | Customer full name. | For display only. Consider splitting into first/last if needed.
| Segment | string | Consumer | Customer segment (Consumer, Corporate, Home Office). | Categorical for slicing.
| Country | string | United States | Country name. | Most rows may be United States; check consistency.
| City | string | Henderson | City name. | Clean inconsistent spellings; use for map visuals.
| State | string | Kentucky | State name. | Use standardized state names or abbreviations if needed.
| Postal Code | int/string | 42420 | Postal / ZIP code. | May contain leading zeros—treat as text in Power BI to preserve formatting.
| Region | string | South | Region (geographic). | Categorical; useful for higher-level aggregation.
| Product ID | string | FUR-BO-10001798 | Unique product identifier (SKU). | Use for product-level joins.
| Category | string | Furniture | High-level product category (Furniture, Office Supplies, Technology). | Categorical.
| Sub-Category | string | Bookcases | Product sub-category. | Useful for detailed drilldowns.
| Product Name | string | Bush Somerset Collection Bookcase | Full product description/name. | Long text; use for tooltips/search.
| Sales | float | 261.96 | Sales value for the line item (in USD). | Numeric currency; set Data Type = Decimal in Power BI; sum/agg.
| Quantity | int | 2 | Quantity ordered (integer). | Numeric; used for aggregates.
| Discount | float | 0 | Discount applied (fractional, e.g., 0.2 = 20%). | Numeric; ensure values are decimals in [0,1].
| Profit | float | 41.9136 | Profit for the line item (in USD). | Numeric currency; can be negative. Create profitability ratios.

---

## Recommended data types and transformations (quick checklist)
- Parse `Order Date` and `Ship Date` as date fields and create date dimension / keys.
- Convert `Postal Code` to text to preserve leading zeros.
- Ensure numeric currency columns (`Sales`, `Profit`, `Discount`) are floats/decimals.
- Standardize categorical fields (`Ship Mode`, `Segment`, `Category`, `Sub-Category`, `Region`) (trim, title-case).
- De-duplicate (if necessary) by checking `Row ID` or `Order ID` + line number logic.

---

## Power BI usage notes
- When importing a CSV, set `Order Date` and `Ship Date` as Date data type and set locale/format (MM/DD/YYYY). Create a Date table for time intelligence.
- Set `Postal Code` as text in Power BI to preserve leading zeros.
- Mark the `Region`, `Category`, and `Sub-Category` fields as categorical.
- Create measures in Power BI for:
  - Total Sales = SUM(Sales)
  - Total Profit = SUM(Profit)
  - Average Discount = AVERAGE(Discount)
  - Profit Margin = DIVIDE([Total Profit],[Total Sales])
- Consider pre-aggregating large datasets to improve performance and using incremental refresh if you publish to Power BI Service.

---

## Maintenance guidance
- Keep `documentation/data_dictionary.md` in version control and update it when new fields are added or removed.
- Prefer programmatic generation (snippet above) and then fill brief human-friendly `description` fields.
- If you publish datasets to Power BI Service, link your documentation (or host a single page) so report authors can reference it.

