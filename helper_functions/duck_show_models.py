import duckdb
import pandas as pd 

TABLES = [
    "dim_airplane",
    "dim_airplane_model",
    "dim_city",
    "dim_customer_group",
    "dim_customer",
    "fact_order",
    "fact_trip"
]

con = duckdb.connect("duckdb/database.duckdb")

for table in TABLES:
    res = pd.read_sql(f"SELECT * FROM {table}", con=con)
    print(res.head(50))

con.close()