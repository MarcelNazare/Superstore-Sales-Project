import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os
from pathlib import Path

dotenv_path = Path(__file__).parent.parent.parent/ '.env'
load_dotenv(dotenv_path=dotenv_path)


def main(db_user, db_password, db_host, db_name, table_name):
    processed_file = "C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\processed\\superstore_cleaned.csv"
    df = pd.read_csv(processed_file, encoding='latin1')
    df.drop(columns=['Unnamed: 0'], inplace=True)
    engine_str = f'postgresql+psycopg2://{db_user}:{db_password}@{db_host}/{db_name}'
    engine = create_engine(engine_str)
    try:
        df.to_sql(table_name, engine, if_exists='replace', index=False)
        print(f"Data loaded successfully into table '{table_name}' in database '{db_name}'.")   
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        engine.dispose()

if __name__ == "__main__":
    #main()
    db_user = os.getenv("db_name")
    db_password = '0508'
    # db_password = os.getenv("db_password")
    db_host = os.getenv("db_host")
    db_name = os.getenv("db_name")
    table_name = os.getenv("db_table_name")

    main(db_user,db_password,db_host,db_name,table_name)
    