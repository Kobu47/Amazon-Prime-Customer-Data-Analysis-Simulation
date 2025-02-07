--Calculates the Customer Retention and Churn Rates for each quarter of the year
--Counts the number of customers who started in each quarter
WITH Quarter_data_Start AS
(SELECT 
        'Q' + CAST(DATEPART(QUARTER, Membership_Start_Date) AS VARCHAR(1)) AS Quarters,
		COUNT(*) AS Total_Membership_Start
FROM amazon_prime_users
WHERE DATEPART(YEAR,Membership_Start_Date) = 2024
GROUP BY 'Q' + CAST(DATEPART(QUARTER, Membership_Start_Date) AS VARCHAR(1))
), 
--Counts the number of customers who quit in each quarter
Quarter_data_End AS
(SELECT 
        'Q' + CAST(DATEPART(QUARTER, Membership_End_Date) AS VARCHAR(1)) AS Quarters,
		COUNT(*) AS Total_Membership_End
FROM amazon_prime_users
WHERE DATEPART(YEAR,Membership_End_Date) = 2024
GROUP BY 'Q' + CAST(DATEPART(QUARTER, Membership_End_Date) AS VARCHAR(1))
),
--Combines the data
Joined AS
(SELECT qe.Quarters AS Quarters ,
        COALESCE(qs.Total_Membership_Start,0) AS New_Customers,
		COALESCE(qe.Total_Membership_End,0) AS Lost_Customers
 FROM Quarter_data_Start qs
 FULL OUTER JOIN Quarter_data_End qe ON qs.Quarters = qe.Quarters
 ),
--Calculates the Adjusted Starting Customers
Calculations AS
(SELECT Quarters,
        New_Customers,
		Lost_Customers,
		SUM(New_Customers) OVER (ORDER BY Quarters ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) 
        - SUM(Lost_Customers) OVER (ORDER BY Quarters ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) 
        AS Adjusted_Starting_Customers
FROM Joined
),--Customer Churn Rate
Churn AS 
 (SELECT Quarters,
        New_Customers,
		Lost_Customers,
		ROUND((CAST(Lost_Customers AS FLOAT)/Adjusted_Starting_Customers),3)  * 100 AS Customer_Churn_Rate
 FROM Calculations
 )--Customer Retention Rate
 SELECT *,
        (100 - Customer_Churn_Rate) AS Customer_Retention_Rate
 FROM Churn
 ORDER BY Quarters

--Calculates the Percentages for the subscription plans
SELECT Subscription_Plan,
        Gender,
        COUNT(*) as Total_subscription,
		CAST(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS FLOAT) AS Percentage
FROM amazon_prime_users
GROUP BY Gender,Subscription_Plan

--Checks If there is a pattern between the interactions with customer support and the feedback in the form of rating
SELECT Customer_Support_Interactions,
       COUNT(Customer_Support_Interactions) AS Number_Of_Interactions,
	   ROUND(AVG(Feedback_Ratings),2) AS Average_Rating
FROM amazon_prime_users
GROUP BY Customer_Support_Interactions
ORDER BY Customer_Support_Interactions
