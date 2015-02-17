-- Chapter 9 Exercises (pages 272 & 273)

-- Problem #1
use ap;
select invoice_total, round(invoice_total,1), round(invoice_total,0)
from invoices;

-- Problem #2
use ex;
select
	start_date,
    DATE_FORMAT(start_date, '%M/%d/%y'),
    DATE_FORMAT(start_date, '%c/%e/%y'),
    DATE_FORMAT(start_date, '%l:%i %p'),
    DATE_FORMAT(start_date, '%c/%d/%y %l:%i %p')
from date_sample;

-- Problem #3
use ap;
select
	vendor_name,
    UPPER(vendor_name),
    vendor_phone,
    SUBSTRING_INDEX(vendor_phone, '-', -1),
    CONCAT(
		SUBSTRING(vendor_phone FROM 2 FOR 3),
        '.',
        SUBSTRING(vendor_phone FROM 7 FOR 3),
        '.',
        SUBSTRING(vendor_phone FROM -4 FOR 4)
	) as phone_with_dots,
    CASE WHEN 0 < LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1)
		THEN SUBSTRING(
			vendor_name,
			LOCATE(' ', vendor_name),
			LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) - LOCATE(' ', vendor_name))
		ELSE SUBSTRING(
			vendor_name,
			LOCATE(' ', vendor_name),
			LENGTH(vendor_name) - LOCATE(' ', vendor_name) + 1) 
	END as blah
from vendors;

-- Problem #4
select
	invoice_number,
    invoice_date,
    adddate(invoice_date, INTERVAL 30 DAY) as invoice_plus_30_days,
    payment_date,
    datediff(payment_date, invoice_date) as days_to_pay,
    DATE_FORMAT(invoice_date, '%c') as month_number,
    DATE_FORMAT(invoice_date, '%Y') as 4_digit_year
from invoices
where DATE_FORMAT(invoice_date, '%c') = 5;
