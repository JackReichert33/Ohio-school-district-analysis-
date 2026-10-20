# Ohio-school-district-analysis-
Exploratory data analysis of Ohio school district report card ratings and enrollment using R.

Research Questions: 

What is the distribution of overall rating scores?​
The purpose was to find a benchmark for the overall ratings given to all the districts.  ​

How do urba-area districts compare to rural-area districts?​
Columbus, Cincinnati, and Cleveland account for Ohio's most populous cities; this question was aimed at discovering how geography and area population impact a districts overall performance. ​

Does enrollment factor in a district’s success scores?​
The purpose was to find whether enrollment plays a factor in graduation rates and overall scores.  ​



METHODOLOGY

The dataset used in this project was called District_Overview, which contained a total of 607 school district records. The areas of interest included district enrollment, overall star rating, Performance Index Percent, State Support Region, Early Literacy Component Percent, Graduation Rate Component Percent, Gap Closing Component Percent, and College Career Workforce and Military Readiness Percent.  

Before the analysis, there was a good amount of data inspection done to identify relevant variables and assess their data types. Additionally, the original data set, named as district in RStudio, required a decent amount of cleaning before we could begin to assess the data. For example, the original data set listed each district’s overall star rating as a string (e.g., 2 Stars) rather than just an integer. To fix this, we needed to separate the value to return only the number of stars, then convert it to a numerical value so that we could find patterns or data summaries. 

#Code Used to Clean the Data
district = district %>% separate('Overall Star Rating', c('Overall Stars', NA), sep=" ") %>% mutate(`Overall Stars` = as.numeric(`Overall Stars`) 
