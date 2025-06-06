/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT
        book_id,
        COUNT(*) AS current_borrowers
    FROM borrowing_records
    WHERE return_date IS NULL
    GROUP BY book_id
)

SELECT
    lb.book_id,
    lb.title,
    lb.author,
    lb.genre,
    lb.publication_year,
    cte.current_borrowers
FROM library_books lb
    JOIN CTE cte
        ON lb.book_id = cte.book_id
WHERE lb.total_copies - cte.current_borrowers = 0
ORDER BY cte.current_borrowers DESC, lb.title ASC