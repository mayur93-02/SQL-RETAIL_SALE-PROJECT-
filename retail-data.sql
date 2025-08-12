--The Data Analytics Projects 
--My Analiss and Findinges 

--1Q Write a SQL query to retrive all columns for sales made on "2022-11-05"

	SELECT * FROM RETAIL_FILE 
	WHERE sale_date = ('2022-11-05') 

--2Q Write a sql query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 1

SELECT transactions_id,category,quantiy
FROM RETAIL_FILE
WHERE category = 'Clothing' and  quantiy > 1
ORDER BY quantiy DESC

--Q 3 Write a sql query to calculate the total sales ( total_sale) for each catogry .

SELECT * FROM RETAIL_FILE 

SELECT category,
SUM ( total_sale) AS TOTAL_AMOUNT,
COUNT (*) AS TOTAL_ORDERS
FROM RETAIL_FILE 
GROUP BY 1

--Q 4 Write a sql query to find the avrage age of customers who purched items from the 'beuty' category.

SELECT category,
ROUND (AVG(age),2) AS toal_avg
FROM RETAIL_FILE
WHERE CATEGORY = 'Beauty'
GROUP BY 1

--Q 5 Write a OOOOsql query to find all tranctions where the total_sale is gerter than 1000.

 SELECT * FROM RETAIL_FILE 
 WHERE total_sale >=1000

--Q 6 Write a sql query to find the total number of transation (transactions_id )
--made by each gender in each category .

SELECT DISTINCT (CATEGORY,GENDER),
count  (transactions_id) AS TOTAL_TRANSC
FROM RETAIL_FILE 
GROUP BY DISTINCT (CATEGORY,GENDER)

--Q 7 Write a sql query calculate the avrag sale for each month. Find out best selling 
--month in each year.
SELECT 
	EXTRACT (YEAR FROM  sale_date ) as year ,
	EXTRACT (MONTH FROM SALE_DATE ) AS MOUNT ,
	 ROUND(AVG(TOTAL_SALE),3 ) AS AVG_SALE 
	FROM RETAIL_FILE
	GROUP BY 1,2
	ORDER BY 1,2 DESC
--Q 8 Write a sql query find top 5 coustmers based on the highest total sales.

 SELECT 
 	customer_id,
	 SUM(total_sale) AS total_sale 
	 FROM RETAIL_FILE 
	 GROUP BY 1
	 ORDER BY 2 DESC
	 LIMIT 5

--Q 9 Write a sql query find the number of unique customers who purchesed items from each category .

 SELECT 
 	category,
	 COUNT ( DISTINCT customer_id ) as cnt_uniq1ue 
	 FROM RETAIL_FILE 
	 GROUP BY category

--Q 10 Write a sql query to create each shift  and number of orders ( Example morning <=12 , afrernoon berween 12 and 17 ,evning )


SELECT * ,
	CASE 
		WHEN EXTRACT ( HOUR FROM sale_time )<12 THEN 'Morning'
		WHEN EXTRACT ( HOUR FROM sale_time )BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END as shift 
FROM RETAIL_FILE 


--END OF PROJECT 







 











