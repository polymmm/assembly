SET @max1 = (SELECT MAX(courier_id) FROM feedback);

SET @max2 = (SELECT DISTINCT courier_id
	     FROM feedback AS max2v1
             WHERE 2 = (SELECT COUNT(DISTINCT courier_id)
			FROM feedback AS max2v2
			WHERE max2v1.courier_id <= max2v2.courier_id));
			
SET @max3 = (SELECT DISTINCT courier_id
	     FROM feedback AS max3v1
             WHERE 3 = (SELECT COUNT(DISTINCT courier_id)
			FROM feedback AS max3v2
			WHERE max3v1.courier_id <= max3v2.courier_id));

SELECT DISTINCT courier_id, rating
FROM feedback
WHERE courier_id IN (@max1,@max2,@max3)
ORDER BY courier_id DESC;
