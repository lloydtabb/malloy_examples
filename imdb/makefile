
SHELL = bash

all: principals.parquet titles.parquet names.parquet

# Rule to download the files
%.gz:
	if [ -x "$(command -v wget)" ]; then wget https://datasets.imdbws.com/$@; else curl https://datasets.imdbws.com/$@ -o $@; fi

principals.parquet: title.principals.tsv.gz
	duckdb < build_principals.sql

titles.parquet: title.crew.tsv.gz title.ratings.tsv.gz title.basics.tsv.gz

	duckdb < build_titles.sql

names.parquet: name.basics.tsv.gz
	duckdb < build_names.sql

clean:
	rm -f title.principals.tsv.gz title.crew.tsv.gz title.ratings.tsv.gz title.basics.tsv.gz name.basics.tsv.gz names.parquet titles.parquet principals.parquet