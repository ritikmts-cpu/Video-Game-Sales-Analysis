CREATE DATABASE video_game_db;

USE video_game_db;

CREATE TABLE clean_merged_games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    release_date VARCHAR(50),
    team TEXT,
    rating FLOAT,
    times_listed INT,
    number_of_reviews INT,
    genres TEXT,
    summary TEXT,
    reviews TEXT,
    plays INT,
    playing INT,
    backlogs INT,
    wishlist INT,
    rank_no INT,
    name VARCHAR(255),
    platform VARCHAR(50),
    year INT,
    genre VARCHAR(50),
    publisher VARCHAR(100),
    na_sales FLOAT,
    eu_sales FLOAT,
    jp_sales FLOAT,
    other_sales FLOAT,
    global_sales FLOAT
);

USE video_game_db;
CREATE TABLE games_clean (
    unnamed_0 INT PRIMARY KEY,
    title VARCHAR(255),
    release_date VARCHAR(50),
    team TEXT,
    rating FLOAT,
    times_listed INT,
    number_of_reviews INT,
    genres TEXT,
    summary TEXT,
    reviews TEXT,
    plays INT,
    playing INT,
    backlogs INT,
    wishlist INT,
    clean_title VARCHAR(255)
);



-- 2) sales_clean table
CREATE TABLE sales_clean (
    rank_no INT PRIMARY KEY,
    name VARCHAR(255),
    platform VARCHAR(50),
    year INT,
    genre VARCHAR(50),
    publisher VARCHAR(100),
    na_sales FLOAT,
    eu_sales FLOAT,
    jp_sales FLOAT,
    other_sales FLOAT,
    global_sales FLOAT,
    clean_title VARCHAR(255)
);

SELECT COUNT(*) FROM games_clean;
SELECT COUNT(*) FROM sales_clean;


