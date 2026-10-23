#Installing readxl 
install.packages ("readxl")
library (readxl)
#Opening a window to select the excel file that will be used 
file_path <- file.choose ()
#Importing the Excel school district data 
school_data <- read_excel(file_path) 

#Using this to read sheet 2 
my_data <- read_excel("your_file.xlsx", sheet = 2)
#Displaying the first six rows
head(school_data)

#Checking the Dataset 
#Number of rows and columns
dim(school_data)

#Column names
names(school_data)

#Data types and structure
str(school_data)

#Open the dataset in a spreadsheet-style viewer
View(school_data )

#Checking Dataset column names 
#Showing the names of all the sheet included in the Excel file 
excel_sheets(file_path)
school_data <- read_excel(
  file_path,
  sheet = "DISTRICT_OVERVIEW"
)
#Display the column names 
names(school_data)

#Loading the packages 
library(dplyr)
library(ggplot2)

# Keeping the variables needed for our analysis
# Creating a new object called enrollment_analysis <-
# Using the original imported excel data and the pipe operator to pass the result from one step to the next.
#Using the select() function to choose which columns to keep. 
enrollment_analysis <- school_data %>%
  select(
    `District Name`,
    County,
    `Enrollment 2025-2026`,
    `Overall Star Rating`
  )

# Checking the selected data
#Displaying the first six rows of the dataset 
head(enrollment_analysis)

# Checking the data types
# str() stands for structure
str(enrollment_analysis)

#The results from this output explain that our dataset contains 67 rows of district records, the 4 columns that were selected which include: District Name, county enrollment, and overall star rating.  

# Next step is to convert enrollment and star rating into numbers 
# Clean the data and convert the two variables to numbers
enrollment_analysis <- enrollment_analysis %>%
  mutate(
    Enrollment = as.numeric(`Enrollment 2025-2026`),
    Star_Rating = as.numeric(
      sub(" Stars", "", `Overall Star Rating`)
    )
  )

# Checking the results
head(enrollment_analysis)

# Checking the new data types
str(enrollment_analysis)

#Checking to make sure the conversion worked 
# Summarize enrollment
summary(enrollment_analysis$Enrollment)

# Counting each star rating
# useNA = "ifany" this options helps us to identify missing ratings 
table(enrollment_analysis$Star_Rating, useNA = "ifany")

# Creating a box plot to compare enrollment by star rating.
ggplot(
  enrollment_analysis, 
  aes(
    x = factor(Star_Rating),
    y = Enrollment
  )
) + 
  geom_boxplot() + 
  labs(
    title = "Ohio School District Enrollment By Overall Star Rating",
    x = "Overall Star Rating",
    y = "District Enrollment"
  ) + 
  theme_minimal

#Creating a Summary Table to best interpret the graph 
#Group_by(Star_Rating) helps to seperate the districts into groups based on their overall star rating 
library(dplyr)
enrollment_summary <-enrollment_analysis %>%
  group_by(Star_Rating) %>%
  summarise(
#Number_of_Districts = sum(!is.na(Enrollment))
# is.na(Enrollment) checks whether an enrollment value is missing 
# != is not, therefore !is.na(Enrollment) identifies enrollment values not missing
# na stands for a missing value, rm stands for remove, and TRUE tells R to ignore any missing values 
#  width = Inf 
    Number_of_Districts = sum(!is.na(Enrollment)),
    Median_Enrollment = median(Enrollment, na.rm = TRUE),
    Average_Enrollment = mean(Enrollment, na.rm = TRUE),
    Smallest_Enrollment = min(Enrollment, na.rm = TRUE),
    Largest_Enrollment = max(Enrollment, na.rm = TRUE),
    .groups = "drop"
  )
   
#Displaying every column using width=Inf, which is used to display every column
print(enrollment_summary, width = Inf)
View(enrollment_summary)

regionmetrics = district %>%
  group_by(Region) %>%
  summarize(
    AvgGrad = mean(`Graduation Rate Component Percentage`, na.rm = TRUE),
    AvgPerf = mean(`Performance Index Percent`, na.rm = TRUE),
    AvgGapClose = mean(`Gap Closing Component Percent`, na.rm = TRUE),
    AvgEarlyLit = mean(`Early Literacy Component Percent`, na.rm = TRUE),
    AvgReadiness = mean(
      `College Career Workforce and Military Readiness Percent`,
      na.rm = TRUE
    )
  )

regionmetrics = district %>%
  group_by(Region) %>%
  summarize(
    AvgGrad = mean(`Graduation Rate Component Percentage`, na.rm = TRUE),
    AvgPerf = mean(`Performance Index Percent`, na.rm = TRUE),
    AvgGapClose = mean(`Gap Closing Component Percent`, na.rm = TRUE),
    AvgEarlyLit = mean(`Early Literacy Component Percent`, na.rm = TRUE),
    AvgReadiness = mean(
      `College Career Workforce and Military Readiness Percent`,
      na.rm = TRUE
  ) 
)  
#Checking Dataset column names 
#Showing the names of all the sheet included in the Excel file 
excel_sheets(file_path)
school_data <- read_excel(
  file_path,
  sheet = "DISTRICT_OVERVIEW"
)
#Display the column names 
names(school_data)

#Loading the packages 
library(dplyr)
library(ggplot2)

# Keeping the variables needed for our analysis
# Creating a new object called enrollment_analysis <-
# Using the original imported excel data and the pipe operator to pass the result from one step to the next.
#Using the select() function to choose which columns to keep. 
enrollment_analysis <- school_data %>%
  select(
    `District Name`,
    County,
    `Enrollment 2025-2026`,
    `Overall Star Rating`
  )
#Loading the packages 
library(dplyr)
library(ggplot2)