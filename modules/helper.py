import duckdb

PARENT_DIR = "/".join(__file__.split("/")[:-2])

def _get_con():
    return duckdb.connect(
        database=f'{PARENT_DIR}/data/db.duckdb', 
        read_only=False
    )

def run_sql(
    sql: str = None,
    sql_file_name: str = None,
    sql_dir: str = f"{PARENT_DIR}/queries"
):
    if sql is None and sql_file_name is None:
        raise ValueError("Missing parameters.")

    con = _get_con()
    
    if sql_file_name is not None:
        with open(f"{sql_dir}/{sql_file_name}") as f:
            sql = f.read()

    return con.execute(sql).fetchdf()
