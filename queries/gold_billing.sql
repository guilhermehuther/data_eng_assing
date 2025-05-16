CREATE OR REPLACE TABLE gold_billing AS 
SELECT
    month(inv_date) as inv_date_month,
    year(inv_date) as inv_date_year,
    inv_client, 
    inv_currency,
    inv_state,
    exp_expense_category,
    exp_description, 
    exp_state, 
    exp_tag,

    COUNT(inv_client),

    AVG(inv_sub_total),
    AVG(inv_discount),
    AVG(inv_shipping),
    AVG(inv_tax),
    AVG(inv_billed_total),
    AVG(inv_paid_total),
    AVG(inv_total_due),
    AVG(exp_amount),

    MIN(inv_sub_total),
    MIN(inv_discount),
    MIN(inv_shipping),
    MIN(inv_tax),
    MIN(inv_billed_total),
    MIN(inv_paid_total),
    MIN(inv_total_due),
    MIN(exp_amount),

    MAX(inv_sub_total),
    MAX(inv_discount),
    MAX(inv_shipping),
    MAX(inv_tax),
    MAX(inv_billed_total),
    MAX(inv_paid_total),
    MAX(inv_total_due),
    MAX(exp_amount)
FROM 
    silver_billing
GROUP BY 
    CUBE (
        month(inv_date),
        year(inv_date),
        inv_client, 
        inv_currency,
        inv_state,
        exp_expense_category,
        exp_description, 
        exp_state, 
        exp_tag
    );