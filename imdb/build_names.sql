copy (
  SELECT 
    *
  FROM read_csv_auto('name.basics.tsv.gz', delim='\t', quote='',header=True, all_varchar=true) as names
) to 'names.parquet' (FORMAT 'parquet', CODEC 'ZSTD') 