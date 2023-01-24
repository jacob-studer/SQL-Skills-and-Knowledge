--Show the provinces that has more patients identified as 'M' than 'F'.
--Must only show full province_name




SELECT pr.province_name
FROM patients AS pa
  JOIN province_names AS pr ON pa.province_id = pr.province_id
GROUP BY pr.province_name
HAVING
  COUNT( CASE WHEN gender = 'M' THEN 1 END) > COUNT( CASE WHEN gender = 'F' THEN 1 END)
  
--If column contains the value then the CASE expression will return 1, 
--and COUNT() will add 1 for that row