# About the Names Dataset

This dataset a lightly transformed version of the U.S. Social Security Administration [Names Dataset](https://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-data). Notes on the background and limitations of this dataset can be found [here](https://www.ssa.gov/oact/babynames/background.html).

## Preview

| state | gender |  year | name     | number |
|-------|--------|------:|----------|-------:|
| AK    | F      | 1,910 | Mary     |     14 |
| AK    | F      | 1,910 | Annie    |     12 |
| AK    | F      | 1,910 | Anna     |     10 |
| AK    | F      | 1,910 | Margaret |      8 |
| AK    | F      | 1,910 | Helen    |      7 |
| AK    | F      | 1,910 | Elsie    |      6 |
| AK    | F      | 1,910 | Lucy     |      6 |
| AK    | F      | 1,910 | Dorothy  |      5 |
| AK    | F      | 1,911 | Mary     |     12 |
| AK    | F      | 1,911 | Margaret |      7 |


## Queries

**by_name** - top 10 names by population

**by_state** - population by state

**by_gender** - population by gender

**by_year** - population by year

**by_decade** - population by decade

**name_as_pct_of_pop** - name, population, and the percent each name makes up of the total population

**male_names** / **female_names** - top 10 names for M / F reported gender

**top_names_by_state_by_gender** - top 10 names in each state, for each gender

**name_dashboard** - for the top 10 names, shows `by_decade`, `by_state`, and `by_gender`

**j_names** - returns the name dashboard, filtered to 'J' names
