SELECT word
     , COUNT(*) total
  FROM ( SELECT DISTINCT id
                     , SUBSTRING_INDEX(SUBSTRING_INDEX(text,' ',i+1),' ',-1) word
                  FROM love1, ints
     ) x
 GROUP
    BY word
HAVING COUNT(*) > 1 
 ORDER
    BY total DESC
     , word;
     
     
    