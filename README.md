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

**Data Dictionary:**
For a detailed understanding of the data, including the meaning of each column, refer to the provided data dictionary. The data dictionary is available in this [GitHub link](https://github.com/arya0042/Movie-Database-SQL-Azure/blob/main/raw_movie_data_dict). It provides a comprehensive guide to interpreting the information stored in the 'all_movie_data_copy.csv' and 'all_movie_data_copy.xlsx' files.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<img width="358" alt="SQl Databse Azure" src="https://github.com/arya0042/Movie-Database-SQL-Azure/assets/43891695/b441323b-f3a0-4cc2-affa-83cc1468852d">
