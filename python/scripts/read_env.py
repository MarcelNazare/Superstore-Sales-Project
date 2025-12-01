from dotenv import load_dotenv
import os
from pathlib import Path

dotenv_path = Path(__file__).parent.parent.parent/ '.env'
load_dotenv(dotenv_path=dotenv_path)

db_user = os.getenv("db_name")
db_password = os.getenv("db_password")
db_host = os.getenv("db_host")
db_name = os.getenv("db_name")
table_name = os.getenv("db_table_name")