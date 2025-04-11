/* Write your T-SQL query statement below */
SELECT
    sample_id,
    dna_sequence,
    species,
    IIF(dna_sequence LIKE 'ATG%', 1, 0) AS has_start,
    CASE 
        WHEN dna_sequence LIKE '%TAA'
        OR dna_sequence LIKE '%TAG'
        OR dna_sequence LIKE '%TGA'
            THEN 1
        ELSE 0
    END AS has_stop,
    IIF(dna_sequence LIKE '%ATAT%', 1, 0) AS has_atat,
    IIF(dna_sequence LIKE '%GGG%', 1, 0) AS has_ggg
FROM Samples
ORDER BY sample_id
