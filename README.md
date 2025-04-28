# Mortality Rate Analysis and Prediction

## Overview
This project analyzes mortality rates across various categories (e.g., alcohol, homicide, suicide, drugs) based on age group data. The analysis focuses on imputation, statistical modeling, and visual exploration of the relationship between age and mortality rates using a dataset that includes internal and external causes of death.

## Key Steps
1. **Data Preprocessing**: 
   - The dataset is imported, and missing values are imputed using the mean of the respective columns.
   - The data is then cleaned, and features like `agecell`, mortality rates, and various categorical variables are processed.

2. **Exploratory Data Analysis (EDA)**:
   - Summary statistics are calculated for each mortality category (e.g., all causes, internal causes, homicide).
   - Distribution of the data is explored using histograms and univariate analyses.
   - Scatter and line plots are created for various mortality categories against `agecell` to visualize trends and correlations.

3. **Statistical Analysis**:
   - **Treatment Variable**: A binary treatment variable is created based on age (whether the person is 21 years or older).
   - **Regression Models**: Ordinary Least Squares (OLS) regression models are applied to each mortality category to estimate the impact of the treatment (age ≥ 21).

4. **Visualization**:
   - Various scatter plots and line graphs are generated to show the age profile of each mortality category.
   - Multiple line graphs highlight trends across different age groups for categories like alcohol-related deaths, homicides, suicides, and motor vehicle accidents.

## Key Findings
- **Age and Mortality**: Different mortality rates exhibit distinct patterns based on age, with certain categories like homicide and drugs showing a stronger correlation with age than others.
- **Impact of Age**: A binary treatment variable based on age (≥21) was modeled to understand its effect on mortality rates across different causes.
  
## Tools and Libraries
- **SAS** for data preprocessing, regression analysis, and visualization.
- **PROC REG** for running regression models.
- **PROC UNIVARIATE** for statistical analysis.
- **PROC SGPlot** for creating scatter and line graphs.
