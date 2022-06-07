# 
#  Data: https://www.usaspending.gov/download_center/award_data_archive
#
SHELL = bash

%.parquet: %.csv
	echo "copy  (SELECT * from read_csv_auto('$*.csv', SAMPLE_SIZE=400000)) to '$*.parquet' (format 'parquet', codec 'ZSTD');" | duckdb

all: \
	FY2022_All_Contracts_Full_20220510_1.parquet \
	FY2022_All_Contracts_Full_20220510_2.parquet \
	FY2022_All_Contracts_Full_20220510_3.parquet 

FY2022_All_Contracts_Full_20220510_1.csv \
FY2022_All_Contracts_Full_20220510_2.csv \
FY2022_All_Contracts_Full_20220510_3.csv:
	curl https://files.usaspending.gov/award_data_archive/FY2022_All_Contracts_Full_20220510.zip -o full_contracts.zip
	unzip full_contracts.zip