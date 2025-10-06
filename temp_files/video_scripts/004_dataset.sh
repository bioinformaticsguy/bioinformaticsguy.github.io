# Losson 04 Navigating the dataset.

# This script demonstrates how to navigate and manage datasets in a machine learning project.

# Downlaoding the dataset
# The data can be downloaded by running the following command in your terminal:

git clone https://github.com/bioinformaticsguy/bash_essentials_for_bioinformatics/tree/main

cd data_for_bash_essentials


# once you have the data you can see that there are simple text files as well as some tsv files as well as the compressed files (.gz) files. Also there are fastq files as well ending at fastq.gz.

## FastQ files

# FastQ files are text files that contain biological sequence data (usually nucleotide sequences) along with their corresponding quality scores. Each sequence entry in a FastQ file consists of four lines:

# FastQ files are commonly used in bioinformatics for storing and sharing high-throughput sequencing data. They are essential for various analyses, including sequence alignment, variant calling, and quality control of sequencing data.

# 1. Sequence Identifier: This line starts with the "@" symbol and contains a unique identifier for the sequence.
# 2. Nucleotide Sequence: This line contains the actual nucleotide sequence (A, T, C, G for DNA; A, U, C, G for RNA).
# 3. Separator Line: This line starts with the "+" symbol and may optionally contain the same identifier as the first line.
# 4. Quality Scores: This line contains a series of characters that represent the quality scores for each nucleotide in the sequence. The quality scores are typically encoded using ASCII characters.

# FastQ files are commonly used in bioinformatics for storing and sharing high-throughput sequencing data. They are essential for various analyses, including sequence alignment, variant calling, and quality control of sequencing data.


# TSV Files
# TSV (Tab-Separated Values) files are plain text files that store data in a tabular format, where each row represents a record and each column is separated by a tab character. TSV files are similar to CSV (Comma-Separated Values) files, but they use tabs as delimiters instead of commas.
# TSV files are commonly used for storing and exchanging data in a structured format, making them easy to read and process using various programming languages and software tools. They are often used in bioinformatics, data analysis, and other fields where tabular data needs to be represented in a simple and human-readable format.


# In the next lesson we will learn how to navigate through the dataset and explore the files.

