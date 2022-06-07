all: auto_recalls.csv lien_filings.csv

auto_recalls.csv:
	curl https://data.transportation.gov/api/views/6axg-epim/rows.csv -o auto_recalls.csv

lien_filings.csv:
	curl https://data.ct.gov/api/views/xfev-8smz/rows.csv -o lien_filings.csv

sf_political_contributions.csv:
	curl https://data.sfgov.org/api/views/aghq-vgvd/rows.csv? -o sf_political_contributions.csv