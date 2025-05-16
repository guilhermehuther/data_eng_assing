CREATE OR REPLACE TABLE silver_billing AS
SELECT
    -- From invoices.csv
    inv."Date" AS inv_date,
    inv."Statement No" AS inv_statement_no,
    inv."Client" AS inv_client,
    inv."Business Email" AS inv_business_email,
    inv."Currency" AS inv_currency,
    inv."Summary" AS inv_summary,
    inv."Due Date" AS inv_due_date,
    inv."State" AS inv_state,
    inv."PO Number" AS inv_po_number,
    inv."Note" AS inv_note,
    inv."Sub Total" AS inv_sub_total,
    inv."Discount" AS inv_discount,
    inv."Shipping" AS inv_shipping,
    inv."Tax" AS inv_tax,
    inv."Billed Total" AS inv_billed_total,
    inv."Paid Total" AS inv_paid_total,
    inv."Total Due" AS inv_total_due,
    inv."Last Paid On" AS inv_last_paid_on,
    inv."Last Payment Method" AS inv_last_payment_method,
    inv."Last Payment Currency" AS inv_last_payment_currency,

    -- From expense_entries.csv
    exp."Date" AS exp_date,
    exp."Expense Category" AS exp_expense_category,
    exp."Description" AS exp_description,
    exp."Amount" AS exp_amount,
    exp."State" AS exp_state,
    exp."Tag" AS exp_tag,
    exp."Client" AS exp_client,
    exp."Business Email" AS exp_business_email
FROM 
    read_csv(
        'data/invoices.csv', 
        header = True, 
        sep = ","
    ) inv
JOIN
    read_csv(
        'data/expense_entries.csv', 
        header = True, 
        sep = ","
    ) exp
    ON inv.Client = exp.Client