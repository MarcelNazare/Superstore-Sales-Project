import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
from pathlib import Path
from read_env import *

dotenv_path = Path(__file__).parent.parent.parent/ '.env'
load_dotenv(dotenv_path=dotenv_path)

def load_into_table(file_name,dataframe,db_user, db_password, db_host, db_name, db_table_name):
    engine_str = f'postgresql+psycopg2://{db_user}:{db_password}@{db_host}/{db_name}'
    engine = create_engine(engine_str)  
    df = dataframe  
    try:
        df.to_sql(db_table_name, engine, if_exists='replace', index=False)
        print(f"Data loaded successfully into table '{db_table_name}' in database '{db_name}'.")   
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        engine.dispose()

def main():
    # Running main function
    # Reading dataframe from csv
    processed_file = "C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\processed\\superstore_cleaned.csv"
    df = pd.read_csv(processed_file, encoding='latin1')
    df.drop(columns=['Unnamed: 0'], inplace=True)
    # Creaeting the dimensions dataframes
    dim_customers = df[['Customer ID','Customer Name','Segment']]
    dim_geography = df[['Country','City','State','Postal Code','Region']]
    dim_products = df[['Product ID','Category','Sub-Category','Product Name']]
    # Main superstore_data table
    load_into_table(processed_file,df,db_user,db_password,db_host,db_name,db_table_name='superstore_data')
    # Dim Customers table
    load_into_table(processed_file,dim_customers,db_user,db_password,db_host,db_name,db_table_name='dim_customers')
    # Dim Geography table
    load_into_table(processed_file,dim_geography,db_user,db_password,db_host,db_name,db_table_name='dim_geography')
    # Dim Producst tabke
    load_into_table(processed_file,dim_products,db_user,db_password,db_host,db_name,db_table_name='dim_products')

if __name__ == "__main__":
    # Running the main fucntion
    main()






    