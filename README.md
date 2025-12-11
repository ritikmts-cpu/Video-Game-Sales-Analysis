# 🎮 Video Game Sales & Engagement Analysis

A clean and simple data analysis project exploring video game ratings, sales, genres, platforms, and user engagement using Python, SQL, and Power BI.

# 📌 Project Overview

This project uses two datasets:

games.csv → Ratings, genres, plays, wishlists

vgsales.csv → Regional + global sales

Goal:
✔ Clean both datasets
✔ Merge them
✔ Perform EDA (30 questions)
✔ Load to MySQL
✔ Build Power BI dashboard

# 🔧 Tech Used

Python (Pandas, Matplotlib, Seaborn)

MySQL

Power BI

Jupyter Notebook

GitHub

# 📂 Folder Structure
Video_Game_Analysis/
│
├── data/
│   ├── games_clean.csv
│   ├── sales_clean.csv
│   └── clean_merged_games.csv
│
├── notebooks/
│   └── video_game_analysis.ipynb
│
├── sql/
│   └── video_games_db.sql
│
├── PowerBi_Reports/
│   └── Video Game Sales Analysis.pptx
│
└── README.md

# 🧹 Data Cleaning Summary

Removed duplicates

Handled missing values (Rating, Team, Year, Publisher)

Converted “K” → 1000 values

Cleaned list-string columns

Standardized titles for merging

Exported clean datasets

# 📊 Analysis Highlights

Using Python, I answered 30 EDA questions, including:

⭐ Top-rated games

🧩 Most popular genres

🏆 Best-selling platforms

🌍 Region-wise sales

🎯 Rating vs Sales relationship

📈 Sales + Release Year trends

🕹 High engagement vs low sales genres

Charts were created for every question.

# 📊 Power BI Dashboard

The dashboard includes:

Global & regional sales

Genre & platform performance

Top publishers

Wishlist/Backlog insights

Ratings distribution

KPI Cards + Filters

# 🗄 SQL Work

Created tables for cleaned datasets

Inserted merged data

Performed joins, grouping, filtering

Wrote analysis queries (Top N, Aggregations)

# 🚀 Run the Project

1️⃣ Install requirements

pip install -r requirements.txt


2️⃣ Run Notebook

video_game_analysis.ipynb


3️⃣ Import SQL file into MySQL

4️⃣ Open Power BI dashboard

# 👨‍💻 Created By

# Ritik Kumar
