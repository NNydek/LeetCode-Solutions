/* Write your T-SQL query statement below */
--To bypass TLE error, use this:
--CREATE INDEX idx_sales_product_id ON Sales(product_id);
--CREATE INDEX idx_product_product_id ON Product(product_id);

SELECT p.product_name, s.year, s.price
FROM Sales s
    LEFT JOIN Product p
        ON s.product_id = p.product_id
OPTION(MAXDOP 64)