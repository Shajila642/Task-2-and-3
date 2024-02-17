#!/bin/bash

# Download the compressed FASTA file
wget https://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa

# Count the number of sequences
num_sequences=$(grep -c '^>' NC_000913.faa)

# Count the total number of amino acids
total_aa=$(grep -v '^>' NC_000913.faa | tr -d '\n' | wc -c)

# Calculate the average length of proteins
average_length=$(echo "scale=2; $total_aa / $num_sequences" | bc)

# Print the result
echo "Average length of proteins: $average_length"

# Clean up
rm NC_000913.faa

