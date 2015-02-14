-- Problem #1
select distinct vendor_name
from vendors
where vendor_id in
(
	select vendor_id
    from invoices
)
order by vendor_name;

-- Problem #2
select invoice_id, invoice_total
from invoices
where payment_total > 
(
	select sum(payment_total) / count(*)
    from invoices
    where payment_total > 0
)
order by invoice_total desc;

-- Problem #3
select account_number, account_description
from general_ledger_accounts g
where not exists
(
	select *
    from invoice_line_items i
    where i.account_number = g.account_number
)
order by account_number;

-- Problem #4
select v.vendor_name, i.invoice_id, l.invoice_sequence, l.line_item_amount
from invoice_line_items l
join invoices i on i.invoice_id = l.invoice_id
join vendors v on v.vendor_id = i.vendor_id
where i.invoice_id in
(
	select invoice_id
    from invoice_line_items
    where invoice_sequence > 1
);

-- Problem #5
select sum(invoice_total)
from
(
	select vendor_id, max(invoice_total) as invoice_total
	from invoices
	where payment_date is null
	group by vendor_id
) as max_invoices;

-- Problem #6
select v1.vendor_name, v1.vendor_city, v1.vendor_state
from vendors v1
	left join vendors v2
		on v1.vendor_city = v2.vendor_city
        and v1.vendor_state = v2.vendor_state
        and v1.vendor_id <> v2.vendor_id
where v2.vendor_id is null
order by v1.vendor_city, v1.vendor_state;


-- Problem #7
select vendor_name, i.invoice_number, i.invoice_date, i.invoice_total
from invoices i
join vendors v on v.vendor_id = i.vendor_id
where invoice_date = 
	(
		select min(invoice_date)
        from invoices i2
        where i2.vendor_id = i.vendor_id
	)
order by vendor_name;

-- Problem #8
select vendor_name, i.invoice_number, i.invoice_date, i.invoice_total
from vendors v
	join (
		select vendor_id, min(invoice_date) as earliest
		from invoices
		group by vendor_id
	) as ei on v.vendor_id = ei.vendor_id
	join invoices i on i.vendor_id = ei.vendor_id and i.invoice_date = ei.earliest
order by vendor_name;


