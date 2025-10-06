---
date: 2025-10-05 12:29:19
layout: post
title: The Power of Pipes
subtitle: How to Build Complex Data Processing Workflows from Simple Command-Line Tools
description: Learn how Unix pipes and filters let you chain together simple commands to create powerful data processing pipelines. This guide walks you through essential commands like wc, sort, and grep, showing you how to combine them efficiently without creating temporary files.


series: BASH Essentials for Bioinformatics
series_sing: true
video_number: 007
video_id: WbgC0m0fsQ8

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1759661560/003_BEB/coming_soon_psfezg.png


category: BASH Essentials
tags:
  - BASH
  - Essentials
  - Bioinformatics
  - Bash Scripting
  - HPC
  - Command Line Interface
  - Bash Commands
  - Mac
  - Windows
  - Linux
author: alihassan
paginate: true
---


[![Alt text](https://res.cloudinary.com/bioinformaticsguy/image/upload/v1759661560/003_BEB/coming_soon_psfezg.png)](https://www.youtube.com/c/BioinformaticsGuy)

---

The Unix philosophy is beautifully simple: create tools that do one thing well, then combine them to accomplish complex tasks. This approach, known as "pipes and filters," is one of the most powerful concepts you'll learn in command-line computing.

## The Building Blocks

Before we dive into combining commands, let's explore some fundamental tools that form the foundation of our pipelines.

### Counting with `wc`

The word count command is your go-to tool for getting quick statistics about text files. When you run `wc` on a file, it returns three numbers: lines, words, and characters.

```bash
wc tiny_n_L001_R1_xxx.fastq.gz
     166   940 45010 tiny_n_L001_R1_xxx.fastq.gz
```

This output tells us the file contains 166 lines, 940 words, and 45,010 characters. You can use flags to get specific counts:

- `wc -l` returns only line counts
- `wc -w` returns only word counts  
- `wc -c` returns only character counts

### Working with Wildcards

Wildcards are special characters that help you match multiple files at once:

- `*` matches zero or more characters (e.g., `*.fastq` matches all FASTQ files)
- `?` matches exactly one character (e.g., `file_R?.fastq` matches both `file_R1.fastq` and `file_R2.fastq`)

When the shell encounters a wildcard, it expands it into a list of matching filenames before executing your command. This makes batch processing incredibly efficient:

```bash
$ wc -l *.tsv
```

You will get the following output.

```bash
  2440 GSM2221119_liverEnhancer_all-labels.tsv
  2440 GSM2221119_liverEnhancer_all-labelsINV.tsv
  2440 labels.tsv
  7320 total
```

### Unzipping with `gunzip`

Compressed files need to be unzipped before processing. The `gunzip` command handles this elegantly, and it works great with wildcards:

```bash
gunzip tiny_n_L001_R1_xxx.fastq.gz  # Single file
gunzip *.gz                       # All compressed files
```

Please note that this will replace the compressed file. In order to have both files try this command:

```bash
gunzip -c tiny_n_L001_R1_xxx.fastq.gz > tiny_n_L001_R1_xxx.fastq
# OR use zcat (same as gunzip -c)
zcat tiny_n_L001_R1_xxx.fastq.gz > tiny_n_L001_R1_xxx.fastq
```

The `-c` flag tells `gunzip` to write to standard output instead of creating a file, and then we redirect that output (`>`) to create the uncompressed file while keeping the original `.gz` file intact.


### Recompressing Files with `gzip`

If you need to compress files back to save disk space, use the `gzip` command:

```bash
gzip tiny_n_L001_R1_xxx.fastq  # Compresses and replaces original
```

This will create `tiny_n_L001_R1_xxx.fastq.gz` and remove the uncompressed file. To keep both the original and compressed versions:

```bash
gzip -c tiny_n_L001_R1_xxx.fastq > tiny_n_L001_R1_xxx.fastq.gz
```

You can also compress multiple files at once:

```bash
gzip *.fastq  # Compresses all FASTQ files
```

**Pro tip:** Use `gzip -9` for maximum compression (slower) or `gzip -1` for faster compression (larger files):

```bash
gzip -9 large_file.fastq  # Best compression ratio
gzip -1 temp_file.fastq   # Fastest compression
```

### Sorting Data with `sort`

The `sort` command arranges lines of text in order. The `-n` flag is particularly useful because it sorts numerically rather than alphabetically:

```bash
$ sort -n lengths.txt
```

## Redirecting Output

The `>` operator redirects command output to a file instead of displaying it on screen. This is useful for saving results:

```bash
$ wc -l *.fastq > lengths.txt
```

You can then view the saved results using `head` or `cat`.

## The Magic of Pipes

Here's where things get interesting. Instead of creating intermediate files, you can connect commands directly using the pipe operator `|`. The pipe takes the output from one command and feeds it as input to the next.

Let's say you want to sort your file lengths and see only the top results. Without pipes, you'd need two steps:

```bash
$ sort -n lengths.txt > sorted-lengths.txt
$ head sorted-lengths.txt
```

With pipes, you can do this in one elegant line:

```bash
$ sort -n lengths.txt | head
```

You should be able to see the following on the terminal:

```bash
450 sample_01.fastq
780 sample_02.fastq
1250 sample_03.fastq
3200 sample_04.fastq
8920 sample_05.fastq
```

## Chaining Multiple Commands

The real power emerges when you chain multiple pipes together. Want to count lines in all your tsv files, sort them numerically, and display just the smallest file? Here's how:

```bash
$ wc -l *.tsv | sort -n | head -1
```

This single line:
1. Counts lines in all tsv files
2. Sorts the results numerically
3. Shows only the first (smallest) result

No temporary files. No multiple steps. Just pure, efficient data processing.

## Real-World Example: Finding Abundant Sequences

tiny_n_L001_R1_xxx.fastq.gz

```bash
$ zcat sample_reads.fastq.gz | head -48 | grep -A 1 '^@' | grep -v '^@' | grep -v '^--$' | sort | uniq -c | sort -n -r | head
```

This pipeline:
1. Decompresses the file on-the-fly using `zcat`
2. Takes the first 48 lines (12 FASTQ records)
3. Extracts sequences following FASTQ headers (lines starting with `@`)
4. Filters out the header lines themselves
5. Removes the separator lines (`--`) added by `grep -A`
6. Sorts the sequences alphabetically
7. Counts unique occurrences with `uniq -c`
8. Sorts by frequency in descending order (`-r`)
9. Shows the top most abundant sequences with `head`

**Sample output:**
```bash
      5 GATTACA
      3 ATCGATCG
      2 GCTAGCTA
      2 TTTTAAAA
```

This tells us that the sequence "GATTACA" appears 5 times, making it the most abundant in our sample. Notice how we never created any intermediate files—the data flows seamlessly through each command in the pipeline!

That's a line of code and it can be quite handy for quick checks in the files!

## Why This Matters

The pipes and filters approach offers several advantages:

**Efficiency:** No need to create and manage temporary files that clutter your filesystem.

**Flexibility:** Mix and match any commands that read from standard input and write to standard output.

**Readability:** Once you understand the pattern, pipelines are easy to read from left to right.

**Speed:** Process data on-the-fly without waiting for intermediate files to be written to disk.

## Keep Learning

The Unix command line offers countless tools that work beautifully together. As you become comfortable with pipes, you'll find yourself solving complex problems with surprisingly concise commands.

For more advanced examples and inspiration, check out collections of Unix one-liners that demonstrate creative solutions to common data processing challenges. The more you practice combining commands, the more natural this powerful approach will become.

---

*Ready to put this into practice? Start with simple two-command pipes, then gradually build more complex workflows as you gain confidence. Before long, you'll be crafting elegant one-liners that would take dozens of lines in other programming languages.*


## Practice Exercises

Now it's your turn! Try these hands-on exercises to reinforce what you've learned:

### Basic Tasks

1. **Count all files in your current directory**
   - Use `ls` combined with `wc -l` to count how many files you have
   - Hint: Use a pipe!

2. **Find your largest file**
   - Use `ls -lh` to list files with sizes, pipe to `sort`, and get the largest
   - Bonus: Can you get just the filename without the size information?

3. **Create a sorted list of unique sequences**
   - Take the first 20 lines from a FASTQ file
   - Extract just the sequence lines
   - Sort them and remove duplicates
   - Save the result to `unique_sequences.txt`

### Intermediate Challenges

4. **Compress and verify**
   - Compress a FASTQ file using `gzip -9`
   - Without decompressing it permanently, count how many lines it contains
   - Compare with the original file size using `ls -lh`

5. **Build a quality check pipeline**
   - Count the total number of reads in all your `.fastq.gz` files
   - Hint: Combine `zcat`, wildcards, `wc -l`, and remember that each read is 4 lines!

6. **Find the top 5 most common words**
   - Take any text file (or use `head` on a FASTQ file)
   - Split it into words, sort them, count occurrences, and show the top 5
   - Hint: Look up the `tr` command to split words

### Advanced Pipeline

7. **Create a sequence length distribution**
   - Extract all sequences from a FASTQ file
   - Calculate the length of each sequence (research the `awk` command)
   - Count how many sequences of each length exist
   - Sort by length and save to `length_distribution.txt`

### Share Your Solutions

Found an elegant solution? Share your one-liners in the comments below! The bioinformatics community thrives on sharing clever command-line tricks.