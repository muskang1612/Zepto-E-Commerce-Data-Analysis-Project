import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# CSV folder
# Folder containing this Python script
BASE_DIR = Path(__file__).resolve().parent

# Folder containing cleaned CSV files
folder = BASE_DIR / "cleaned_data"

# MySQL connection
url = URL.create(
    "mysql+mysqlconnector",
    username="Your_username",
    password="Your_Password",
    host="127.0.0.1",
    port=3306,
    database="Database _name"
)

engine = create_engine(
    url,
    pool_pre_ping=True,
    pool_recycle=1800
)

# Load all CSV files
for file in folder.glob("*.csv"):

    df = pd.read_csv(file)

    # Use lowercase table names
    table_name = file.stem.lower()

    print(f"\nLoading {file.name}")
    print(f"Rows: {len(df)}")

    df.to_sql(
        name=table_name,
        con=engine,
        if_exists="replace",
        index=False,
        chunksize=1000
    )

    print(f"{table_name} loaded successfully")

engine.dispose()

print("\nAll 6 files loaded successfully!")