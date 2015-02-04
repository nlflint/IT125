USE ap;

-- #6 from Chapter 3 exercies
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name, vendor_contact_first_name;

-- #7 from Chapter 3 exercies
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
WHERE LEFT(vendor_contact_last_name,1) in ('A','B','C','E')
ORDER BY vendor_contact_last_name, vendor_contact_first_name;

-- #8 from Chapter 3 exercies
SELECT invoice_due_date, invoice_total, invoice_total * 0.1, invoice_total * 1.1
FROM invoices
WHERE invoice_total BETWEEN 500 AND 1000
ORDER BY invoice_date desc;

-- #9 from Chapter 3 exercies
SELECT
	invoice_number,
    invoice_total,
    payment_total + credit_total AS payment_credit_total,
    invoice_total - payment_total - credit_total AS balance_due
FROM invoices
HAVING balance_due > 50
ORDER BY balance_due DESC
LIMIT 5;