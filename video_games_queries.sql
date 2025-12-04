{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ff81201e-1b68-4e1a-a3a5-89e1a1c9209f",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Tables created: games_clean, sales_clean, games_sales_merged_final in video_games.db\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "from sqlalchemy import create_engine\n",
    "\n",
    "# 1) Load cleaned CSVs with full paths\n",
    "games_path   = r\"C:\\Users\\ritik\\Desktop\\Video_Game_Project\\games_clean_final.csv\"\n",
    "sales_path   = r\"C:\\Users\\ritik\\Desktop\\Video_Game_Project\\sales_clean_final.csv\"\n",
    "merged_path  = r\"C:\\Users\\ritik\\Desktop\\Video_Game_Project\\games_sales_merged_final.csv\"\n",
    "\n",
    "games  = pd.read_csv(games_path)\n",
    "sales  = pd.read_csv(sales_path)\n",
    "merged = pd.read_csv(merged_path)\n",
    "\n",
    "# 2) SQLite database file banalo (same folder me banega jahan notebook/chal raha code hai)\n",
    "engine = create_engine(\"sqlite:///video_games.db\", echo=False)\n",
    "\n",
    "# 3) Tables push karo\n",
    "games.to_sql(\"games_clean\", engine, if_exists=\"replace\", index=False)\n",
    "sales.to_sql(\"sales_clean\", engine, if_exists=\"replace\", index=False)\n",
    "merged.to_sql(\"games_sales_merged_final\", engine, if_exists=\"replace\", index=False)\n",
    "\n",
    "print(\"Tables created: games_clean, sales_clean, games_sales_merged_final in video_games.db\")\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "83be26c9-6c33-48d2-b784-ca44fc530da7",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "                     Publisher  total_sales\n",
      "0                     Nintendo      1784.43\n",
      "1              Electronic Arts      1093.39\n",
      "2                   Activision       721.41\n",
      "3  Sony Computer Entertainment       607.28\n",
      "4                      Ubisoft       473.54\n"
     ]
    }
   ],
   "source": [
    "query = \"\"\"\n",
    "SELECT Publisher, SUM(Global_Sales) AS total_sales\n",
    "FROM sales_clean\n",
    "GROUP BY Publisher\n",
    "ORDER BY total_sales DESC\n",
    "LIMIT 5;\n",
    "\"\"\"\n",
    "\n",
    "df_test = pd.read_sql_query(query, engine)\n",
    "print(df_test)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "6296c66d-554f-41a8-9c83-d8d0a0057ed3",
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "\n",
    "def run_query(q):\n",
    "    return pd.read_sql_query(q, engine)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "913e184c-3892-4e64-a66f-eb0acd44a195",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Defaulting to user installation because normal site-packages is not writeable\n",
      "Collecting pymysql\n",
      "  Downloading pymysql-1.1.2-py3-none-any.whl.metadata (4.3 kB)\n",
      "Downloading pymysql-1.1.2-py3-none-any.whl (45 kB)\n",
      "   ---------------------------------------- 0.0/45.3 kB ? eta -:--:--\n",
      "   ------------------------------------ --- 41.0/45.3 kB 2.0 MB/s eta 0:00:01\n",
      "   ---------------------------------------- 45.3/45.3 kB 377.0 kB/s eta 0:00:00\n",
      "Installing collected packages: pymysql\n",
      "Successfully installed pymysql-1.1.2\n"
     ]
    }
   ],
   "source": [
    "pip install pymysql"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "9bf8909e-f333-4a98-88ac-8a34a44b108c",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "MySQL tables created successfully.\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "from sqlalchemy import create_engine\n",
    "\n",
    "games_path   = r\"C:\\Users\\ritik\\Desktop\\Video_Game_Project\\games_clean_final.csv\"\n",
    "sales_path   = r\"C:\\Users\\ritik\\Desktop\\Video_Game_Project\\sales_clean_final.csv\"\n",
    "merged_path  = r\"C:\\Users\\ritik\\Desktop\\Video_Game_Project\\games_sales_merged_final.csv\"\n",
    "\n",
    "games  = pd.read_csv(games_path)\n",
    "sales  = pd.read_csv(sales_path)\n",
    "merged = pd.read_csv(merged_path)\n",
    "\n",
    "user = \"root\"              # apna MySQL user\n",
    "password = \"ritik123\" # apna password\n",
    "host = \"localhost\"\n",
    "port = \"3306\"\n",
    "db_name = \"video_game_db\"\n",
    "\n",
    "engine = create_engine(f\"mysql+pymysql://{user}:{password}@{host}:{port}/{db_name}\")\n",
    "\n",
    "games.to_sql(\"games_clean\", engine, if_exists=\"replace\", index=False)\n",
    "sales.to_sql(\"sales_clean\", engine, if_exists=\"replace\", index=False)\n",
    "merged.to_sql(\"games_sales_merged_final\", engine, if_exists=\"replace\", index=False)\n",
    "\n",
    "print(\"MySQL tables created successfully.\")\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "58938af7-df09-4fc8-88aa-29ef13acdd0d",
   "metadata": {},
   "outputs": [],
   "source": [
    "USE video_game_db;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 1) Top 10 best-selling games globally\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Name,\n",
    "    SUM(Global_Sales) AS total_sales\n",
    "FROM sales_clean\n",
    "GROUP BY Name\n",
    "ORDER BY total_sales DESC\n",
    "LIMIT 10;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 2) Global sales by platform (descending)\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Platform,\n",
    "    SUM(Global_Sales) AS total_sales\n",
    "FROM sales_clean\n",
    "GROUP BY Platform\n",
    "ORDER BY total_sales DESC;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 3) Regional sales by genre\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Genre,\n",
    "    SUM(NA_Sales)    AS na_sales,\n",
    "    SUM(EU_Sales)    AS eu_sales,\n",
    "    SUM(JP_Sales)    AS jp_sales,\n",
    "    SUM(Other_Sales) AS other_sales\n",
    "FROM sales_clean\n",
    "GROUP BY Genre\n",
    "ORDER BY na_sales DESC;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 4) Top 5 best-selling games per platform\n",
    "--    (ROW_NUMBER window function)\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Platform,\n",
    "    Name,\n",
    "    Global_Sales,\n",
    "    rn\n",
    "FROM (\n",
    "    SELECT\n",
    "        Platform,\n",
    "        Name,\n",
    "        Global_Sales,\n",
    "        ROW_NUMBER() OVER (\n",
    "            PARTITION BY Platform \n",
    "            ORDER BY Global_Sales DESC\n",
    "        ) AS rn\n",
    "    FROM sales_clean\n",
    ") AS t\n",
    "WHERE rn <= 5\n",
    "ORDER BY Platform, rn;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 5) Top 10 publishers by total global sales\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Publisher,\n",
    "    SUM(Global_Sales) AS total_sales\n",
    "FROM sales_clean\n",
    "GROUP BY Publisher\n",
    "ORDER BY total_sales DESC\n",
    "LIMIT 10;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 6) Yearly global sales trend\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    YEAR(Year) AS year,\n",
    "    SUM(Global_Sales) AS total_sales\n",
    "FROM sales_clean\n",
    "GROUP BY YEAR(Year)\n",
    "ORDER BY year;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 7) Regional sales per year\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    YEAR(Year) AS year,\n",
    "    SUM(NA_Sales)    AS na_sales,\n",
    "    SUM(EU_Sales)    AS eu_sales,\n",
    "    SUM(JP_Sales)    AS jp_sales,\n",
    "    SUM(Other_Sales) AS other_sales\n",
    "FROM sales_clean\n",
    "GROUP BY YEAR(Year)\n",
    "ORDER BY year;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 8) Average rating per genre (games_clean)\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Genres,\n",
    "    AVG(Rating) AS avg_rating,\n",
    "    COUNT(*)    AS num_games\n",
    "FROM games_clean\n",
    "GROUP BY Genres\n",
    "ORDER BY avg_rating DESC;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 9) Most productive studios (number of games)\n",
    "--------------------------------------------------\n",
    "SELECT \n",
    "    Team,\n",
    "    COUNT(*) AS number_of_games\n",
    "FROM games_clean\n",
    "GROUP BY Team\n",
    "ORDER BY number_of_games DESC\n",
    "LIMIT 10;\n",
    "\n",
    "--------------------------------------------------\n",
    "-- 10) Top-performing Genre + Platform combos by global sales\n",
    "--      (using merged table if you want engagement + sales together)\n",
    "--------------------------------------------------\n",
    "SELECT\n",
    "    Genre,\n",
    "    Platform,\n",
    "    SUM(Global_Sales) AS total_sales\n",
    "FROM games_sales_merged_final\n",
    "GROUP BY Genre, Platform\n",
    "ORDER BY total_sales DESC\n",
    "LIMIT 10;\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7c53d264-f231-4f29-b33a-1de423d797a4",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "b9c7fc64-7197-487b-8de6-41b1142d6a61",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "728034aa-3c2b-4869-8c6f-7c42586f3333",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ab67db51-9f47-427f-8f37-d15e7110e2a7",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.12.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
