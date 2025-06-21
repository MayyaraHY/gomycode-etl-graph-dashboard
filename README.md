# 📊 Subscription & Retention Analysis – Task 1

## 🚀 Overview
This project focuses on analyzing user subscription behavior and retention rates using a dataset of user subscriptions. It involves data cleaning, exploratory analysis, retention and churn analysis, and visualizations using Looker Studio.

---

## 🛠️ Technologies Used
- **Google Colab** – Python for data cleaning and analysis
- **BigQuery** – Data storage
- **Looker Studio** – Data visualization and dashboarding

---

## 📁 Process Summary

### 1️⃣ Data Import & Cleaning
- Imported the raw **CSV file : Functional Task - OLTP_Subscription.csv** containing subscription data into **Google Colab**.
- Dropped the **"instructor diploma"** column due to excessive missing values and low relevance.
- Filled missing values for key fields:
  - `student_birthday`: replaced with the most frequent value.
  - `diploma-date`: replaced with the most frequent date.
- Saved the cleaned DataFrame locally for future steps.

---

### 2️⃣ Exploratory Analysis
- Calculated **subscription trends** over time.
- Computed **churn rate / revenue**.
- Visualized these trends using graphs for clearer insights.

---

### 3️⃣ Cohort Analysis & Retention Metrics
Used **cohort analysis** to calculate and visualize **retention rates** using heatmaps:

#### 📈 Retention Rates by:
- **Student retention over time**
- **Country** retention
- **Age group**:
  - Age brackets: `<20`, `20–30`, `30–40`, ..., `60+`
- **Country + Age group**
- **Product** (track name)
- **Product + Country**
- **Product + Age group**

---

### 4️⃣ Performance Analysis & Final Metrics
To conclude the analysis, the following were computed:

- **Best performing product per country**
- **Average retention rate per country**
- **Retention rate by age group and product** to determine product suitability for each demographic

---

### 5️⃣ BigQuery & Dashboard Integration
- Saved both the cleaned dataset and the retention rate metrics as **CSV files**.
- Imported them into **BigQuery** for centralized querying.
- Used **Looker Studio** to create dashboards and visualizations.

#### 📊 Dashboards Included:
- **Monthly subscription trends**
- **Churn rate over time**
- **Retention rate by:**
  - Country
  - Age group
  - Product

---

## ✅ Outcome
This pipeline provides a clear view of how users behave across countries, age groups, and product tracks. It supports business decisions regarding product targeting, retention strategies, and potential optimizations.

---

## 📂 Files
- `/images/cleaned_data.csv`: Final cleaned dataset
- Dashboards available via Looker Studio [Looker Studio Dashboard link](https://lookerstudio.google.com/u/0/reporting/6feaeb65-fc8c-4978-b952-f789cf271bec/page/yDaOF)


---

