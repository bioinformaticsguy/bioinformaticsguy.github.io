---
date: 2024-01-15 12:36:40
layout: post
title: A Biologist's Guide to Unix File System Navigation
description: Discover essential Unix File System navigation tips tailored for biologists. Enhance your data management skills with efficient command-line techniques, empowering your computational biology journey.

subtitle: Streamlining Your Computational Biology Workflow Through Efficient Unix File System Navigation.

series: BASH Essentials for Bioinformatics
series_sing: true
video_number: 3
video_id: WbgC0m0fsQ8

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1693136903/003_BEB/002/Colorful_Freelancer_YouTube_Thumbnail_zvvd3g.png


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

[![Alt text](https://res.cloudinary.com/bioinformaticsguy/image/upload/v1705825668/003_BEB/003/ouqhktwhfhu7vdjcc6tx.jpg)](https://www.youtube.com/c/BioinformaticsGuy)


<!-- {% include youtube_embed.html %}  -->



<!-- https://jupytext.readthedocs.io/en/latest/using-cli.html -->
<!-- jupytext --to markdown ForLoops-IIofII.ipynb -->



Think of the file system as your computer's organizer. It manages files (holds information) and directories (folders that hold files or more folders).

Let's start exploring your computer using the command line.


## Check Your Computer Name

Type `whoami` and press enter. Your computer's name should appear. Here's how it works:
- The shell looks for a program called whoami.
- It runs the program.
- The program's output (your computer name) is displayed.
- A new prompt appears, indicating readiness for more commands.

For example: 

~~~ {.bash}
$:whoami
~~~

~~~ {.output}
user 
~~~

## Print Working Directory

To find out where we are, use the `pwd` command, which stands for **print working directory**. The current working directory is our default location for running commands, unless we specify otherwise.


~~~ {.bash}
$:pwd
~~~
~~~ {.output}
/Users/ali
~~~

Welcome to your **home directory**! To understand the concept, let's explore the overall organization of the file system, using our scientist Nelle's computer as an example. Later, you'll learn commands to navigate your own filesystem, structured similarly but not precisely identical.

| The home directory path varies across operating systems. On a Mac, it might resemble `/Users/username`, while on Windows, it could be more like `/c/Users/username`. In our examples, we default to Mac output.


## Listing stuff in the current directory

To explore the contents of our filesystem from the command line, we use the `ls` command, short for "listing." This command prints the names of files and directories in the current directory, arranging them alphabetically into neat columns.

~~~ {.bash}
$ ls
~~~
~~~ {.output}
$:ls
GSM2221119_liverEnhancer_all-labels.tsv     reference.fasta.fai
GSM2221119_liverEnhancer_all-labelsINV.tsv  sample_reads.fastq.gz
GSM4237954_9MPRA_elements.fa.gz             sequences.fasta
SM2221119_liverEnhancer_label.txt.gz        testing.txt
design.fa                                   testing1.txt
history.txt                                 testing2.txt
labels.tsv                                  tiny_n_L001_R1_xxx.fastq.gz
lengths.txt                                 tiny_n_L001_R2_xxx.fastq.gz
read_2.fq.gz                                tsv_lengths.txt
reference.fasta                             variants.vcf
~~~

Enhance your file insights by employing **flags** or **arguments**. Let's delve into `ls -t` and `ls -tlh`. The -t flag organizes items based on their last edit time. Combining flags allows us to perform multiple actions simultaneously, such as sorting by time (-t), displaying all details (-l), and presenting file sizes in a human-readable format (-h).


~~~ {.bash}
ls -l
~~~
~~~ {.output}
-rwxrwxrwx 1 root root   212126 Oct  6 17:04 GSM2221119_liverEnhancer_all-labels.tsv
-rwxrwxrwx 1 root root   212126 Oct  6 17:04 GSM2221119_liverEnhancer_all-labelsINV.tsv
-rwxrwxrwx 1 root root   192857 Oct  6 17:04 GSM4237954_9MPRA_elements.fa.gz
-rwxrwxrwx 1 root root    45616 Oct  6 17:04 SM2221119_liverEnhancer_label.txt.gz
-rwxrwxrwx 1 root root   619198 Oct  6 17:04 design.fa
-rwxrwxrwx 1 root root    23419 Oct  6 17:04 history.txt
-rwxrwxrwx 1 root root   212126 Oct  6 17:04 labels.tsv
-rwxrwxrwx 1 root root      102 Oct  6 17:04 lengths.txt
-rwxrwxrwx 1 root root 22750879 Oct  6 17:04 read_2.fq.gz
-rwxrwxrwx 1 root root 48971366 Oct  6 17:04 reference.fasta
-rwxrwxrwx 1 root root      471 Oct  6 17:04 reference.fasta.fai
-rwxrwxrwx 1 root root      121 Oct  6 17:04 sample_reads.fastq.gz
-rwxrwxrwx 1 root root      373 Oct  8 16:24 sequences.fasta
-rwxrwxrwx 1 root root       20 Oct  6 17:04 testing.txt
-rwxrwxrwx 1 root root       21 Oct  6 17:04 testing1.txt
-rwxrwxrwx 1 root root       21 Oct  6 17:04 testing2.txt
-rwxrwxrwx 1 root root    45009 Oct  6 17:04 tiny_n_L001_R1_xxx.fastq.gz
-rwxrwxrwx 1 root root    47703 Oct  6 17:04 tiny_n_L001_R2_xxx.fastq.gz
-rwxrwxrwx 1 root root      128 Oct  6 17:04 tsv_lengths.txt
-rwxrwxrwx 1 root root      581 Oct  7 16:03 variants.vcf
~~~

~~~ {.bash}
ls -tlh
~~~

~~~ {.output}
total 70M
-rwxrwxrwx 1 root root  373 Oct  8 16:24 sequences.fasta
-rwxrwxrwx 1 root root  581 Oct  7 16:03 variants.vcf
-rwxrwxrwx 1 root root  128 Oct  6 17:04 tsv_lengths.txt
-rwxrwxrwx 1 root root  47K Oct  6 17:04 tiny_n_L001_R2_xxx.fastq.gz
-rwxrwxrwx 1 root root  44K Oct  6 17:04 tiny_n_L001_R1_xxx.fastq.gz
-rwxrwxrwx 1 root root   21 Oct  6 17:04 testing2.txt
-rwxrwxrwx 1 root root   21 Oct  6 17:04 testing1.txt
-rwxrwxrwx 1 root root   20 Oct  6 17:04 testing.txt
-rwxrwxrwx 1 root root  121 Oct  6 17:04 sample_reads.fastq.gz
-rwxrwxrwx 1 root root  471 Oct  6 17:04 reference.fasta.fai
-rwxrwxrwx 1 root root  47M Oct  6 17:04 reference.fasta
-rwxrwxrwx 1 root root  22M Oct  6 17:04 read_2.fq.gz
-rwxrwxrwx 1 root root  102 Oct  6 17:04 lengths.txt
-rwxrwxrwx 1 root root 208K Oct  6 17:04 labels.tsv
-rwxrwxrwx 1 root root  23K Oct  6 17:04 history.txt
-rwxrwxrwx 1 root root 605K Oct  6 17:04 design.fa
-rwxrwxrwx 1 root root  45K Oct  6 17:04 SM2221119_liverEnhancer_label.txt.gz
-rwxrwxrwx 1 root root 189K Oct  6 17:04 GSM4237954_9MPRA_elements.fa.gz
-rwxrwxrwx 1 root root 208K Oct  6 17:04 GSM2221119_liverEnhancer_all-labelsINV.tsv
-rwxrwxrwx 1 root root 208K Oct  6 17:04 GSM2221119_liverEnhancer_all-labels.tsv
~~~

We can also list contents of other directories by providing the path to that directory. 

~~~ {.bash}
$ ls -tlh other_files/
~~~

~~~ {.output}
-rwxrwxrwx 1 root root  128 Oct 31 13:06 tsv_lengths.txt
-rwxrwxrwx 1 root root  102 Oct 31 13:06 lengths.txt
-rwxrwxrwx 1 root root  23K Oct 31 13:06 history.txt
-rwxrwxrwx 1 root root 605K Oct 31 13:06 design.fa
-rwxrwxrwx 1 root root  45K Oct 31 13:06 SM2221119_liverEnhancer_label.txt.gz
-rwxrwxrwx 1 root root 189K Oct 31 13:06 GSM4237954_9MPRA_elements.fa.gz
~~~


## Change Directory
Apart from inspecting files within directories, we have the capability to shift our current location to another directory, thereby moving away from our home directory. The command used for this operation is cd. To execute the cd command, an argument specifying the directory name is required.

To access the recently downloaded and saved directory named "DataForUnixCourse," a sequence of two commands can be employed to navigate into it.


~~~ {.bash}
$ cd other_files/
~~~



However, as the cd command doesn't produce any output, our prompt remains empty or displays `$`. To determine our current location, we can utilize the informative `pwd` command.

~~~ {.bash}
$ pwd
~~~

~~~ {.output}
/mnt/c/Users/Ali/Documents/bash_essentials_for_bioinformatics/data_for_bash_essentials/other_files
~~~

And now we can type `ls` to see the contents

~~~ {.bash}
$ ls
~~~



~~~ {.bash}
GSM4237954_9MPRA_elements.fa.gz       design.fa    lengths.txt
SM2221119_liverEnhancer_label.txt.gz  history.txt  tsv_lengths.txt
~~~

## Relative Paths vs. Absolute Paths
The computer's directories form a hierarchy, and you can specify them using either a relative path or an absolute path. 
A relative path is based on your current directory, while an absolute path is not influenced by the current directory.

Upon executing the recent `pwd`command, the output displayed something akin to the following:

~~~ {.output}
/mnt/c/Users/Ali/Documents/bash_essentials_for_bioinformatics/data_for_bash_essentials/other_files
~~~

This is the full path to the beb_data directory on Ali's computer. 

At the pinnacle of the hierarchy is a directory denoted as `/`, commonly known as the root directory. 
Ali's home directory is precisely located at the full path `/mnt/c/Users/Ali`. 
Within the home directory, the Desktop serves as a subdirectory, and our project folder is nested within the Desktop.

Directory navigation can be accomplished using either full or relative paths.

## Relative Path Examples 

`.` The single period means **this directory**. This is a relative path to use when you want to copy files from somewhere else to your current directory

`..` The double period means **one directory up in the hierarchy**. This is useful when you want to move up one directory by typing `cd ..`. You can use this in a combination, for example: `cd ../..` will go up two directories or `cd ../Downloads/` will move up to the Desktop and then into Pictures. 


## Examples of Relative Paths

- `.`: The single period signifies the current directory. 
It is a relative path useful for copying files from elsewhere to your current directory.

- `..`: The double period denotes moving one directory up in the hierarchy. 
This is beneficial when you wish to ascend one directory level using the `cd ..` command. 

It can be used in combinations such as `cd ../..` to go up two directories or `cd ../Downloads/` to ascend to the Desktop and then navigate into the Pictures directory.



## Home Shortcuts

Navigating to the home directory can be done by typing the full path `/Users/username`, but this involves a considerable amount of typing. 
An alternative is to use the `~` symbol, which can replace `/c/Users/username` in full path descriptions. 
However, for Unix users who find even the `~` too cumbersome, simply using the `cd` command followed by the return or enter key accomplishes the same, swiftly taking you back to the home directory. Therefore, any of these three commands will reliably guide you home, regardless of your current location in the file system:


~~~ {.bash}
$ cd /c/Users/username
$ cd ~
$ cd
~~~


## Three "navigating the file system" challenges

**1. In two steps, navigate to your "Downloads" directory then to your "Pictures" Directory**

**2. Navigate to your "data" directory. Next navigate to your "Desktop" using relative commands.**

**3. What command will get you from anywhere in your file system to your home directory with the fewest key strokes?**


## Here is a summary of some of the commands we just practiced.

## Tab Completion Shortcut
We've recently covered some shorthand notations that help us save time when typing. Another highly useful shortcut is known as tab completion. 
When entering a directory or file name, simply type the first few characters and then press the `tab` button. Your computer will automatically append the subsequent unique characters.

{% include next-prev.html %}