# db.py

from sqlalchemy import create_engine, text
import pandas as pd
from constants import DB_CONFIG

def get_engine():
    try:
        conn_string = f"postgresql+psycopg2://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
        engine = create_engine(conn_string)
        return engine
    except Exception as e:
        print(f"Error creating engine: {e}")
        return None
    
def read_table(table_name, schema):
    engine = get_engine()
    if engine is None:
        print(f"Failed to create engine for reading table {table_name}")
        return pd.DataFrame()

    try:
        query = text(f'SELECT * FROM "{schema}"."{table_name}"')
        with engine.connect() as connection:
            df = pd.read_sql_query(query, connection)
        return df
    except Exception as e:
        print(f"Error reading table {table_name}: {e}")
        return pd.DataFrame()
