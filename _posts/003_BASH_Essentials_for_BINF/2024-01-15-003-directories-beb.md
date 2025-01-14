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
ali 
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
1by2.cif	Desktop		Library		Pipfile
2ja4.cif	Documents	Movies		Public
Applications	Downloads	Music		mambaforge
Calibre Library	Google Drive	Pictures	micromamba
~~~

Enhance your file insights by employing **flags** or **arguments**. Let's delve into `ls -t` and `ls -tlh`. The -t flag organizes items based on their last edit time. Combining flags allows us to perform multiple actions simultaneously, such as sorting by time (-t), displaying all details (-l), and presenting file sizes in a human-readable format (-h).


~~~ {.bash}
ls -l
~~~
~~~ {.output}
total 480
-rw-r--r--    1 ali  staff  120030 Jan  2 21:51 1by2.cif
-rw-r--r--    1 ali  staff  114816 Jan  2 21:56 2ja4.cif
drwx------@   7 ali  staff     224 Oct 16 13:50 Applications
drwx------@   5 ali  staff     160 Oct 27 02:19 Desktop
drwx------@  15 ali  staff     480 Jan 22 23:16 Documents
drwx------@  30 ali  staff     960 Jan 28 17:56 Downloads
lrwx------    1 ali  staff      79 Jan 23 18:34 Google Drive
drwx------@ 104 ali  staff    3328 Dec 24 12:15 Library
drwx------   12 ali  staff     384 Jan 26 01:22 Movies
drwx------+   5 ali  staff     160 Dec  9  2022 Music
drwx------+  11 ali  staff     352 Sep 25 20:06 Pictures
-rw-r--r--    1 ali  staff     138 May 21  2023 Pipfile
drwxr-xr-x+   4 ali  staff     128 Dec  6  2022 Public
drwxr-xr-x   18 ali  staff     576 Nov 15 11:15 mambaforge
drwxr-xr-x    5 ali  staff     160 Jan  4 23:42 micromamba
drwxr-xr-x@  18 ali  staff     576 Jan  5 00:10 miniforge3
drwxr-xr-x    3 ali  staff      96 Dec 27  2022 opt
drwxr-xr-x    4 ali  staff     128 Dec 15  2022 src

~~~

~~~ {.bash}
ls -tlh
~~~

~~~ {.output}
drwx------@  30 ali  staff   960B Jan 28 17:56 Downloads
drwx------   12 ali  staff   384B Jan 26 01:22 Movies
lrwx------    1 ali  staff    79B Jan 23 18:34 Google Drive
drwx------@  15 ali  staff   480B Jan 22 23:16 Documents
drwxr-xr-x@  18 ali  staff   576B Jan  5 00:10 miniforge3
drwxr-xr-x    5 ali  staff   160B Jan  4 23:42 micromamba
-rw-r--r--    1 ali  staff   112K Jan  2 21:56 2ja4.cif
-rw-r--r--    1 ali  staff   117K Jan  2 21:51 1by2.cif
drwx------@ 104 ali  staff   3.3K Dec 24 12:15 Library
drwxr-xr-x   18 ali  staff   576B Nov 15 11:15 mambaforge
drwx------@   5 ali  staff   160B Oct 27 02:19 Desktop
drwx------@   7 ali  staff   224B Oct 16 13:50 Applications
drwx------+  11 ali  staff   352B Sep 25 20:06 Pictures
-rw-r--r--    1 ali  staff   138B May 21  2023 Pipfile
drwxr-xr-x    3 ali  staff    96B Dec 27  2022 opt
drwxr-xr-x    4 ali  staff   128B Dec 15  2022 src
drwx------+   5 ali  staff   160B Dec  9  2022 Music
drwxr-xr-x+   4 ali  staff   128B Dec  6  2022 Public

~~~

We can also list contents of other directories by providing the path to that directory. 

~~~ {.bash}
$ ls -tlh Movies
~~~

~~~ {.output}
drwxrwxrwx  22 ali  staff   704B Jan 26 01:22 CacheClip
drwxr-xr-x   7 ali  staff   224B Jan 26 01:21 Academic Guy
drwxr-xr-x   4 ali  staff   128B Jan 25 21:00 Renders
drwxr-xr-x   5 ali  staff   160B Dec 21 11:30 TV
drwxr-xr-x   3 ali  staff    96B Oct 17 16:31 BioinformaticGuy
drwxr-xr-x   3 ali  staff    96B Apr 14  2023 Handbreaked

~~~

~~~ {.bash}
$  ls -tlh tutorieal_folder/beb_data 
~~~

~~~ {.output}
-rw-r--r--  1 ali  staff    77K Oct 28 04:17 copy-chicken_03_R2.fastq
-rw-r--r--  1 ali  staff    77K Oct 28 04:17 copy-chicken_03_R1.fastq
-rw-r--r--  1 ali  staff    52K Oct 28 04:17 copy-chicken_02_R2.fastq
-rw-r--r--  1 ali  staff    52K Oct 28 04:17 copy-chicken_02_R1.fastq
-rw-r--r--  1 ali  staff    26K Oct 28 04:17 copy-chicken_01_R2.fastq
-rw-r--r--@ 1 ali  staff    26K Oct 28 04:17 copy-chicken_01_R1.fastq
-rw-r--r--  1 ali  staff   386B Oct 28 04:00 sorted_lengths.txt
-rw-r--r--  1 ali  staff   386B Oct 28 03:59 lengths.txt
-rw-rw-r--@ 1 ali  staff    26K Apr  1  2023 SRR534005_01_R1.fastq
-rw-rw-r--  1 ali  staff    26K Apr  1  2023 SRR534005_01_R2.fastq
-rw-rw-r--  1 ali  staff    52K Apr  1  2023 SRR534005_02_R1.fastq
-rw-rw-r--  1 ali  staff    52K Apr  1  2023 SRR534005_02_R2.fastq
-rw-rw-r--  1 ali  staff    77K Apr  1  2023 SRR534005_03_R1.fastq
-rw-rw-r--  1 ali  staff    77K Apr  1  2023 SRR534005_03_R2.fastq
-rw-rw-r--  1 ali  staff   1.5M Apr  1  2023 human_01_R1.fastq
-rw-rw-r--  1 ali  staff   1.4M Apr  1  2023 human_02_R1.fastq
-rw-rw-r--  1 ali  staff    77K Apr  1  2023 yeast_01_R1.fastq
-rw-rw-r--  1 ali  staff    77K Apr  1  2023 yeast_01_R2.fastq
-rw-rw-r--  1 ali  staff   152K Apr  1  2023 yeast_02_R1.fastq
-rw-rw-r--  1 ali  staff   152K Apr  1  2023 yeast_02_R2.fastq
-rw-rw-r--@ 1 ali  staff    26K Apr  1  2023 chicken.fastq

~~~

## Change Directory
Apart from inspecting files within directories, we have the capability to shift our current location to another directory, thereby moving away from our home directory. The command used for this operation is cd. To execute the cd command, an argument specifying the directory name is required.

To access the recently downloaded and saved directory named "DataForUnixCourse," a sequence of two commands can be employed to navigate into it.


~~~ {.bash}
$ cd Desktop
$ cd tutorieal_folder
$ cd beb_data
~~~

~~~ {.bash}
ali@host beb_data % 
$ 
~~~

These commands transitioned us from our home directory to the Desktop and then into the `tutorieal_folder` directory.
However, as the cd command doesn't produce any output, our prompt remains empty or displays `$`. To determine our current 
location, we can utilize the informative `pwd` command.

~~~ {.bash}
$ pwd
~~~

~~~ {.output}
/Desktop/tutorieal_folder/beb_data
~~~

And now we can type `ls` to see the contents

~~~ {.bash}
$ ls
~~~

~~~ {.output}
SRR534005_01_R1.fastq           SRR534005_03_R2.fastq                   
SRR534005_01_R2.fastq           chicken.fastq               
SRR534005_02_R1.fastq           copy-chicken_01_R1.fastq        
SRR534005_02_R2.fastq           copy-chicken_01_R2.fastq        
SRR534005_03_R1.fastq           copy-chicken_02_R1.fastq   
copy-chicken_02_R2.fastq        lengths.txt      
copy-chicken_03_R1.fastq        sorted_lengths.tx
copy-chicken_03_R2.fastq        yeast_01_R1.fastq
human_01_R1.fastq               yeast_01_R2.fastq
human_02_R1.fastq               yeast_02_R1.fastq     
yeast_02_R2.fastq
~~~

## Relative Paths vs. Absolute Paths
The computer's directories form a hierarchy, and you can specify them using either a relative path or an absolute path. 
A relative path is based on your current directory, while an absolute path is not influenced by the current directory.

Upon executing the recent `pwd`command, the output displayed something akin to the following:

~~~ {.output}
/Users/ali/Desktop/tutorieal_folder/beb_data
~~~

This is the full path to the beb_data directory on Ali's computer. 

At the pinnacle of the hierarchy is a directory denoted as `/`, commonly known as the root directory. 
Ali's home directory is precisely located at the full path `/Users/ali`. 
Within the home directory, the Desktop serves as a subdirectory, and our project folder is nested within the Desktop.

Directory navigation can be accomplished using either full or relative paths.

## Relative Path Examples 

`.` The single period means **this directory**. This is a relative path to use when you want to copy files from somewhere else to your current directory

`..` The double period means **one directory up in the hierarchy**. This is useful when you want to move up one directory by typing `cd ..`. You can use this in a combination, for example: `cd ../..` will go up two directories or `cd ../Pictures/` will move up to the Desktop and then into Pictures. 


## Examples of Relative Paths

- `.`: The single period signifies the current directory. 
It is a relative path useful for copying files from elsewhere to your current directory.

- `..`: The double period denotes moving one directory up in the hierarchy. 
This is beneficial when you wish to ascend one directory level using the `cd ..` command. 

It can be used in combinations such as `cd ../..` to go up two directories or `cd ../Pictures/` 
to ascend to the Desktop and then navigate into the Pictures directory.



## Home Shortcuts

Navigating to the home directory can be done by typing the full path `/Users/username`, but this involves a considerable amount of typing. 
An alternative is to use the `~` symbol, which can replace `/c/Users/username` in full path descriptions. 
However, for Unix users who find even the `~` too cumbersome, simply using the `cd` command followed by the return or 
enter key accomplishes the same, swiftly taking you back to the home directory. 
Therefore, any of these three commands will reliably guide you home, regardless of your current location in the file system:


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