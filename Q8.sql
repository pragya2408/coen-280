SELECT B.BusinessID AS BID, B.BusinessName AS Name, NoOfReviews
FROM Business B, REVIEWS Rs
WHERE B.address = '% CA %' AND NoOfReviews > 2 AND B.Business_ID = Rs.Business_ID
GROUP BY B.BusinessID, B.BusinessName, B.stars, NoOfReviews, B.address
HAVING MIN(Rating) = 3
ORDER BY B.BusinessName 
;