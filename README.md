# Guilherme Huther Baldo 

- Data Engineer I – Practical Assignment

## Summary

I used duckdb as my warehouse engine and created a kind of medallion architecture by dividing in the `.csv` files, silver and gold.

In the [silver](./queries/silver_billing.sql) you will find the read of the csvs and the join of the two columns. I didn't find the need to treat the data because the way i handled the gold. In the [gold](./queries/gold_billing.sql) theres a `CUBE` statement that summarizes all the revelant columns (this should be written by the bussiness but i assumed that those that i selected were the right ones) by `AVG`, `COUNT`, `MIN`, `MAX` for extracting information regarding any of the dimensions columns approching a star schema.

I used models to speed up the development process regarding schemas and naming the columns of the tables