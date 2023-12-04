CREATE TABLE language (
    iso_639_1 VARCHAR(2),
    english_name VARCHAR(255),
    language_id INT PRIMARY KEY
);

CREATE TABLE popularity (
    vote_average DECIMAL(5, 3),
    popularity DECIMAL(10, 3),
    vote_count INT,
    popularity_id INT PRIMARY KEY
);

CREATE TABLE release_date (
    release_date DATE,
    date_id INT PRIMARY KEY
);

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE main_title_data (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    genre_id INT,
    language_id INT,
    date_id INT,
    popularity_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
    FOREIGN KEY (language_id) REFERENCES language(language_id),
    FOREIGN KEY (date_id) REFERENCES release_date(date_id),
    FOREIGN KEY (popularity_id) REFERENCES popularity(popularity_id)
);
