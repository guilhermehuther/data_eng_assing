# Guilherme Huther Baldo 

- Data Engineer I – Practical Assignment

## Summary

### Database Setup

I used duckdb as my warehouse engine and created a kind of medallion architecture by dividing in the `.csv` files, silver and gold.

### Data Ingestion and Transformation/Join Code

In the [silver](./queries/silver_billing.sql) you will find the read of the csvs and the join of the two columns. I didn't find the need to treat the data because the way i handled the gold. In the [gold](./queries/gold_billing.sql) theres a `CUBE` statement that summarizes all the revelant columns (this should be written by the bussiness but i assumed that those that i selected were the right ones) by `AVG`, `COUNT`, `MIN`, `MAX` for extracting information regarding any of the dimensions columns approching a star schema.

### Visualization/Output

[gold_billing.csv](./gold_billing.csv)


### Analysis Summary

I didn't have the time to look for insights but the data has poor data quality in some columns which could lead to mislead interpretations of the data.

### Reflection

I used LLM models to speed up the development process regarding schemas and naming the columns of the tables. The hard work.

Also i used streamlit to show the dataframe.

## Running

requirements.txt

```
pip install requirements.txt
```

streamlit

```
python -m streamlit run app.py
``` 