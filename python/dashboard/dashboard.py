import streamlit as st
import pandas as pd
import plotly.express as px
import seaborn as sns
import matplotlib.pyplot as plt
from pathlib import Path
import folium
from streamlit_folium import st_folium

# ----------------------------------------------------------------------------
# data loading and caching
# ----------------------------------------------------------------------------

@st.cache_data
# use caching to avoid reloading for every rerun

def load_data() -> pd.DataFrame:
    csv_location = Path.cwd() / 'data' / 'processed' / 'for_visualization' / 'superstore_data.csv'
    df = pd.read_csv(csv_location, encoding='latin1')

    # basic datetime parsing so we can resample later
    df['Order Date'] = pd.to_datetime(df['Order Date'], errors='coerce')
    df['Ship Date'] = pd.to_datetime(df['Ship Date'], errors='coerce')

    return df

# load once

df = load_data()

# ----------------------------------------------------------------------------
# streamlit page configuration
# ----------------------------------------------------------------------------

st.set_page_config(page_title="Superstore Dashboard", layout="wide")
st.title("📊 Superstore Sales Visualizations")

# sidebar for filtering if desired
with st.sidebar:
    st.header("Filters")
    min_date = df['Order Date'].min()
    max_date = df['Order Date'].max()
    date_range = st.date_input("Order date range", [min_date, max_date])

    categories = df['Category'].unique().tolist()
    selected_categories = st.multiselect("Category", categories, default=categories)

# apply filters to a working copy
mask = (df['Order Date'] >= pd.to_datetime(date_range[0])) & (df['Order Date'] <= pd.to_datetime(date_range[1]))
mask &= df['Category'].isin(selected_categories)
filtered = df.loc[mask].copy()

# ----------------------------------------------------------------------------
# 1. Time series plots
# ----------------------------------------------------------------------------

st.markdown("### 📈 Time Series")
if not filtered.empty:
    ts = (
        filtered.set_index('Order Date')
        .resample('M')
        .agg({'Sales': 'sum', 'Profit': 'sum'})
        .reset_index()
    )
    fig_ts = px.line(ts, x='Order Date', y=['Sales', 'Profit'], title='Monthly Sales & Profit')
    st.plotly_chart(fig_ts, use_container_width=True)
else:
    st.write("No data available for the selected filter.")

# ----------------------------------------------------------------------------
# 2. Bar chart for top products by sales/profit and by category
# ----------------------------------------------------------------------------

st.markdown("### 🛒 Top Products")
if not filtered.empty:
    prod_agg = (
        filtered.groupby(['Category', 'Product Name'])
        .agg(Sales=('Sales', 'sum'), Profit=('Profit', 'sum'))
        .reset_index()
    )
    # get top 10 by sales
    top_sales = prod_agg.nlargest(10, 'Sales')
    fig_top = px.bar(
        top_sales,
        x='Product Name',
        y='Sales',
        color='Category',
        title='Top 10 Products by Sales',
        labels={'Sales': 'Total Sales'},
    )
    st.plotly_chart(fig_top, use_container_width=True)
else:
    st.write("No data available for the selected filter.")

# ----------------------------------------------------------------------------
# 3. Geographic maps
# ----------------------------------------------------------------------------

st.markdown("### 🗺 Geographic Distribution")
if not filtered.empty:
    state_agg = filtered.groupby('City').agg(Sales=('Sales', 'sum'), Profit=('Profit', 'sum')).reset_index()
    if not state_agg.empty:
        # Create a folium map centered on USA
        m = folium.Map(location=[39.8283, -98.5795], zoom_start=4)
        
        # Add circles for each state
        for idx, row in state_agg.iterrows():
            # You'll need state coordinates - consider using a lookup dict
            folium.CircleMarker(
                location=[row.get('lat', 39), row.get('lon', -98)],
                radius=row['Sales'] / 10000,
                popup=f"{row['City']}: ${row['Sales']:,.0f}",
                color='blue',
                fill=True,
                fillColor='blue',
                fillOpacity=0.6
            ).add_to(m)
        
        st_folium(m, width=700, height=500)
    else:
        st.write("No geographic data to display.")
else:
    st.write("No data available for the selected filter.")

# ----------------------------------------------------------------------------
# 4. Distribution plots
# ----------------------------------------------------------------------------

st.markdown("### 📊 Distributions")
if not filtered.empty:
    col1, col2 = st.columns(2)
    with col1:
        fig_dist_s = px.histogram(filtered, x='Sales', nbins=50, title='Sales Distribution')
        st.plotly_chart(fig_dist_s, use_container_width=True)
    with col2:
        fig_dist_p = px.histogram(filtered, x='Profit', nbins=50, title='Profit Distribution')
        st.plotly_chart(fig_dist_p, use_container_width=True)
else:
    st.write("No data available for the selected filter.")

# ----------------------------------------------------------------------------
# 5. Correlation heatmap
# ----------------------------------------------------------------------------

st.markdown("### 🔗 Correlation Heatmap")
if not filtered.empty:
    numeric = filtered.select_dtypes(include=['number'])
    corr = numeric.corr()
    fig_corr, ax = plt.subplots(figsize=(8, 6))
    sns.heatmap(corr, annot=True, cmap='coolwarm', fmt='.2f', ax=ax)
    st.pyplot(fig_corr)
else:
    st.write("No data available for the selected filter.")



