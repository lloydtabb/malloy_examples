# About the IMDb Dataset

IMDb makes data available for download via [their website](https://www.imdb.com/interfaces/). These are available as TSV files, so we'll transform them into parquet format and access them with DuckDB.  

One metric used repeatedly in this model is `ratings.numVotes`, the number of votes the title has received. Where `ratings.averageRating` of course indicates how much people _liked_ a movie, `numVotes` is a better proxy for overall popularity of a title. 

## Required Tools
  * [Malloy VS Code Extension](https://marketplace.visualstudio.com/items?itemName=malloydata.malloy-vscode)
  * [wget](https://www.gnu.org/software/wget/) or [curl](https://curl.se/download.html) - to fetch the data from the server
  * [duckdb ](https://duckdb.org/docs/installation/index) CLI - to convert the data to parquet files. _Note: Don't use the Homebrew build as it does not have the parquet extension built in._

## Setup
1. Run `make` to download and prepare the data.
2. Open VSCode, search the Extensions Marketplace for 'Malloy', and install the Malloy Extension.
3. Open any of the Malloy files and hit 'run' above any of the queries.

## Model Notes
The `movies` source filters only to films with > 10,000 ratings.


## Preview


**People**


| nconst    | primaryName     | birthYear | deathYear | primaryProfession                   | knownForTitles                          |
|-----------|-----------------|-----------|-----------|-------------------------------------|-----------------------------------------|
| nm0000001 | Fred Astaire    | 1899      | 1987      | soundtrack,actor,miscellaneous      | tt0031983,tt0053137,tt0072308,tt0050419 |
| nm0000002 | Lauren Bacall   | 1924      | 2014      | actress,soundtrack                  | tt0117057,tt0038355,tt0037382,tt0071877 |
| nm0000003 | Brigitte Bardot | 1934      | \N        | actress,soundtrack,music_department | tt0049189,tt0056404,tt0057345,tt0054452 |
| nm0000004 | John Belushi    | 1949      | 1982      | actor,soundtrack,writer             | tt0077975,tt0078723,tt0080455,tt0072562 |
| nm0000005 | Ingmar Bergman  | 1918      | 2007      | writer,director,actor               | tt0050976,tt0060827,tt0050986,tt0083922 |

**Movies**

| tconst    | isAdult | originalTitle                                    | primaryTitle            | startYear | endYear | runtimeMinutes |
|-----------|---------|--------------------------------------------------|-------------------------|----------:|--------:|---------------:|
| tt0000012 | 0       | L'arrivée d'un train à La Ciotat                 | The Arrival of a Train  |     1,896 |       ∅ |              1 |
| tt0000439 | 0       | The Great Train Robbery                          | The Great Train Robbery |     1,903 |       ∅ |             11 |
| tt0000417 | 0       | Le voyage dans la lune                           | A Trip to the Moon      |     1,902 |       ∅ |             13 |
| tt0004972 | 0       | The Birth of a Nation                            | The Birth of a Nation   |     1,915 |       ∅ |            195 |
| tt0006864 | 0       | Intolerance: Love's Struggle Throughout the Ages | Intolerance             |     1,916 |       ∅ |            163 |


**Principals**

A mapping table between people and titles, principals shows the principal cast/crew for titles 

| tconst    | ordering | nconst    | category        | job                     |   |
|-----------|---------:|-----------|-----------------|-------------------------|:-:|
| tt0000001 |        1 | nm1588970 | self            | \N                      |   |
| tt0000001 |        2 | nm0005690 | director        | \N                      |   |
| tt0000001 |        3 | nm0374658 | cinematographer | director of photography |   |
| tt0000002 |        1 | nm0721526 | director        | \N                      |   |
| tt0000002 |        2 | nm1335271 | composer        | \N                      |   |
 

## Queries in `imdb.malloy`

**by_title** - title, start year, and number of ratings received, ordered by number of ratings.

**by_year** - the number of titles produced per year

**by_name** - for each person, the overall number of ratings on titles they were in, and the count of titles.

**by_job_category** - job category by number of titles

**by_genre** - for each genre, the count of titles, and percent of all titles that are this genre. Note that a film may have multiple genres.

**by_character** - number of titles for each character name

**by_year_and_genre** - for each year, the number of titles plus `by_genre` nested to show the breakdown by genre.

## About Additional Analyses

**movie_queries.malloy**: a collection of interested queries against the base `imdb.malloy` model.

**movie_filters.malloy**: a set of queries intended to filter other queries (see **movie_dashboard.malloy**)--each produces the unique identifiers (`tconst`) of movies to be used in the filter.

**movie_dashboard.malloy**: the `movies_plus` source adds an image and url link to the base model, then defines a `titles_dashboard` query which can be filtered as desired. For example, `spielberg_dashboard` uses a filtered query from `movie_filters.malloy` to pull back information on all Spielberg movies. 

**movie_complex.malloy**: an aptly named collection of more complex queries building on definitions in the above files. 

