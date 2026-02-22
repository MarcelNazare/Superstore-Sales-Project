# Superstore Sales Project 📊

A comprehensive data analysis project for analyzing Superstore sales data with interactive visualizations, reports, and dashboards.

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
- [Contributing](#contributing)

---

## Project Overview

The Superstore Sales Project is a data-driven analysis solution designed to extract insights from retail sales data. This project encompasses data processing, exploratory analysis, interactive dashboards, and comprehensive reporting capabilities using modern data science tools and technologies.

**Key Objectives:**

- Analyze sales trends and patterns
- Identify key performance indicators (KPIs)
- Generate actionable business insights
- Create interactive visualizations for stakeholder communication
- Build reusable data pipelines

---

## Project Structure

```
Superstore Sales Project/
│
├── data/                              # Data directory
│   ├── raw/                          # Raw, unprocessed data
│   │   └── Superstore.csv           # Original sales dataset
│   └── processed/                    # Cleaned and processed data
│
├── python/                           # Python codebase
│   ├── notebooks/
│   │   └── main.ipynb               # Jupyter notebook for exploration & analysis
│   └── scripts/
│       ├── main.py                  # Main data processing script
│       ├── dashboard.py             # Interactive Shiny dashboard application
│       └── __pycache__/             # Python cache files
│
├── sql/                             # SQL scripts directory
│       └── (Database queries for data analysis)
│
├── visualizations/                  # Generated visualization outputs
│       └── (Charts, graphs, and plots)
│
├── reports/                         # Generated reports
│   └── SuperstoreSalesReport.html   # HTML-formatted sales report
│
├── documentation/                   # Project documentation
│       └── (Additional guides and specifications)
│
├── Makefile                        # Build automation and commands
├── pyproject.toml                  # Python project configuration
└── README.md                       # This file

```

### Directory Details

| Directory           | Purpose                                                    |
| ------------------- | ---------------------------------------------------------- |
| `data/raw/`         | Contains the original, unmodified Superstore.csv dataset   |
| `data/processed/`   | Stores cleaned and transformed data ready for analysis     |
| `python/notebooks/` | Jupyter notebooks for interactive exploration and analysis |
| `python/scripts/`   | Reusable Python scripts for data processing and dashboards |
| `sql/`              | SQL queries for data extraction and manipulation           |
| `visualizations/`   | Generated charts and visual outputs                        |
| `reports/`          | Compiled HTML reports and analytics summaries              |
| `documentation/`    | Project guides, data dictionaries, and specifications      |

---

## Tools & Technologies

### Core Technologies

| Tool                 | Version | Purpose                                        |
| -------------------- | ------- | ---------------------------------------------- |
| **Python**           | 3.11+   | Primary programming language for data analysis |
| **Pandas**           | 2.3.3+  | Data manipulation and transformation           |
| **Plotly**           | 6.4.0+  | Interactive data visualization library         |
| **Shiny for Python** | 1.5.0+  | Interactive web dashboard framework            |
| **Jupyter Notebook** | Latest  | Interactive coding and analysis environment    |
| **ydata-profiling**  | 4.17.0+ | Automated exploratory data analysis            |

### Data Analysis Stack

- **Data Processing:** Pandas, NumPy
- **Visualization:** Plotly, Matplotlib (optional)
- **Reporting:** HTML reports, Jupyter notebooks
- **Statistical Analysis:** SciPy, Statsmodels

### Visualization & Reporting Tools

| Tool             | Usage                                                                                                                                                      |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Plotly**       | Interactive web-based charts and graphs                                                                                                                    |
| **Streamlit**    | Python data visualization and dashboards (see example: [live app](https://marcelnazare-superstore-sales-p-pythondashboarddashboard-devke8.streamlit.app/)) |
| **Power BI**     | Advanced business intelligence and analytics                                                                                                               |
| **HTML Reports** | Formatted static reports                                                                                                                                   |

### Development Tools

- **Makefile:** Automation of common development tasks
- **UV:** Python dependency management
- **Git:** Version control

---

## Installation & Setup

### Prerequisites

- Python 3.11 or higher
- pip or UV package manager
- Virtual environment tool (venv or similar)

### Step 1: Clone/Setup the Project

- To your desired project folder

### Step 2: Create Virtual Environment

```bash
python -m venv .venv
```

### Step 3: Activate Virtual Environment

**On Windows (Command Prompt):**

```bash
.venv\Scripts\activate.bat
```

**On Windows (PowerShell):**

```powershell
.venv\Scripts\Activate.ps1
```

**On macOS/Linux:**

```bash
source .venv/bin/activate
```

### Step 4: Install Dependencies

Using UV (recommended):

```bash
uv pip install -r requirements.txt
```

Or using pip:

```bash
pip install -e .
```

This will install all dependencies specified in `pyproject.toml`:

- pandas >= 2.3.3
- plotly >= 6.4.0
- shiny >= 1.5.0
- ydata-profiling >= 4.17.0

---

## Usage

### Running Main Analysis Script

Execute the main data processing script:

```bash
make run-main
```

Or directly:

```bash
uv run python/scripts/main.py
```

### Launching Interactive Dashboard

There are two dashboard implementations:

- **Streamlit** – used for python data visualizations. A deployed example is available at [https://marcelnazare-superstore-sales-p-pythondashboarddashboard-devke8.streamlit.app/](https://marcelnazare-superstore-sales-p-pythondashboarddashboard-devke8.streamlit.app/).

```bash
make run-dashboard
```

Or directly:

```bash
streamlit run python/scripts/dashboard.py
```

The dashboard will be available at `http://localhost:8501` (or similar).

### Accessing Jupyter Notebook

Start Jupyter Notebook for interactive analysis:

```bash
jupyter notebook python/notebooks/main.ipynb
```

### Available Makefile Commands

```bash
make run-main          # Run main analysis script
make run-dashboard     # Launch interactive dashboard
make activate          # Activate Python virtual environment
```

---

## Key Features

### 1. **Data Processing Pipeline**

- Automated data loading from CSV sources
- Data cleaning and validation
- Feature engineering and transformation
- Output to processed data directory

### 2. **Interactive Dashboard (Streamlit)**

- Real-time data visualization
- User-interactive filters and controls
- Dynamic filtering by multiple dimensions
- Export capabilities

### 3. **Exploratory Data Analysis (EDA)**

- Automated profiling with ydata-profiling
- Distribution analysis
- Correlation matrices
- Outlier detection

### 4. **Comprehensive Reporting**

- HTML-formatted reports
- Data summaries and statistics
- Visual charts and graphs
- Stakeholder-ready outputs

### 5. **Visualization Suite**

- Interactive Plotly charts
- Sales trend visualizations
- Regional performance analysis
- Product performance dashboards

---

## Data Pipeline

```
Raw Data (CSV)
    ↓
Data Loading & Validation (main.py)
    ↓
Data Cleaning & Transformation
    ↓
Feature Engineering
    ↓
Processed Data (CSV/Parquet)
    ↓
Analysis & Reporting
    ├── Jupyter Notebooks (Exploration)
    ├── Shiny Dashboard (Interactive)
    ├── HTML Reports (Static)
    └── Power BI (Enterprise BI)
```

### Data Flow

1. **Input:** Raw Superstore.csv file in `data/raw/`
2. **Processing:** Python scripts perform ETL operations
3. **Storage:** Processed data saved to `data/processed/`
4. **Analysis:** Notebooks and scripts conduct analysis
5. **Output:** Reports, dashboards, and visualizations generated
6. **Sharing:** Export to Power BI for enterprise analytics

---

## Reports & Visualizations

### HTML Reports

- **Location:** `reports/SuperstoreSalesReport.html`
- **Contents:** Summary statistics, key metrics, visualizations
- **Usage:** Open in web browser for stakeholder review

### Interactive Dashboards

- **Streamlit Dashboard:** Real-time, interactive web application
- **Update Frequency:** Real-time (connected to processed data)
- **Access:** `http://localhost:8501` (when running)

### Visualization Outputs

- **Location:** `visualizations/`
- **Formats:** PNG, SVG, HTML (interactive)
- **Types:**
  - Sales trends over time
  - Regional performance heatmaps
  - Product category analysis
  - Customer segmentation

---

## Power BI Integration

### Setting Up Power BI Connection

Power BI can connect to this project's data through multiple methods:

#### Method 1: CSV File Connection

1. Open Power BI Desktop
2. Click **Get Data** → **Text/CSV**
3. Navigate to `data/processed/` folder
4. Select the processed data file
5. Click **Load**

#### Method 2: Direct Database Connection

1. Configure SQL scripts in `sql/` directory
2. Set up database connection string
3. Use Power BI's SQL Server connector
4. Load data directly from queries

#### Method 3: Python Script Integration

1. In Power BI Desktop, go to **Get Data** → **Python Script**
2. Reference Python scripts from `python/scripts/`
3. Execute data loading logic
4. Import results into Power BI

### Power BI Features to Implement

- **KPI Cards:** Sales, Profit, Order Count
- **Time Series Charts:** Sales trends across months/quarters
- **Regional Analysis:** Map visualizations of sales by region
- **Category Performance:** Stacked bar charts by product category
- **Customer Insights:** Segmentation and lifetime value analysis
- **Drill-down Reports:** Interactive exploration capabilities
- **Mobile Dashboards:** Optimized for mobile devices
- **Real-time Refresh:** Schedule automatic data refresh

### Creating Power BI Reports

1. **Connect to Data:**
   - Use processed data from `data/processed/`
   - Alternatively, connect directly to source CSV

2. **Create Dimensions & Measures:**
   - Define date dimensions for time-based analysis
   - Create calculated measures for KPIs
   - Build hierarchies (Region → Country → City)

3. **Design Dashboards:**
   - Sales Overview
   - Regional Performance
   - Product Analytics
   - Customer Analysis

4. **Set Refresh Schedule:**
   - Configure automatic daily/hourly refresh
   - Monitor data freshness
   - Set up alerts for anomalies

### Power BI Best Practices

- Use Star Schema for data modeling
- Implement row-level security (RLS) for multi-tenant access
- Optimize performance with aggregations
- Use bookmarks for navigation
- Enable Q&A for natural language queries
- Create mobile-optimized report layouts

---

## Development Workflow

### Adding New Analysis

1. **Create notebook:** Add new `.ipynb` in `python/notebooks/`
2. **Develop scripts:** Create reusable functions in `python/scripts/`
3. **Process data:** Ensure processed data available in `data/processed/`
4. **Generate outputs:** Save visualizations and reports
5. **Update dashboard:** Add new metrics to Shiny app

### Code Structure

- **Scripts:** Modular, reusable functions
- **Notebooks:** Exploratory analysis and prototyping
- **Dashboard:** Production-ready interactive application
- **Reports:** Automated report generation

---

## Requirements Summary

### Core Dependencies

```
Python >= 3.11
pandas >= 2.3.3
plotly >= 6.4.0
steamlit 
ydata-profiling[notebook,unicode] >= 4.17.0
```

For detailed dependency information, see `pyproject.toml`

---

## Output Artifacts

- **Processed Data:** CSV/Parquet files in `data/processed/`
- **HTML Reports:** `reports/SuperstoreSalesReport.html`
- **Visualizations:** Charts and graphs in `visualizations/`
- **Notebooks:** Analysis outputs in `python/notebooks/main.ipynb`
- **Power BI Files:** `.pbix` files (stored separately or in shared folder)

---

## Troubleshooting

### Issue: Dashboard won't start

**Solution:** Ensure virtual environment is activated and all dependencies are installed

```bash
.venv\Scripts\activate.bat
pip install -e .
make run-dashboard
```

### Issue: Data file not found

**Solution:** Verify `Superstore.csv` is in `data/raw/` directory

### Issue: Import errors in notebooks

**Solution:** Restart kernel and reinstall packages

```bash
pip install -r requirements.txt --force-reinstall
```

### Issue: Power BI connection fails

**Solution:**

- Verify file path is correct
- Check data format matches Power BI requirements
- Try refreshing the connection in Power BI

---

## Next Steps

1. **Enhance data pipeline:** Add additional data sources
2. **Expand dashboard:** Include more KPIs and filters
3. **Develop Power BI:** Create comprehensive BI solution
4. **Automate reports:** Schedule report generation
5. **Scale infrastructure:** Move to cloud-based analytics

---

## License

This project is part of the Superstore Sales Analysis initiative.

---

## Contact & Support

For questions or issues:

- Review project documentation in `documentation/`
- Check Jupyter notebooks for examples
- Refer to inline code comments

---

**Last Updated:** February 2026  
**Project Version:** 0.1.0  
**Status:** Active Development
