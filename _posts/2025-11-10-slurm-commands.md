---
date: 2025-11-10 12:29:19
layout: post
title: SLURM Commands
subtitle: Very important slurm command cheetsheet.
description: This is a rapitoure of important slurm commands


series: Slurm Essentials for Bioinformatics
series_sing: false
video_number: 001
video_id: WbgC0m0fsQ8

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1762509853/BioinformaticsGuyGeneralFiles/Colorful_Freelancer_YouTube_Thumbnail_1_kgna0g.png


category: SLURM Essentials
tags:
  - HPC
  - Cluster
  - SLURM
  - BASH
  - Bioinformatics
  - Bash Scripting
  - CLI
  
author: alihassan
paginate: true
---

[![Alt text](https://res.cloudinary.com/bioinformaticsguy/image/upload/v1762509853/BioinformaticsGuyGeneralFiles/Colorful_Freelancer_YouTube_Thumbnail_1_kgna0g.png)](https://www.youtube.com/c/BioinformaticsGuy)


{% include next-prev.html %}


# Command to check the quota of the storage.

```bash
$ df -h .
```

This will tell you the quota in the current folder.

```bash
Filesystem                            Size  Used Avail Use% Mounted on
storageXXX.clustername.uni-name.ext:/DATA   15T   14T  1.6T  90% /data
```