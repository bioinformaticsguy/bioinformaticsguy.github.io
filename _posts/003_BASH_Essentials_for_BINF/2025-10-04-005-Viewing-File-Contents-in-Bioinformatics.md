---
date: 2025-10-04 12:29:12
layout: post
title: Viewing File Contents in Bioinformatics
subtitle: Master Essential Commands for Inspecting Sequence Data and Text Files
description: Learn how to efficiently view and navigate bioinformatics files using essential Unix commands. This hands-on lesson covers `head`, `tail`, `less`, and `zless`—powerful tools for examining both plain text and compressed sequencing files without loading entire datasets into memory.



series: BASH Essentials for Bioinformatics
series_sing: true
video_number: 5
video_id: Add video id here

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


## Setting Up Your Workspace

Before we begin, ensure you're in the correct directory:

```bash
cd data_for_bash_essentials
pwd  # Verify your current location
```

**Note:** Your path may differ depending on where you saved the data. The `pwd` command should confirm you're in the `data_for_bash_essentials` directory before proceeding.

---

## Quick Peeks: The `head` and `tail` Commands

### Using `head` to View the Beginning of Files

The `head` command displays the first few lines of a file—perfect for quickly checking file structure without opening the entire file.

**Basic usage:**
```bash
head reference.fasta
```

By default, `head` prints the first **10 lines**. You can customize this with the `-n` flag:

```bash
head -n 4 reference.fasta
```

This command shows only the first 4 lines, useful when you need a quick glimpse of file headers or format.

**Example output:**
```
>NC_045512.2 Severe acute respiratory syndrome coronavirus 2 isolate Wuhan-Hu-1
ATTAAAGGTTTATACCTTCCCAGGTAACAAACCAACCAACTTTCGATCTCTTGTAGATCT
GTTCTCTAAACGAACTTTAAAATCTGTGTGGCTGTCACTCGGCTGCATGCTTAGTGCACT
CACGCAGTATAATTAATAACTAATTACTGTCGTTGACAGGACACGAGTAACTCGTCTATC
```

### Using `tail` to View the End of Files

The `tail` command works similarly but displays the **last lines** of a file—helpful for checking if files are complete or viewing summary statistics often placed at file ends.

**Basic usage:**
```bash
tail reference.fasta
tail -n 4 reference.fasta
```

**Pro tip:** Both `head` and `tail` work with various file types including FASTA, TSV, and text files.


---

## Interactive Viewing: The `less` Command

### What is `less`?

The `less` command opens files in an interactive viewer, allowing you to navigate through large files efficiently without loading them entirely into memory. This is invaluable for bioinformatics files that can be gigabytes in size.

### Using `less` with Plain Text Files

Let's view the reference FASTA file:

```bash
less reference.fasta
```

### Navigation Controls

Once inside the `less` viewer:

| Key | Action |
|-----|--------|
| `↓` or `Enter` | Move down one line |
| `↑` | Move up one line |
| `Space` | Move down one page |
| `b` | Move back one page |
| `g` | Jump to beginning of file |
| `G` | Jump to end of file |
| `/pattern` | Search for "pattern" in file |
| `n` | Go to next search result |
| `q` | **Quit the viewer** |

⚠️ **Important:** Press `q` to exit the viewer. If you don't know this, you'll be stuck in the viewer!

### Why `less` is Useful

- **Memory efficient**: Doesn't load entire file into RAM
- **Fast navigation**: Quickly jump to different sections
- **Search capability**: Find specific patterns in large files
- **No file modification**: View-only mode prevents accidental changes


---

## Viewing text files with `vi`

You can also use `vi` to view text files. `vi` is a text editor that is available on almost all Unix systems. To open a file with `vi`, use the following command:

Before running the command that I am going to share you next. Please read the following important note.

> **Important:** `vi` is a powerful text editor, but it can be a bit tricky for beginners. As it was for me as well, when I openeded the file in `vi` for the first time, I didn't know how to exit and I had to force quit the terminal. So, please make sure to read the instructions below on how to exit `vi` before running the command.


Navigation in `vi` is done in two modes: command mode and insert mode. When you first open a file, you are in command mode. To switch to insert mode, press `i`. In insert mode, you can type and edit the file. To switch back to command mode, press `Esc`.

To exit `vi`, follow these steps:

1. Press `Esc` to ensure you are in command mode.
2. Type `:q` and press `Enter` to quit if you haven't made any changes.
3. If you have made changes and want to save them, type `:wq` and press `Enter`.
4. If you want to quit without saving changes, type `:q!` and press `Enter`.

Now we are ready to open the file:


```bash
vi reference.fasta
```


You can navigate the file using the arrow keys. To exit, follow the instructions above.

---


## ```cat```: Viewing File Contents

The `cat` command is another way to view the contents of a file. It prints the entire file to the screen. This is useful for small files, but not recommended for large files as it will flood your terminal with text.

```bash
cat testing.txt
```

Before we moce on to next topic I want to share small history of `cat` command. The `cat` command was originally developed in the early days of Unix as a simple way to concatenate and display files. The name "cat" is short for "concatenate," which reflects its primary function of joining multiple files together. Over time, `cat` has become a staple command in Unix-like operating systems, widely used for viewing and manipulating text files.

Let's try opening multiple testing files with `cat`:

```bash
cat testing.txt testing1.txt testing2.txt
```

You should see the contents of all three files printed to the screen, one after the other.

```bash
This is testing.txt
This is testing1.txt
This is testing2.txt
```

You saw the text in the file. There is one way to open big files with `cat` without flooding your terminal. You can use the `|` (pipe) operator to send the output of `cat` to another command, like `less`. But we will see more about pipes in a later lesson. For now, just remember that you can use `cat` to view small files.

---

## The Compressed File Challenge

Now let's try viewing a compressed FastQ file:

```bash
head tiny_n_L001_R1_xxx.fastq.gz
```

**What happened?** You'll see garbled, unreadable output on your screen. This occurs because the file is **gzip-compressed**—the data is encoded in a binary format that humans can't read directly.

**Example of garbled output:**
```
�^?�<8D>^M�^@^@^@^@^@^@^@^@^@ÿÿì½^Gy\T^W.þ<9e>÷<9e>of<9e>Ö^T...
```

This is normal! Compressed files require special tools to view properly.


We can try to open the compressed file with `less` as well:

```bash
less tiny_n_L001_R1_xxx.fastq.gz
```

You will see the following warning:

```bash
"tiny_n_L001_R1_xxx.fastq.gz" may be a binary file.  See it anyway?
```


If you hit Enter, it will exit `less` and return you to the command line. If you type `y` you will see garbled output again as with `head`. If you hit `q`, you'll exit back to the command line.

---

## Viewing Compressed Files: The `zless` Command

For compressed files (`.gz` extension), use `zless`—it decompresses on-the-fly and displays content in the same interactive viewer:

```bash
zless tiny_n_L001_R1_xxx.fastq.gz
```

Now you can properly view the FastQ file contents:

```
@M00969:353:000000000-BR5KF:1:1101:15446:1444 1:N:0:TAAGGCGA+TAGATCGC
NTTGTATTGCTAGCAATACTGCAACAAATGCTATGAATGCATGCAACAATGTTGCAATGC
+
#8BCCGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
```

**Navigation:** Use the same keyboard shortcuts as `less` (`q` to quit).

## zcat: Viewing Entire Compressed Files

If you want to view the entire contents of a compressed file without interaction, use `zcat`:

```bash
zcat tiny_n_L001_R1_xxx.fastq.gz
```

This command do not work in macOS by default. But as I suggested you can use the alternative commands suggested earlier.

---

## Command Comparison Table

| Command | Purpose | Works with Compressed? |
|---------|---------|----------------------|
| `head` | View first lines | No |
| `tail` | View last lines | No |
| `less` | Interactive viewer | No |
| `cat` | View entire file | No |
| `zless` | Interactive viewer | **Yes** (.gz files) |
| `zcat` | View entire compressed file | **Yes** (.gz files) |

---

## Quick Inspection Workflows

### Checking File Format
```bash
head -n 1 myfile.fasta  # See FASTA header
head -n 4 myfile.fastq  # See one FastQ record
```

### Verifying File Completeness
```bash
tail -n 2 results.tsv  # Check if analysis finished
```

### Exploring Large Files
```bash
zless large_dataset.fastq.gz  # Navigate compressed data
```

---

## Common Questions

**Q: What if I want just a few lines from a compressed file?**  
A: Great question! We'll learn about `zcat` and `zgrep` in the next lesson for extracting specific lines from compressed files.

**Q: Can I edit files with `less`?**  
A: No, `less` is view-only. Use text editors like `nano` or `vim` for editing.

---

## Practice Exercise

Try these commands with your dataset:

1. View the first 20 lines of `reference.fasta`
2. Check the last 5 lines of a TSV file
3. Navigate through a compressed FastQ file using `zless`

---

## What's Next?

In **Lesson 06**, we'll explore:
- copying, moving, renaming and deleting files.
- We will also look at standard output and how to redirect output to files.
Stay tuned and keep practicing these essential commands!
---

## Key Takeaways
✓ `head` and `tail` provide quick peeks at file beginnings and ends  
✓ `less` offers interactive navigation for large files  
✓ `zless` works identically to `less` but handles compressed files  
✓ Press `q` to exit `less` and `zless` viewers  
✓ These commands don't load entire files into memory—perfect for big data