# Movie-Database-SQL-Azure
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Company (aka. me) Description:**
The company, operating for personal use, delves into the entertainment industry, aiming to collect data on 6000 movies via The Movie Database (TMDb) API. Essential data points include ratings, release years, average scores, genres, with sorting capabilities.

**Requirements:**
1. **Data Collection:** Utilize TMDb API for 6000 movies.
2. **Ratings:** Retrieve and display movie ratings.
3. **Release Years:** Analyze movie distribution across release years.
4. **Average Scores:** Calculate and showcase average scores.
5. **Genres:** Categorize movies into genres.
6. **Sorting:** Implement sorting based on ratings, release years, average scores, and genres.

**Missing Requirements:**
1. **Authentication:** Ensure secure access to TMDb API.
2. **Storage:** Define a storage mechanism for collected data.
3. **Update Frequency:** Specify data update intervals.
4. **Scalability:** Consider scalability for future expansion.

**Solution:**
1. **Data Handling:**
   - Use TMDb API securely for movie data.
   - Implement authentication and authorization.

2. **Presentation:**
   - Display movie ratings and provide sorting options.
   - Analyze and visualize movie distribution across release years.

3. **Analysis:**
   - Calculate and present average scores.
   - Categorize movies into genres.

4. **User Interaction:**
   - Enable sorting based on various criteria.

5. **Infrastructure:**
   - Establish secure data storage.
   - Define regular update schedules.
   - Consider scalability for future growth.

**Risk Assessment:**
This project, designed for personal use, carries minimal associated risks, given its non-commercial nature. The absence of external user access reduces potential security concerns. However, it is crucial to ensure TMDb API usage compliance and data protection protocols.

By addressing these points, the company can create a streamlined solution for comprehensive movie information retrieval and analysis, tailored for personal use with minimal associated risks.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Data Acquisition Process:**
The data acquisition process involves utilizing The Movie Database (TMDb) API to gather information about popular movies. The Python script utilizes the `requests` library to make API calls, retrieving data from different pages. The base URL is set to "https://api.themoviedb.org/3/movie/popular?language=en-US&page=" with an API key included in the headers for authorization.

```python
# Set the base URL and headers
base_url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page="
headers = {
    "accept": "application/json",
    "Authorization": "Bearer <your_api_key>"
}
```

The script then loops through pages 1 to 300, making a request for each page, and appends the retrieved data to the `all_data` list. The collected data is stored in a Pandas DataFrame for further analysis.

**Data Storage:**
The combined data is converted into a DataFrame (`df`) and saved in two different formats - CSV and Excel. The CSV file is named 'all_movie_data_copy.csv', and the Excel file is named 'all_movie_data_copy.xlsx'. These files serve as local storage for the acquired movie data.

```python
# Convert the combined data to a DataFrame
df = pd.DataFrame(all_data)

# Save the DataFrame to a CSV file
df.to_csv('all_movie_data_copy.csv', index=False)

# Save the DataFrame to an Excel file
df.to_excel('all_movie_data_copy.xlsx', index=False)
```

As of December 4, 2023, the datasets for the Movie Analysis project are securely stored in Microsoft Azure Storage Blob. The project involves various CSV files, each contributing essential information for analysis. The Azure Storage account 'aryanstorage2' serves as the designated repository, utilizing the 'storageprivate' container to organize and manage the data.

To facilitate the upload process, a Python script utilizing the Azure SDK for Python has been employed. This script uploads CSV files to the Azure Storage Blob, ensuring that the data is efficiently stored and ready for analysis. Below is a summary of the uploaded files:

1. `genre_id.csv`: Represents the genre information.
2. `main_title_data.csv`: Contains data related to main movie titles.
3. `date_id.csv`: Provides date-related information.
4. `popularity_id.csv`: Captures popularity metrics.
5. `language_id.csv`: Includes language-related data.
6. `raw_movie_data.csv`: Houses the raw movie data for comprehensive analysis.
7. `language_raw.csv`: Stores raw language data.

These files are integral to the analysis, and their secure storage in Azure Storage Blob ensures both scalability and data security. To access a visual overview of the stored data, one can explore the 'storageprivate' container within the 'aryanstorage2' Azure Storage account. Images representing the contents can be found on the project's GitHub repository.

For a detailed understanding of the datasets, the project includes data dictionaries for each CSV file: 'genre_id.csv', 'main_title_data.csv', 'date_id.csv', 'popularity_id.csv', 'language_id.csv', 'raw_movie_data.csv', and 'language_raw.csv'. These dictionaries provide valuable references, offering insights into the structure and meaning of the data.

The Azure Storage Blob infrastructure, combined with the seamless upload script, establishes a robust foundation for ongoing exploration and analysis of the Movie dataset, providing transparency and accessibility to the entire project team.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<img width="358" alt="SQl Databse Azure" src="https://github.com/arya0042/Movie-Database-SQL-Azure/assets/43891695/b441323b-f3a0-4cc2-affa-83cc1468852d">
In the process of modeling the data warehouse for the Movie analysis project, I utilized a combination of Microsoft Access for visualization and Microsoft SQL Server Management Studio (SSMS) for creating the actual database.

<img width="438" alt="Screenshot 2023-12-04 134201" src="https://github.com/arya0042/Movie-Database-SQL-Azure/assets/43891695/e30b579e-bb4d-42b0-b837-b542a92b7610">


1. **Defining Language Table:**
   ```sql
   CREATE TABLE language (
       iso_639_1 VARCHAR(2),
       english_name VARCHAR(255),
       language_id INT PRIMARY KEY
   );
   ```
   This block of code creates a table named `language` with columns for language ISO code (`iso_639_1`), English name (`english_name`), and a surrogate key (`language_id`). The primary key constraint is applied to the `language_id` column.

2. **Defining Popularity Table:**
   ```sql
   CREATE TABLE popularity (
       vote_average DECIMAL(5, 3),
       popularity DECIMAL(10, 3),
       vote_count INT,
       popularity_id INT PRIMARY KEY
   );
   ```
   This block of code creates a table named `popularity` with columns for vote average (`vote_average`), popularity, and vote count, along with a surrogate key (`popularity_id`). The primary key constraint is applied to the `popularity_id` column.

3. **Defining Release Date Table:**
   ```sql
   CREATE TABLE release_date (
       release_date DATE,
       date_id INT PRIMARY KEY
   );
   ```
   This block of code creates a table named `release_date` with columns for release date (`release_date`) and a surrogate key (`date_id`). The primary key constraint is applied to the `date_id` column.

4. **Defining Genres Table:**
   ```sql
   CREATE TABLE genres (
       genre_id INT PRIMARY KEY,
       name VARCHAR(255)
   );
   ```
   This block of code creates a table named `genres` with columns for genre ID and name, along with a surrogate key (`genre_id`). The primary key constraint is applied to the `genre_id` column.

5. **Defining Main Title Data Table:**
   ```sql
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
   ```
   This block of code creates a table named `main_title_data` with columns for ID, title, and foreign keys referencing the previously defined tables (genres, language, release_date, popularity). This establishes relationships between the tables using foreign key constraints.

These snippets collectively define the tables for a data warehouse, including their columns, data types, and relationships. This forms the foundation for the data model of the data warehouse.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Data Cleaning and Transformation**
Section 1: Importing Libraries
```python
import pandas as pd
import ast
from datetime import datetime
```
This section imports three Python libraries:
- `pandas` is used for data manipulation and analysis.
- `ast` is used for safely evaluating literal expressions in strings, which is later used in the `extract_first_number` function.
- `datetime` is imported from the datetime module for working with dates and times.

Section 2: Loading and Preprocessing Data
```python
csv_file_path = 'all_movie_data_copy.csv'
df = pd.read_csv(csv_file_path)

columns_to_drop = ['backdrop_path', 'poster_path', 'original_title', 'video', 'adult', 'overview']
df = df.drop(columns=columns_to_drop, errors='ignore')
```
This section loads a CSV file ('all_movie_data_copy.csv') into a Pandas DataFrame (`df`). It then drops specific columns (`columns_to_drop`) from the DataFrame.

Section 3: Data Transformation and Cleaning
```python
def extract_first_number(x):
    try:
        x_list = ast.literal_eval(x)
        return int(x_list[0]) if isinstance(x_list, list) and len(x_list) > 0 else None
    except (SyntaxError, ValueError):
        return None

df['genre_ids'] = df['genre_ids'].apply(extract_first_number)
df = df.drop_duplicates(subset=['id'])
```
This section defines a function (`extract_first_number`) to extract the first number from a list literal expression safely. It then applies this function to the 'genre_ids' column in the DataFrame, drops duplicate rows based on the 'id' column, and modifies the DataFrame accordingly.

Section 4: Date Conversion, Filtering, and Sorting
```python
df['release_date'] = pd.to_datetime(df['release_date'], errors='coerce')

cutoff_date = datetime(2023, 12, 4)
df = df[df['release_date'].notna() & (df['release_date'] <= cutoff_date)]
df = df.sort_values(by='release_date')
df = df.dropna()
```
This section converts the 'release_date' column to datetime format. It then filters rows based on the release date (up to the cutoff date), sorts the DataFrame by 'release_date', and drops any remaining rows with missing values.

Section 5: Making API Request and Processing JSON Data
```python
import requests

url = "https://api.themoviedb.org/3/configuration/languages"

headers = {
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDhhMmIwNzk4NTRiNjc4YzNkZGY2OTAwYjIwMWVmZCIsInN1YiI6IjY1NmQyM2RmMDg1OWI0MDEzOTUyMThjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.klFZxQuVifDTMV49eF9QvbqwceS_zoRQKPRJb1FVeeE"
}

response = requests.get(url, headers=headers)

data = response.json()
```
In this section, the code makes an HTTP GET request to the specified URL using the `requests` library with the provided headers. The response is stored in the `data` variable after parsing it as JSON.

Section 6: Data Processing and DataFrame Creation
```python
import pandas as pd

# Convert the JSON data into a DataFrame
df_language = pd.DataFrame(data)
df_language.to_csv('df_language_raw.csv', index=False)

df_language['name_id'] = range(1, len(df_language) + 1)
df_language = df_language.drop(columns='name')

print(df_language)

df_language.to_csv('df_language.csv', index=False)
```
This section converts the JSON data obtained from the API response into a Pandas DataFrame (`df_language`). The raw DataFrame is saved to a CSV file ('df_language_raw.csv'). It then adds a new column 'name_id' with sequential values and drops the 'name' column. Finally, the resulting DataFrame is printed and saved to another CSV file ('df_language.csv') without an index column.


Section 7: Merging DataFrames, Cleaning, and Displaying Results
```python
import pandas as pd

# Assuming 'df' and 'df_language' are your DataFrames
df_merged = pd.merge(df, df_language, left_on='original_language', right_on='iso_639_1', how='left')

# Drop duplicates based on the 'id' column
df_merged = df_merged.drop_duplicates(subset=['id'])

# Drop the redundant columns and rearrange the DataFrame
df_merged = df_merged.drop(columns=['original_language', 'iso_639_1', 'english_name'])
df_merged = df_merged.rename(columns={'name_id': 'original_language'})

df = df_merged
print(df)

date_counts = df['release_date'].value_counts()
print("\nDate Counts:")
print(date_counts)
```

This section of code performs the following operations:
1. DataFrame Merging: It merges two DataFrames, `df` and `df_language`, based on the 'original_language' column in `df` and 'iso_639_1' column in `df_language`. The merging is done using a left join (`how='left'`).

2. Drop Duplicates: It drops duplicate rows from the merged DataFrame based on the 'id' column.

3. Column Cleanup and Renaming: It drops redundant columns ('original_language', 'iso_639_1', 'english_name') and renames the 'name_id' column to 'original_language'.

4. Display Results: It prints the resulting merged and cleaned DataFrame (`df`) and also prints the counts of unique values in the 'release_date' column (`date_counts`).
