# %% [markdown]
# # Loading Data

# %%
# importing Pandas
import pandas as pd

# Loading dataset with specified encoding
file = "C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\raw\\Superstore.csv"
# Loading data as df
df = pd.read_csv(file, encoding='latin1')

# %% [markdown]
# # Checking For Dataset Value

# %%
df.head(10) # Check on the first 10 rows

# %%
df.tail(10) # Check on the last 10 values

# %% [markdown]
# # Overview of the dataset

# %%
# Having a look at the data types
df.dtypes

# %%
#Checking for the number of rows and columns in the dataset
print(f"Number of columns -> {df.shape[1]}")
print(f"Number of rows -> {df.shape[0]}")

# %%
# Getting an overview of the columns in the dataset
df.columns.to_list()

# %% [markdown]
# # Checking for Missing values in the Dataset

# %%
# Handling missing data
number_cols = df.shape[1]
df.isnull().sum().sort_values(ascending=False).head(number_cols)

# %%
# Dropping duplicates and null values
duplicates = df.duplicated().sum()
null_values = df.isnull().sum()

print(f"Number of duplicates -> {duplicates}")
print(f"Number of missing values -> {null_values.sum()}")

# %%
before = df.shape[0]
df.dropna(inplace=True)
df.drop_duplicates()
after = df.shape[0]
print(f"Removed {before-after} duplicate rows")

# %% [markdown]
# # Converting the necessary columns to datetime columns

# %%
# Converting to date
#df[['Order Date','Ship Date']] = df[['Order Date','Ship Date']].astype('datetime64[ns]')
date_columns = ['Order Date','Ship Date']
for col in date_columns:
    df[col] = pd.to_datetime(df[col],errors='coerce').dt.normalize()

#f['Order Date'] = pd.to_datetime(df['Order Date']).dt.date
#f['Ship Date'] = pd.to_datetime(df['Ship Date']).dt.date

df.head(10)

# %% [markdown]
# # Checking for negatives in the Profits and Sales Colums

# %%
count_negative = (df[['Profit','Sales']]<0).sum()
print(f"Number of Negative values in Profit Column {count_negative['Profit']}")
print(f"Number of Negative values in Sales Column {count_negative['Sales']}")

# %% [markdown]
# # Creating A Description Of The Data

# %%
# In order to get quick stats like std and the means
df[['Sales','Quantity','Discount','Profit']].describe()

# %%
df.head(3)

# %% [markdown]
# # Explanatory Data Analysis
# ## Using Ydata-Profiling

# %%
import numpy as np
from ydata_profiling import ProfileReport

# %%
profile = ProfileReport(df,title="EDA Report")

# %%
profile.to_file("../../reports/SuperstoreSalesReport.html")

# %% [markdown]
# # Creating Derived Columns

# %%
df.head(1)

# %%
# Adding Order Processing Time Column To The Dataframe
order_processing_time = (df['Ship Date']- df['Order Date'])

# %%
df['Order Processing Time'] = order_processing_time
df.head(10)

# %%
# Create a new nullable integer column with number of days (allows missing values)
df['Order Processing Time'] = pd.to_timedelta(df['Order Processing Time'], errors='coerce')
# Create a new nullable integer column with number of days (allows missing values)
df['Order Processing Days'] = df['Order Processing Time'].dt.days.astype('Int64')
df.head(10)

# %%
# Adding a Profit Margin Column
df['Profit Margin'] = (df['Profit']/df['Sales']).round(2)
df['Profit Margin']
df.head(10)

# %%
# Adding a  %Profit Margin Column
df['%Profit Margin'] = (df['Profit Margin'] * 100).round(2)
df['%Profit Margin']


# %%
# Calculating Discount Bands

# %%
df.head(10)

# %%
del df['Shipped Quarter']

# %%
# Creating A Year, Quarter and Month column for The Order and Ship Dates
df['Order Year'] = df['Order Date'].dt.year
df['Order Quarter'] = 'Q'+ df['Order Date'].dt.quarter.astype(str)
df['Order Month'] = df['Order Date'].dt.month_name().str[:]
df['Shipped Year'] = df['Ship Date'].dt.year
df['Shipped Quarter'] = "Q" + df['Ship Date'].dt.quarter.astype(str)
df['Shipped Month'] = df['Ship Date'].dt.month_name().str[:]


# %%
df.head(10)

# %%
df.head(10)

# %% [markdown]
# # Saving the processed dataframe

# %%
output = "C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\processed\\superstore_cleaned.csv"
df.to_csv(output)


