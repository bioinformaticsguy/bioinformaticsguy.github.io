---
date: 2025-10-07 12:29:19
layout: post
title: Uniq and History
subtitle: Discover Duplicate Lines and Track Your Command-Line Journey
description: Learn how to use the uniq command to identify and count duplicate lines in files, and master the history command to review and analyze your past terminal commands. These tools help you understand your data patterns and improve your workflow efficiency.


series: BASH Essentials for Bioinformatics
series_sing: true
video_number: 9
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



Two of the most underrated commands in Unix are `uniq` and `history`. While they might seem simple at first glance, these tools provide powerful insights—one into your data, the other into your own working patterns.

## Creating Our Practice File

Before we explore these commands, let's create a simple text file with some repeated content. We'll use the `echo` command with redirection to build our example:

```bash
$ echo "apple" > fruits.txt
$ echo "banana" >> fruits.txt
$ echo "apple" >> fruits.txt
$ echo "cherry" >> fruits.txt
$ echo "banana" >> fruits.txt
$ echo "apple" >> fruits.txt
$ echo "cherry" >> fruits.txt
```

Let's verify what we created:

```bash
$ cat fruits.txt
```

You should see a list with several repeated fruit names. Perfect for testing `uniq`!

## Understanding Uniq: Finding Duplicates

The `uniq` command has one crucial requirement: it only recognizes duplicates when they appear on *adjacent lines*. This is why you'll almost always use `sort` before `uniq`.

### Sorting First

Let's see what happens when we sort our file:

```bash
$ sort fruits.txt
```

Now all identical entries are grouped together—exactly what `uniq` needs.

### Counting Duplicates with `-c`

The `-c` flag is where `uniq` becomes truly useful. It counts how many times each line appears and prepends that count:

```bash
$ sort fruits.txt | uniq -c
```

You'll see output showing how many times each fruit appears in your file. This simple pipeline—sort then count unique lines—is one of the most common patterns in data analysis at the command line.


```bash
      3 apple
      2 banana
      2 cherry
```

### Why the Sort Matters

To understand why sorting is essential, try running `uniq` without sorting first:

```bash
$ uniq -c fruits.txt
```

You'll get incorrect counts because `uniq` only compares adjacent lines. Without sorting, identical entries scattered throughout the file won't be grouped together.

```bash
      1 apple
      1 banana
      1 apple
      1 cherry
      1 banana
      1 apple
      1 cherry
```

### Using First N Characters: The `-w` Flag

The `-w N` flag tells `uniq` to only compare the first N characters of each line. This is useful when you have lines that start the same but differ later on.

For example, if you had gene names like "gene_001_variant_A" and "gene_001_variant_B", using `-w 8` would treat them as identical because only the first 8 characters ("gene_001") would be compared.

We can try something for our varients.vcf file. We can count the number of varients each chromosome has by using the following command. 


```bash
# grep -v "^#" variants.vcf | sort | uniq -c -w 4
```


```bash
      2 chr1    12345   rs123456        A       G       99      PASS    DP=50;AF=0.45
      2 chr2    23456   rs234567        G       A       95      PASS    DP=60;AF=0.52
      2 chr3    34567   rs345678        A       T       100     PASS    DP=70;AF=0.48
      2 chrX    45678   rs456789        G       C       98      PASS    DP=55;AF=0.42
```

## Tracking Your Work with History

The `history` command is like a time machine for your terminal session. It shows you a numbered list of commands you've recently typed:

```bash
$ history
```

This simple command reveals your complete command-line journey—every navigation, every search, every mistake and correction.

I am sharing here some of the latest commands that I have just used.

```bash
1246  echo "apple" > fruits.txt
 1247  echo "banana" >> fruits.txt
 1248  echo "apple" >> fruits.txt
 1249  echo "cherry" >> fruits.txt
 1250  echo "banana" >> fruits.txt
 1251  echo "apple" >> fruits.txt
 1252  echo "cherry" >> fruits.txt
 1253  cat fruits.txt 
 1254  sort fruits.txt 
 1255  sort fruits.txt | uniq -c
 1256  uniq -c fruits.txt
 1257  ls
 1258  less variants.vcf 
 1259  cat variants.vcf 
 1260  sort variants.vcf | uniq -c -w 4
 1261  grep -v "^#" variants.vcf | sort | uniq -c -w 4
 1262  history
```

### Searching Your History

Since `history` outputs text, you can pipe it through `grep` to find specific commands:

```bash
$ history | grep "pwd"
```

```bash
  287  pwd
  680  pwd
  826  pwd
 1263  history | grep "pwd"
```

This shows every time you checked your current directory. The output includes both the command number and the full command, making it easy to track when and how often you used particular commands.

### Finding Your Most Used Commands

Want to see which commands you rely on most? Combine `history` with the tools we've learned:

```bash
$ history | grep "cd" | wc -l
```

Haha I used cd 101 times:

```bash
101
```

This reveals how many times you changed directories. Or try:

```bash
$ history | grep "|"
```

This shows how many times you used pipes—a good indicator of how comfortable you've become with command chaining!

I am not using pipes that often so I used it just for 35 times.

```bash
35
```

### Analyzing Your Workflow

Here's a powerful analysis you can run on yourself. To see your most frequently used commands:

```bash
$ history | awk '{print $2}' | sort | uniq -c | sort -nr | head
```

Oh we got some cool results.

```bash
    195 ls
     96 cd
     94 docker
     69 ssh
     62 clear
     43 git
     39 snakemake
     37 conda
     31 omics
     31 grep
```

This pipeline extracts just the command names, counts their occurrences, sorts by frequency, and shows you the top results. It's a fascinating glimpse into your own working patterns.

## Challenge: Know Thyself

Try these exercises to understand your command-line habits:

**1. How many times did you change directories today?**
Use `history | grep "cd"` and count the results, or add `| wc -l` to count automatically.

**2. How many times did you use pipes today?**
Search your history for the pipe character to see how often you've been chaining commands.

**3. How many times did you looked at directory contents?**
Count your uses of `ls` to see how much time you spend navigating and exploring.

## The Real Lesson

After analyzing your history, you'll likely discover something: most of what we do at the command line is navigate directories with `cd` and `ls`. We check where we are with `pwd`, look at what's around us with `ls`, and move around with `cd`. These simple navigation commands form the foundation of everything else we do.

Understanding this pattern reveals an important truth about command-line work: mastering the basics matters more than knowing exotic commands. Once navigation becomes second nature, you can focus your mental energy on the actual data analysis, not on figuring out where you are or how to get somewhere.

## Bioinformatics Applications: Beyond Fruits

Now that we've mastered these commands with our simple fruits example, let's explore how they apply to real bioinformatics workflows.

### Using Uniq with Sequence Data

**Counting unique sequence IDs in a FASTA file:**

When working with FASTA files, you often need to know how many unique sequences you have or if there are any duplicates:

```bash
$ grep "^>" sequences.fasta | sort | uniq -c
```

This extracts all headers, sorts them, and counts duplicates. If any sequence ID appears more than once, you'll immediately see it in the count.


```bash
      1 >gene_001 hypothetical protein
      2 >gene_002 kinase domain
      3 >gene_003 hypothetical protein
      2 >gene_004 transcription factor
```

**Finding the most abundant sequences:**

After processing sequencing data, you might want to identify the most frequently occurring sequences:

```bash
$ grep -v "^>" sequences.fasta | sort | uniq -c | sort -nr | head
```

```bash 
      3 TTAATTAATTAATTAA
      2 GCTAGCTAGCTAGCTAG
      2 CGCGCGCGCGCGCGCG
      1 ATGCGATCGATCGATCG
```

This pipeline removes headers, counts identical sequences, sorts by abundance (most common first), and shows the top results.


### Using History for Reproducible Research

Your command history isn't just a record of what you've done—it's a powerful tool for reproducible research, workflow optimization, and self-improvement. By searching through your history, you can extract valuable insights about your bioinformatics workflows, recover complex commands, and build reusable scripts from successful analyses.

**Key applications:**

- **Document your methods for publications:** Extract all your alignment and processing steps directly from your actual workflow to create a methods section for manuscripts or lab notebooks.

- **Recover complex commands you've run before:** Find that perfect BLAST command with all the right parameters you used last week by searching your history.

- **Convert interactive work into reusable scripts:** After working out a successful pipeline interactively, save those commands as the foundation for an automated script.

- **Analyze your tool usage patterns:** Understand which alignment tools you use most frequently to guide your learning priorities and optimization efforts.

- **Track workflow quality and efficiency:** Monitor how often commands fail or how frequently you check file sizes, which might indicate areas where your workflow needs improvement.

## Building Good Habits

As you become more comfortable with the command line, periodically review your history. Look for patterns:
- Are you typing the same complex command repeatedly? Consider creating an alias or script.
- Do you keep making the same typo? Your history will reveal it.
- Are you navigating inefficiently? You might benefit from learning about symbolic links or better directory organization.

---

*The beauty of Unix commands lies in their simplicity and composability. Master the basics like uniq and history, and you'll build a foundation for increasingly sophisticated data analysis workflows.*


{% include next-prev.html %}