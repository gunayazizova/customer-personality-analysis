# 📊 Customer Personality Analysis

## Description

We selected a dataset from Kaggle to analyze customer personalities, helping businesses understand their ideal customers. This analysis provides insights into customer demographics, purchase behavior, and preferences, allowing businesses to tailor their offerings more effectively.

Key focus areas include:
- **Demographic Data**
- **Purchase Channels**
- **Purchase Amount**
- **Purchase Habits**

### Key Insights:

#### 🔍 H1:
There is a significant difference in purchasing habits across different customer segments.

#### 📈 H2:
Recent customers are more likely to engage in future purchases and should be targeted in upcoming marketing campaigns.

---

## 🔧 Prerequisites

- **SQL Project**: [Project Repo](https://github.com/Marc-Bouche/sql-database)
- **Trello Board**: [Project Trello](https://trello.com/b/d8z0MUYL/project4week4sql)
- **Presentation**: [Google Drive Folder](https://drive.google.com/drive/folders/156T1bCt9qYJ2yniZfn93VttmJ6T8ypqi)
- **Kaggle Dataset**: [Customer Personality Analysis Dataset](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis)

---

## 🧹 Data Cleaning and Wrangling

The dataset was cleaned primarily using **SQL**. The cleaning process focused on the following:
- Renaming columns for clarity
- Dropping unnecessary columns
- Handling null values

Additionally, **Python** was used for minor cleaning and data transformation related to the hypotheses.

---

## 🔄 Project Process and Structure

The project followed a structured approach to ensure a clear analysis:

1. **Topic Selection**: Identifying the customer segmentation analysis as the focus.
2. **Data Acquisition**: Downloading the "Customer Personality Analysis" dataset from Kaggle.
3. **Data Ingestion**: Uploading the dataset into a SQL database for further manipulation.
4. **Data Exploration**: Examining the data to understand its structure and characteristics.
5. **Data Cleaning**: Resolving issues such as missing values and inconsistencies in the data.
6. **Formulate Business Questions and Hypotheses**: Framing business questions that drive the analysis.
7. **Data Transformation**: Using SQL queries to create insightful tables for analysis.
8. **Data Export**: Exporting transformed tables as CSV files for use in other tools.
9. **Data Visualization & Analysis**: Creating visualizations using Python libraries and Tableau to communicate the findings.
10. **Project Communication**: Presenting the results through a Google Slides presentation.

---

## 📂 GitHub Structure

The project repository contains the following files:

- **README.md**: Provides an overview of the project and its structure.
- **marketing_campaign.csv**: Raw dataset from Kaggle.
- **cleaned_data.sql**: SQL script containing the cleaned dataset.
- **H1.sql**: SQL queries used for Hypothesis 1, including insights and table generation.
- **H2.sql**: SQL queries used for Hypothesis 2, including insights and table generation.
- **visualization_H1.ipynb**: Jupyter notebook for additional cleaning and visualization related to Hypothesis 1.
- **visualization_H2.ipynb**: Jupyter notebook for additional cleaning and visualization related to Hypothesis 2.

---

## How to Run

1. Clone the repository:
    ```bash
    git clone https://github.com/Marc-Bouche/sql-database
    ```

2. Set up the database using the `cleaned_data.sql` file.

3. Explore the datasets using SQL queries, or use the provided Jupyter notebooks (`visualization_H1.ipynb` and `visualization_H2.ipynb`) for further analysis and visualization.

4. For visualizations, you can use Python libraries like Matplotlib, Seaborn, or Tableau for more advanced plots.
