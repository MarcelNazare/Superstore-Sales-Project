# Load data from Postgres to CSV
import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
from pathlib import Path
from read_env import *

dotenv_path = Path(__file__).parent.parent.parent/ '.env'
load_dotenv(dotenv_path=dotenv_path)


def load_data_from_postgres(db_user, db_password, db_host,db_port, db_name, db_table_name):
    try:
        engine_str = f'postgresql+psycopg2://{db_user}:{db_password}@{db_host}/{db_name}'
        engine = create_engine(engine_str)  
        df = pd.read_sql_table(db_table_name,engine)
        #df.drop(columns=['Unnamed: 0'], inplace=True)
        table_name = db_table_name
        file_path = f"C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\processed\\for_visualization\\{table_name}.csv"
        df.to_csv(file_path,index=False)
    except Exception as e:
        print(f"[+] An error occured :-> {e}")
    

def main():
    load_data_from_postgres(db_user,db_password,db_host,db_port,db_name,db_table_name='superstore_data')
    load_data_from_postgres(db_user,db_password,db_host,db_port,db_name,db_table_name='dim_geography')
    load_data_from_postgres(db_user,db_password,db_host,db_port,db_name,db_table_name='dim_customers')
    load_data_from_postgres(db_user,db_password,db_host,db_port,db_name,db_table_name='dim_products')
if __name__ == "__main__":
    # Running the main fucntion
    main()
