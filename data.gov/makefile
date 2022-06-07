all: auto_recalls.csv lien_filings.csv sf_political_contributions.csv sf_restaurant_health_violations.csv sf_find_neighborhoods.csv

auto_recalls.csv:
	curl https://data.transportation.gov/api/views/6axg-epim/rows.csv -o auto_recalls.csv

lien_filings.csv:
	curl https://data.ct.gov/api/views/xfev-8smz/rows.csv -o lien_filings.csv

sf_political_contributions.csv:
	curl https://data.sfgov.org/api/views/aghq-vgvd/rows.csv? -o sf_political_contributions.csv

sf_restaurant_health_violations.csv:
	curl https://data.sfgov.org/api/views/pyih-qa8i/rows.csv? -o sf_restaurant_health_violations.csv

sf_311_cases.csv:
	curl https://data.sfgov.org/api/views/vw6y-z8j6/rows.csv? -o sf_311_cases.csv

sf_find_neighborhoods.csv:
	curl https://data.sfgov.org/api/views/6ia5-2f8k/rows.csv? -o sf_find_neighborhoods.csv
