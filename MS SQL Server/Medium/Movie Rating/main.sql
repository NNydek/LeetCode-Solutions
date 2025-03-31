--/* Write your T-SQL query statement below */
WITH UserMostRatings AS (
    SELECT TOP 1
		u.user_id,
        u.name,
        ROW_NUMBER() OVER (PARTITION BY mr.user_id ORDER BY mr.movie_id) AS RowNum
    FROM Users u
        LEFT JOIN MovieRating mr
            ON u.user_id = mr.user_id
	ORDER BY RowNum DESC, Name
),
TopRatedMovie_Feb2020 AS (
	SELECT TOP 1
		mr.movie_id,
		m.title,
		CAST(AVG(mr.rating * 1.0) AS DECIMAL(10,1)) AS average_rating
	FROM MovieRating mr
		LEFT JOIN Movies m
			ON mr.movie_id = m.movie_id
	WHERE mr.created_at >= '2020-02-01' AND mr.created_at <= '2020-02-29'
	GROUP BY mr.movie_id, m.title
	ORDER BY average_rating DESC, m.title
)

SELECT u.name AS results
FROM UserMostRatings u
UNION ALL
SELECT m.title AS results
FROM TopRatedMovie_Feb2020 m