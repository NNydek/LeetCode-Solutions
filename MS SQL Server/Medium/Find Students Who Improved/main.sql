/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT DISTINCT
        student_id,
        subject,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date
        ) AS first_score,
        LAST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING 
        ) AS latest_score
    FROM Scores
),
exams_count AS (
    SELECT
        student_id,
        subject,
        COUNT(DISTINCT exam_date) AS cnt
    FROM Scores
    GROUP BY student_id, subject
)
SELECT
    cte.student_id,
    cte.subject,
    cte.first_score,
    cte.latest_score
FROM CTE cte
    JOIN exams_count ec
        ON cte.student_id = ec.student_id
            AND cte.subject = ec.subject 
WHERE ec.cnt >= 2
    AND cte.latest_score > cte.first_score
ORDER BY cte.student_id, cte.subject
