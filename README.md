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
- etl_task.ipynb : python notebook code
- `/images/cleaned_data.csv`: Final cleaned dataset
- Dashboards available via Looker Studio [Looker Studio Dashboard link](https://lookerstudio.google.com/u/0/reporting/6feaeb65-fc8c-4978-b952-f789cf271bec/page/yDaOF)
- `/images/`looker studio dashboards` : screenshots for the dashboard 


---


# 🧠 Task 2 – Graph Schema Design & Cypher Query Challenge

## 📁 Overview
This task focuses on modeling a graph database using Neo4j Desktop. CSV files were imported to define nodes such as students, sessions, modules, and professors, along with their relationships. Then, several Cypher queries were written and executed to explore and analyze the graph.

---

### ✅ data pipeline

The data pipeline processes multiple CSV files to build a connected graph model in **Neo4j Desktop**. It performs the following steps:
- Imports CSV files representing students, sessions, modules, and professors.
- Creates nodes for each entity and connects them through meaningful relationships to create a relevant structure.
- Enables analysis using Cypher queries.


---

### ✅ graph schema

The graph schema includes the following node types:
- `students` with properties like `id`, `name`, `email`
- `sessions` with `id`, `date`, `module`, `instructor`
- `attendance` with `student_id`, `session_id`

And these relationship types:
- `(:Student)-[:ATTENDED]->(:Session)`
- `(:Student)-[:ENROLLED_IN]->(:Module)`
- `(:Professor)-[:TAUGHT]->(:Session)`

The relationships model real-life academic interactions. This schema was chosen for its simplicity, clarity, and alignment with real-world logic.

---

### ✅ What are your Cypher and SQL queries solving?

- **Listing Sessions**: Retrieve all sessions attended by a specific student.
- **Top Students**: Identify the top students with the highest number of attended sessions.
- **Session Attendance**: Count the number of students who attended each session.
- **Module Attendance**: Determine the number of unique students who attended at least one session for each module.
- **Non-Attending Students**: Find students who have never attended any session.

These queries demonstrate common data analysis and helpanswer core questions about engagement, participation, and learning behavior.

---

### ✅ Assumptions, Challenges & Design Decisions

**Assumptions:**
- The data provided in the CSV files is clean, consistent, and accurately represents the entities and relationships in the graph model
- attendance is missing the time frame
- instructor is an attribute in session where I believe it should be in another seperate table same for module

**Challenges:**
- Neo4j Desktop requires manual placement of CSV files in the `/import` folder.

**Design Decisions:**
- Attendance was modeled as a `relationship` instead of a `node`, since it contains no additional data.

## 📂 Files
| File/Folder | Description |
|-------------|-------------|
| `cypher_queries.txt` | Contains all Cypher queries |
| `/images/neo4j diagram` | Graph design and import structure |
| `/images/neo4j preview` | Graph data visualization |
| `/images/answers to cypher queries challenge` | Screenshots of query outputs |

---

# 🧠 Bonus: Graph-to-SQL Conversion

## Overview

This section of the project focuses on translating a graph-based data model into an analogical relational schema and rewriting Cypher queries into SQL (PostgreSQL-compatible). The goal is to demonstrate how data and queries can be represented and executed in both graph and relational database contexts.

### ✅ data pipeline
this project involves two main tasks:

1. **Schema Translation**: Converting a graph schema, designed for a Neo4j graph database, into a relational schema suitable for a PostgreSQL relational database. This helps in understanding how the same data can be structured differently based on the database model.

2. **Query Translation**: Rewriting Cypher queries, which are used in Neo4j to traverse and query graph data, into SQL queries compatible with PostgreSQL. This illustrates how operations performed on graph data can be adapted for relational data.


### ✅ graph schema
student and session where two seperate table with an intermediate table attendance. 
I also added a table instructor with many to one relation with table session
table module with many to many relation with table student

### ✅ What are your Cypher and SQL queries solving?

- **Listing Sessions**: Retrieve all sessions attended by a specific student.
- **Top Students**: Identify the top students with the highest number of attended sessions.
- **Session Attendance**: Count the number of students who attended each session.
- **Module Attendance**: Determine the number of unique students who attended at least one session for each module.
- **Non-Attending Students**: Find students who have never attended any session.

These queries demonstrate common data analysis and helpanswer core questions about engagement, participation, and learning behavior.

### ✅ Assumptions, Challenges & Design Decisions

### Assumptions

- The data provided in the CSV files is clean, consistent, and accurately represents the entities and relationships in the graph model.

### Challenges

- **Schema Translation**: Translating a graph schema into a relational schema involves careful consideration of how relationships are represented, often requiring junction tables to maintain data integrity.

- **Query Translation**: Converting Cypher queries to SQL requires a deep understanding of both query languages and the ability to think in both graph and relational paradigms.

### Design Decisions

- **Junction Tables**: Used to represent many-to-many relationships in the relational schema, such as the `Attendance` table linking `Student` and `Session`.

- **Query Optimization**: SQL queries were designed to be efficient and leverage the strengths of relational databases, such as using `JOIN` operations to combine data from multiple tables.

## 📂 Files
| File/Folder | Description |
|-------------|-------------|
| `sql_querries.sql` | Contains all sql querries |
| `/images/UML class diagram` | uml class diagram |
| `/images/answers to sql queries` | Screenshots of query outputs |
