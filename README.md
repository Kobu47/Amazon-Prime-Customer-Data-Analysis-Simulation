## Project Overview

Im using data that simulate Amazon Prime customer data of the year 2024 to analyze the customers and to get come up with useful insights for the decisions of the company such as Customer Churn Rate and Retention rate.

## Data Source

Kaggle: [Dataset](https://www.kaggle.com/datasets/arnavsmayan/amazon-prime-userbase-dataset/data)

## Tools

-- MS SQL Server/ SQL Server Management Studio for data manipulation and calculations to be later used for answering important questions and to visualise them.
-- Tableau Public used for the visualisations and the creation of the dashboard

## Goal

Goal is to answer important questions for the company and to provide insights. Such questions are: 
-- What are the Customer Churn and Retention Rates for the quarters of the year 2024?
-- How many new customer subscription the company got and how many subscriptions were cancelled in 2024
-- Basic statistical insights such as percentages of the popularity of each Subscription Plan


## Data Preparation 

--There wasn't much needed as there were no duplicates or problematic data but i did check just in case using Excel. 

## Calculations 

--The calculations were made in Ms Sql Server to simulate a usage of huge dataset so SQL would be a preferred way of working for optimizing performance. Most of the calculations were done here and you can find the Query file [Here](https://github.com/Kobu47/Amazon-Prime-Customer-Analysis-Simulation/blob/main/Amazon_Prime_Data_Analysis_Query.sql). Since i used Tableau Public for the visualisation i couldn't connect to the SQL server directly so i just saved the results to these exact CSV files : [Churn and Retention Rates](https://github.com/Kobu47/Amazon-Prime-Customer-Analysis-Simulation/blob/main/Amazon_Prime_Churn_Retention_Rates.csv) , [Subscription Plan Basic Data](https://github.com/Kobu47/Amazon-Prime-Customer-Analysis-Simulation/blob/main/Subscription_Plan_Info.csv) and [Customer_Support_Interactions](https://github.com/Kobu47/Amazon-Prime-Customer-Analysis-Simulation/blob/main/Support_Interactions_Rating.csv) which was not used as a dataset in the end.

## Analysis

-- In the analysis of the Churn and Retention rates the first Quarter of the year was not calculated since in these simulated data we don't have customers before the year 2024.I explored the data but there were no notable patters. I tried to find some corelation between the number of customer interactions and the ratings but there was none leading me to not use the specific results. The data clearly showed that the year 2024 was a terrible year for Amazon with a huge drop in subscriptions at the mid - end of the year along with a high customer churn rate and a low retention rate. 

## Conclusion 

A deeper alysis with more detailed data must be made to come up some answers as to why the the end of 2024 saw that huge of decline in Amazon's customer value. You can check out the interactive Dashboard [Here]( https://public.tableau.com/app/profile/dimitris.kompouras/viz/Dashboard_17389112743540/AmazonPrimeSubscriptionCustomerAnalysis-2024). At the moment i recommend focusing not on getting customers but keeping them by trying to transition the monthly subscription users to yearly.


