SELECT
DATE_TRUNC('month', creation_date) AS month,
fact_contact.contact_id
FROM
fact_contact
GROUP BY
fact_contact.contact_id
ORDER BY
month ASC;

SELECT
DATE_TRUNC('month', creation_date) AS month,
fact_quotes .quote_id
FROM
fact_quotes
GROUP BY
fact_quotes.quote_id
ORDER BY
 month ASC;