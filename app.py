import streamlit as st
import duckdb
import pandas as pd
from modules.helper import run_sql

@st.cache_data
def load_data():
    run_sql(sql_file_name="silver_billing.sql")
    run_sql(sql_file_name="gold_billing.sql")
    return run_sql("SELECT * FROM gold_billing")

# Load and store in session
if "df" not in st.session_state:
    st.session_state.df = load_data()

# Display DataFrame
st.title("Data: gold_billing")
st.dataframe(st.session_state.df, use_container_width=True)
