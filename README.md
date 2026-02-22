# Superstore Sales Project 📊

A comprehensive data analysis project built around the Superstore
sales dataset. It features a clean data pipeline, exploratory notebooks,
interactive dashboards, and exportable visual reports.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Project Structure](#project-structure)
- [Tools & Technologies](#tools--technologies)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Key Features](#key-features)
- [Data Pipeline](#data-pipeline)
- [Reports & Visualizations](#reports--visualizations)
- [Power BI Integration](#power-bi-integration)
- [Development Workflow](#development-workflow)
- [Requirements Summary](#requirements-summary)
- [Troubleshooting](#troubleshooting)
- [License](#license)
- [Contact & Support](#contact--support)

---

## Project Overview

This project extracts actionable insights from Superstore sales data
through a combination of data engineering, statistical analysis, and
interactive visualization. The goal is to provide a reusable framework
for exploratory analysis and business‑facing dashboards.

**Objectives:**

- Track sales and profit trends over time
- Evaluate product/category performance
- Offer geographic and customer segmentation views
- Enable rapid prototyping via notebooks and scripts
- Deliver polished visual artifacts for stakeholders

---

## Project Structure

\`\`\`
Superstore Sales Project/
│
├── data/                              # Data directory
│   ├── raw/                          # Original CSV input
│   │   └── Superstore.csv           # Raw dataset
│   └── processed/                    # Cleaned and transformed output
│       ├── data_for_profiling.csv
│       ├── superstore_cleaned.csv
│       └── for_visualization/        # Files intended for dashboards
│           ├── dim_customers.csv
│           ├── dim_geography.csv
│           ├── dim_products.csv
│           └── superstore_data.csv
│
├── documentation/                   # Project documentation
│   ├── data_dictionary.md
│   └── Key Metrics.md
│
├── python/                           # Python codebase
│   ├── dashboard/                    # Streamlit app and helpers
│   │   ├── dashboard.py              # Streamlit visualization script
│   │   └── file_location.py          # utility for data paths
│   ├── notebooks/                    # Exploratory analysis notebooks
│   │   ├── data_cleaning.ipynb
│   │   ├── data_profiling.ipynb
│   │   ├── predictive_models.ipynb
│   │   └── statistical_analysis.ipynb
│   └── scripts/                      # Reusable processing scripts
│       ├── data_to_csv.py
│       ├── load_to_postgres.py
│       └── read_env.py
│
├── reports/                         # Generated HTML reports
│   └── SuperstoreSalesFinalReport.html
│
├── sql/                             # SQL files used for analysis
│   ├── analysis_queries.sql
│   ├── create_table.sql
│   ├── dim_customers.sql
│   ├── dim_geography.sql
│   ├── dim_products.sql
│   ├── null_values.sql
│   ├── query_views.sql
│   ├── query.sql
│   └── row_counts.sql
│
├── visualizations/                  # Exported chart output
│   ├── Customer Segmentation/
│   ├── Profit Optimization/
│   └── Time Series Visualization/
│       ├── Profit Forecast/
│       ├── Quantity Forecast/
│       └── Sales Forecast/
│
├── Makefile                        # Automation commands
├── pyproject.toml                  # Python project configuration
├── requirements.txt                # dependency list
└── README.md                       # This file
\`\`\`

### Directory Details

| Directory           | Purpose                                                    |
| ------------------- | ---------------------------------------------------------- |
| `data/raw/`         | Original Superstore CSV                                    |
| `data/processed/`   | Cleaned and derived datasets used by notebooks/dashboard   |
| `python/dashboard/` | Streamlit application and related helpers                  |
| `python/notebooks/` | Jupyter notebooks for analysis and modelling              |
| `python/scripts/`   | Standalone Python utilities for ETL and environment setup  |
| `reports/`          | Final reports suitable for stakeholders                     |
| `visualizations/`   | Separate export area for static chart assets               |
| `sql/`              | SQL queries supporting data investigation                   |
| `documentation/`    | Additional documentation (data dictionary, metrics, etc.)  |

---

## Tools & Technologies

### Core Technologies

| Tool                     | Version | Purpose                                        |
| ------------------------ | ------- | ---------------------------------------------- |
| **Python**               | 3.11+   | Primary programming language                   |
| **Pandas**               | 2.3.3+  | Data manipulation                              |
| **Plotly**               | 6.4.0+  | Interactive visualizations                    |
| **Streamlit**            | 1.5.0+  | Dashboard framework for Python                |
| **Jupyter Notebook**     | Latest  | Exploratory analysis environment              |
| **ydata-profiling**      | 4.17.0+ | Automated EDA reporting                       |

### Data Analysis Stack

- **Data Processing:** Pandas, NumPy
- **Visualization:** Plotly, Matplotlib, Seaborn
- **Reporting:** HTML reports, Notebooks
- **Statistical Analysis:** SciPy, Statsmodels

### Development Tools

- **Makefile:** Common commands
- **UV/pip:** Dependency management
- **Git:** Version control

---

## Installation & Setup

### Prerequisites

- Python 3.11 or higher
- Virtual environment tool (venv, conda, etc.)

### Setup Steps

\`\`\`bash
# clone repository
# create and activate venv
python -m venv .venv
# Windows cmd
.venv\Scripts\activate.bat
# install deps
pip install -r requirements.txt
\`\`\`

(you can also use `uv pip install -r requirements.txt` if using UV)

---

## Usage

### Run Data Processing Scripts

\`\`\`bash
make run-main           # or use python/scripts/*.py directly
\`\`\`

### Launch Streamlit Dashboard

\`\`\`bash
make run-dashboard      # or
streamlit run python/dashboard/dashboard.py
\`\`\`

Browse to `http://localhost:8501` to interact with the dashboard.

### Jupyter Notebooks

\`\`\`bash
jupyter notebook python/notebooks
\`\`\`

Open any of the four notebooks for exploration or modelling.

---

## Key Features

1. **Automated Data Pipeline** – ingestion, cleaning, profiling, exports.
2. **Streamlit Dashboard** – interactive filters, time‑series, maps, distributions.
3. **Exploratory Data Analysis** – profiling and statistical notebooks.
4. **Reusable Scripts** – CSV export, environment loading, database upload.
5. **Visual Assets & Reports** – pre‑rendered charts and HTML reports.

---

## Data Pipeline

\`\`\`
Raw CSV → processing scripts → processed datasets →
    ├─ notebooks (analysis/modeling)
    ├─ dashboard (visualization)
    └─ reports (HTML)
\`\`\`

1. Raw data lives in `data/raw/`.
2. Scripts in `python/scripts/` cleanse and transform data.
3. Outputs saved to `data/processed/` for downstream use.
4. Notebooks and dashboard consume processed files.
5. Final artifacts stored in `reports/` and `visualizations/`.

---

## Reports & Visualizations

- **HTML Report:** `reports/SuperstoreSalesFinalReport.html`
- **Interactive Dashboard:** Streamlit app (see above)
- **Static Charts:** saved under `visualizations/` grouped by theme.

---

## Power BI Integration

Use processed CSVs as a data source, or load via Python script
(`python/scripts/data_to_csv.py`) or a direct database connection.

---

## Development Workflow

- Add or modify notebooks in `python/notebooks/`.
- Update production logic in `python/dashboard/` or `python/scripts/`.
- Regenerate processed data and run dashboard to verify.

---

## Requirements Summary

\`\`\`
Python >= 3.11
pandas >= 2.3.3
plotly >= 6.4.0
streamlit
ydata-profiling[notebook,unicode]
\`\`\`

---

## Troubleshooting

- Activate the virtual env before running anything.
- Ensure `data/raw/Superstore.csv` is present.
- Reinstall dependencies if imports fail.

---

## License

Superstore Sales Project – internal analysis initiative.

---

## Contact & Support

Refer to documentation files, notebooks, or inline comments for help.

---

**Last Updated:** February 2026
**Project Version:** 0.1.0
**Status:** Active Development
