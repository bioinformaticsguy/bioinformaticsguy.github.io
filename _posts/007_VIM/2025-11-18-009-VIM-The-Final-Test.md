---
date: 2025-11-18 12:29:19
layout: post
title: The Complete Mastery Challenge
subtitle: Test Your Skills, Build Muscle Memory, and Keep the Ultimate Command Reference
description: Complete comprehensive exercises that test everything you've learned across all 8 VIM lessons, challenge yourself with real-world bioinformatics scenarios, and keep the ultimate VIM cheat sheet that covers every essential command. Your final step to VIM mastery.


series: VIM Essentials for Bioinformatics
series_sing: true
video_number: 9
video_id: WbgC0m0fsQ8

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1762509853/BioinformaticsGuyGeneralFiles/Colorful_Freelancer_YouTube_Thumbnail_1_kgna0g.png


category: VIM
tags:
  - Bioinformatics
  - CLI
  - Mac
  - Windows
  - Linux
  - VIM
  - text-edittor
  - screen-based
author: alihassan
paginate: true
---


[![Alt text](https://res.cloudinary.com/bioinformaticsguy/image/upload/v1762509853/BioinformaticsGuyGeneralFiles/Colorful_Freelancer_YouTube_Thumbnail_1_kgna0g.png)](https://www.youtube.com/c/BioinformaticsGuy)


You've learned the commands. You've practiced the motions. You've customized your environment. Now it's time to prove you've mastered VIM through comprehensive challenges that simulate real bioinformatics work.

This final lesson provides:
- **Progressive exercises** testing all 8 lessons
- **Real-world scenarios** from actual bioinformatics workflows  
- **The ultimate cheat sheet** covering every command from the series
- **Mastery challenges** that combine multiple techniques
- **A graduation project** to demonstrate complete proficiency

By the end, you'll have proven to yourself that VIM is no longer a tool you're learning—it's a skill you own.

## How to Use This Lesson

1. **Start with warm-up exercises** - Quick refreshers for each lesson
2. **Move to integration challenges** - Combine techniques from multiple lessons
3. **Tackle the mastery scenarios** - Real bioinformatics workflows
4. **Complete the graduation project** - Your final comprehensive challenge
5. **Keep the cheat sheet** - Reference guide for daily work

Don't rush. These exercises build muscle memory that will serve you for years.

## Warm-Up Exercises: Lesson by Lesson

### Lesson 1: Basic Navigation and Editing

**Create a file:**
```bash
vim warmup1.txt
```

Press `i`, type:
```
The quick brown fox jumps over the lazy dog.
VIM is a powerful text editor.
Practice makes perfect.
```

Press `ESC`, `:wq`.

**Exercises:**
1. Open the file: `vim warmup1.txt`
2. Navigate to "powerful" using `j`, `k`, `h`, `l`
3. Delete the "p" in "powerful": `x`
4. Enter insert mode and fix it: `i`, type `p`, `ESC`
5. Go to end of first line: `A`, add " quickly", `ESC`
6. Move to "Practice": position cursor, press `i`, type "Daily ", `ESC`
7. Save and exit: `:wq`

**Skills tested:** Navigation, `x`, `i`, `A`, saving

---

### Lesson 2: Deletion and Undo

**Create a file:**
```bash
vim warmup2.txt
```

Press `i`, type:
```
sample_001 control batch_A
sample_002 treated batch_A
sample_003 control batch_B
sample_004 treated batch_B
# Old comment to delete
# Another old comment
threads=8
memory=16G
quality_cutoff=20
```

Press `ESC`, `:wq`.

**Exercises:**
1. Open file: `vim warmup2.txt`
2. Delete "sample_001": `dw`
3. Undo: `u`
4. Delete entire first line: `dd`
5. Undo: `u`
6. Delete the two comment lines: position on first comment, `2dd`
7. Delete from cursor to end of line on "threads=8": move to `=`, `d$`
8. Undo all: `u` repeatedly
9. Jump to start: `0` (on any line)
10. Jump to line 5: `5G`
11. Save: `:w`

**Skills tested:** `dw`, `dd`, `d$`, `u`, `0`, `#G`

---

### Lesson 3: Cut, Paste, Replace, Change

**Create a file:**
```bash
vim warmup3.txt
```

Press `i`, type:
```
genome=/data/genomes/hg38.fa
annotation=/data/annotations/old_version.gtf
threads=4
memory=8G
samples: sample_001, sample_002
output=/results/temporary/
```

Press `ESC`, `:wq`.

**Exercises:**
1. Open file: `vim warmup3.txt`
2. Move "threads=4" line below "memory=8G": `dd`, `j`, `p`
3. Replace "4" with "8" in threads: position on `4`, `r8`
4. Change "old_version" to "gencode.v38": position on `old_version`, `cw`, type `gencode.v38`, `ESC`
5. Change "8G" to "32G": position on `8`, `cw`, type `32`, `ESC`
6. Delete "temporary/" and replace with "analysis/": `de` (or `cw`), type new text
7. Replace entire output line: `cc`, type new line, `ESC`
8. Save: `:w`

**Skills tested:** `dd`, `p`, `r`, `cw`, `ce`, `cc`

---

### Lesson 4: Search and Substitution

**Create a file:**
```bash
vim warmup4.txt
```

Press `i`, type:
```
#!/bin/bash
INPUT=/data/old_project/samples
OUTPUT=/results/old_project/
SAMPLE_PREFIX=old_sample
for file in ${INPUT}/*.fastq.gz; do
    echo "Processing ${file}"
    fastqc ${file} -o ${OUTPUT}
done
# Process old_sample_001
# Process old_sample_002
# Process old_sample_003
```

Press `ESC`, `:wq`.

**Exercises:**
1. Open: `vim warmup4.txt`
2. Search for "old_project": `/old_project`, `ENTER`
3. Jump to next match: `n`
4. Jump to previous: `N`
5. Replace all "old_project" with "rnaseq_2024": `:%s/old_project/rnaseq_2024/g`, `ENTER`
6. Replace "old_sample" with "sample" (with confirmation): `:%s/old_sample/sample/gc`, press `y` for each
7. Jump to line 5: `5G`
8. Jump to end of file: `G`
9. Jump to start: `gg`
10. Find matching brace: position on `{`, press `%`

**Skills tested:** `/`, `n`, `N`, `:s`, `:%s/old/new/g`, `gg`, `G`, `%`

---

### Lesson 5: Shell Integration

**Create a file:**
```bash
vim warmup5.txt
```

Press `i`, type:
```
# Analysis Log
Date: 
Working Directory: 
Available Samples:

Configuration Block:
threads=16
memory=32G

System Information:
```

Press `ESC`, `:wq`.

**Exercises:**
1. Open: `vim warmup5.txt`
2. Navigate to "Date:" line, go to end: `A`
3. Add a space, `ESC`
4. Insert current date: `:r !date`, `ENTER`
5. Navigate to "Working Directory:" line
6. Insert current path: `:r !pwd`, `ENTER`
7. Navigate to "Available Samples:" line
8. Insert sample listing: `:r !ls /data/samples 2>/dev/null || echo "No samples directory"`
9. Select the configuration block: `V`, select lines with `j`
10. Save selection: `:'<,'>w config_only.txt`, `ENTER`
11. Verify: `:!cat config_only.txt`, `ENTER`
12. Navigate to "System Information:" line
13. Insert system info: `:r !uname -a`, `ENTER`
14. Save: `:w`

**Skills tested:** `:!command`, `:r !command`, `V` selection, `:'<,'>w`

---

### Lesson 6: Advanced Insertion and Yanking

**Create a file:**
```bash
vim warmup6.txt
```

Press `i`, type:
```
def process_sample(sample_id):
    input_file = f"{sample_id}.fastq"
    output_file = f"{sample_id}_processed.bam"
    return output_file

samples = ["sample_001", "sample_002"]
```

Press `ESC`, `:wq`.

**Exercises:**
1. Open: `vim warmup6.txt`
2. Add blank line before function: navigate to function line, `O`, `ESC`
3. Add comment in that line: `i`, type `# Main processing function`, `ESC`
4. Add line after function: navigate to `return` line, `o`, type `# TODO: Add error handling`, `ESC`
5. Yank the entire function: navigate to `def` line, `V`, select all function lines with `j`, `y`
6. Paste at end of file: `G`, `p`
7. Delete the pasted copy: `5dd` (or appropriate number)
8. Yank one line from samples list: `yy`
9. Paste and modify: `p`, then `cw` to change sample number
10. Move to end of any word: `e`
11. Append text: `a`, type text, `ESC`
12. Replace multiple characters: position cursor, `R`, type replacement, `ESC`

**Skills tested:** `o`, `O`, `yy`, `p`, `V` + `y`, `e`, `a`, `R`

---

### Lesson 7: Settings and Help

**Exercises:**
1. Open VIM: `vim`
2. Get help on yank: `:help yy`
3. Navigate help, follow a link: position on `|motion|`, `Ctrl-]`
4. Go back: `Ctrl-O`
5. Close help: `:q`
6. Open a file: `:e test.txt`
7. Enable line numbers: `:set number`
8. Enable search highlighting: `:set hlsearch`
9. Search for something: `/test`
10. Clear highlights: `:noh`
11. Try command completion: `:set ` then `Ctrl-D`
12. Use tab completion: `:set nu` then `Tab`
13. Check a setting: `:set number?`
14. Disable line numbers: `:set nonumber`

**Skills tested:** `:help`, `Ctrl-W Ctrl-W`, `:set`, `Ctrl-D`, `Tab` completion

---

### Lesson 8: Configuration

**Exercise:**
1. Open your .vimrc: `vim ~/.vimrc`
2. Add a new setting: `set relativenumber`
3. Add a comment: `" Show relative line numbers for easier jumping`
4. Save: `:wq`
5. Open VIM again: `vim test.txt`
6. Verify setting works
7. If you don't like it, remove from .vimrc
8. Practice sourcing: `:source ~/.vimrc` (reload config without restarting)

**Skills tested:** .vimrc editing, configuration

---

## Integration Challenges: Combining Multiple Skills

These challenges require combining techniques from multiple lessons.

### Challenge 1: Pipeline Script Refactoring

**Setup:**
```bash
vim pipeline.sh
```

Create this script:
```bash
#!/bin/bash
# Old RNA-seq Pipeline
INPUT_DIR=/data/old_project/raw
OUTPUT_DIR=/results/old_project/
SAMPLE_PREFIX=old_sample
THREADS=4
MEMORY=8

for sample in old_sample_001 old_sample_002 old_sample_003; do
    echo "Processing ${sample}"
    fastqc ${sample}.fastq -o ${OUTPUT_DIR}
done
```

**Tasks:**
1. Search and replace all "old_project" with "rnaseq_2024"
2. Update sample prefix throughout
3. Change THREADS from 4 to 16
4. Change MEMORY from 8 to 32
5. Copy the entire for loop and paste it below
6. In the pasted copy, change "fastqc" to "trimmomatic"
7. Add comments above each section
8. Add a timestamp comment at the top using `:r !date`
9. Save as "pipeline_refactored.sh" using `:w pipeline_refactored.sh`

**Skills used:** Search/replace, change, yank/paste, shell commands, save as

---

### Challenge 2: Configuration File Cleanup

**Setup:**
```bash
vim config_messy.yaml
```

Create this config:
```yaml
# Old Configuration
version: 1.0
project: old_project_name
threads: 8
memory: 16G
samples:
  - old_sample_001
  - old_sample_002
  - old_sample_003
  - old_sample_004
paths:
  genome: /data/genomes/hg38.fa
  annotation: /data/annotations/old_version.gtf
  output: /results/temporary/old_project/
quality:
  min_quality: 20
  min_length: 50
# Delete this old section
old_parameter: value
deprecated_setting: true
```

**Tasks:**
1. Delete the entire "Delete this old section" (3 lines)
2. Update version to 2.0
3. Replace project name with "rnaseq_analysis_2024"
4. Increase threads to 16
5. Update all "old_sample" to "sample" in the samples list
6. Change annotation path from "old_version.gtf" to "gencode.v38.gtf"
7. Replace "temporary" in output path
8. Copy the quality section and paste at the end
9. In the pasted section, change to "advanced_quality" settings
10. Add a comment at top with generation date (`:r !date`)
11. Extract just the paths section: visually select it, save to "paths_only.yaml"
12. Verify extraction: `:!cat paths_only.yaml`

**Skills used:** Deletion, change, search/replace, yank/paste, visual selection, save selection, shell commands

---

### Challenge 3: Sample Sheet Creation

**Setup:**
```bash
vim samples.csv
```

Start with:
```
sample_id,condition,batch,replicate
sample_001,control,A,1
sample_002,control,A,2
```

**Tasks:**
1. Add a header comment line above: `O`, type `# RNA-seq Sample Sheet`, `ESC`
2. Yank the last sample line: `yy`
3. Paste it 3 times: `p`, `p`, `p`
4. Change sample_003 to treated: use `cw` to change "control"
5. Change sample_004 to treated, batch B
6. Change sample_005 to control, batch B
7. Add a timestamp line at top: `gg`, `O`, `:r !date`, `ESC`
8. Add total sample count at bottom: `G`, `o`, `:r !echo "Total samples: $(wc -l < samples.csv)"`, `ESC`
9. Search for all "control" samples: `/control`
10. Verify count: press `n` to cycle through
11. Replace batch "A" with "batch_2024_A" throughout: `:%s/,A,/,batch_2024_A,/g`
12. Save

**Skills used:** Open lines, yank/paste, change, search, substitution, shell integration

---

### Challenge 4: Function Documentation

**Setup:**
```bash
vim analysis.py
```

Create this:
```python
import pandas as pd
import numpy as np

def process_data(input_file):
    data = pd.read_csv(input_file)
    filtered = data[data['quality'] > 30]
    return filtered

def calculate_stats(dataframe):
    mean = dataframe['value'].mean()
    std = dataframe['value'].std()
    return mean, std

def save_results(data, output_file):
    data.to_csv(output_file, index=False)
    print(f"Saved to {output_file}")
```

**Tasks:**
1. Add docstrings to each function:
   - Position cursor on first function definition line
   - `o` to open line below
   - Type `"""Process and filter data"""`
   - `ESC`
   - Repeat for other functions
2. Add parameter documentation:
   - After docstring, `o`, type `Args:`, `o`, type parameter info
3. Yank the entire first function: `V`, select, `y`
4. Paste at end: `G`, `p`
5. Modify pasted function to create new variant
6. Add file header comment:
   - `gg`, `O`, type header
   - `:r !date` to add timestamp
7. Replace "quality" threshold: `:%s/30/25/g`
8. Add import statement: `gg`, after imports, `o`, type new import
9. Find all function definitions: `/def `
10. Jump between them with `n`

**Skills used:** Open lines, yank/paste, search/replace, shell commands, navigation

---

## Real-World Bioinformatics Scenarios

These are actual tasks you'll perform regularly in bioinformatics work.

### Scenario 1: Fix Failed Pipeline

**Context:** Your Snakemake pipeline failed. You need to update paths and parameters.

**Setup:**
```bash
vim Snakefile
```

Create realistic Snakefile content:
```python
rule all:
    input:
        "results/counts.txt"

rule fastqc:
    input:
        "data/raw/{sample}.fastq.gz"
    output:
        "results/qc/{sample}_fastqc.html"
    params:
        outdir="results/qc"
    threads: 4
    shell:
        "fastqc {input} -o {params.outdir} -t {threads}"

rule align:
    input:
        "data/raw/{sample}.fastq.gz"
    output:
        "results/bam/{sample}.bam"
    params:
        genome="/data/genomes/hg38.fa"
    threads: 8
    shell:
        "hisat2 -x {params.genome} -U {input} | samtools view -bS - > {output}"
```

**Tasks:**
1. Search for all rules: `/^rule`
2. Increase all thread counts by 2x
3. Change genome path: find `/data/genomes/hg38.fa`, replace with new path
4. Add a new rule by copying existing rule: yank entire rule block, paste, modify
5. Update output directories: replace `results/` with `output/2024/`
6. Add comments above each rule explaining what it does
7. Add timestamp at top: `:r !date`
8. Check syntax: `:!snakemake -n 2>&1 | head`

**Skills applied:** Search, substitution, yank/paste, change, shell integration

---

### Scenario 2: Update Sample Metadata

**Context:** You received updated sample information and need to merge it into your metadata file.

**Setup:**
```bash
vim metadata.csv
```

Existing metadata:
```
sample_id,age,sex,condition
sample_001,45,M,control
sample_002,52,F,control
sample_003,48,M,treated
```

**Tasks:**
1. Add new columns: position at end of header, `A`, add `,batch,date`
2. For each data line, add batch and date info
3. Insert date stamp: `:r !date +\%Y-\%m-\%d`
4. Copy date, paste into each row
5. Add 5 more sample rows by copying and modifying existing
6. Search for all control samples: `/control`
7. Replace ages: change specific ages with `cw`
8. Add comment header with file info
9. Generate sample count: `:r !echo "# Total: $(wc -l < metadata.csv) lines"`
10. Extract just control samples: 
    - Yank header: `yy`
    - Paste into new buffer: `:e controls_only.csv`, `p`
    - Go back: `Ctrl-^` (or `:e #`)
    - Yank control lines with visual select
    - Switch back, paste

**Skills applied:** Insertion, yank/paste, search, change, multiple files

---

### Scenario 3: Log File Analysis

**Context:** Your pipeline crashed. Analyze the log to find the error.

**Setup:**
```bash
vim pipeline.log
```

Create a long log:
```
[2024-01-15 10:00:00] Pipeline started
[2024-01-15 10:00:05] Loading configuration
[2024-01-15 10:00:10] Processing sample_001
[2024-01-15 10:00:45] Sample_001 QC: PASS
[2024-01-15 10:01:00] Processing sample_002
[2024-01-15 10:01:35] Sample_002 QC: PASS
[2024-01-15 10:02:00] Processing sample_003
[2024-01-15 10:02:15] ERROR: File not found: /data/sample_003.fastq.gz
[2024-01-15 10:02:15] WARNING: Alignment step skipped for sample_003
[2024-01-15 10:02:20] Processing sample_004
[2024-01-15 10:02:55] Sample_004 QC: PASS
[2024-01-15 10:03:00] ERROR: Insufficient memory for alignment
[2024-01-15 10:03:00] Pipeline terminated with errors
```

**Tasks:**
1. Jump to end to see final error: `G`
2. Search backward for "ERROR": `?ERROR`
3. Find next error: `n`
4. Find all errors: `/ERROR`, then `n` repeatedly
5. Jump to specific timestamp: `/10:02:15`
6. Extract all error lines:
   - Search: `/ERROR`
   - Yank line: `yy`
   - Paste in new file: `:e errors_only.txt`, `p`
   - Repeat for all errors
7. Add analysis notes:
   - `o`, type your analysis
8. Count total errors: `:!grep -c ERROR pipeline.log`
9. Insert that count: `:r !grep -c ERROR pipeline.log`

**Skills applied:** Search, navigation, yank/paste, shell integration, multiple files

---

## The Graduation Project

This comprehensive project tests everything you've learned. Complete it successfully, and you've mastered VIM.

### Project: Complete Analysis Pipeline Setup

**Objective:** Create a complete RNA-seq analysis pipeline configuration from scratch using only VIM.

**Requirements:**

1. **Create the main configuration file** (`config.yaml`):
   - Include all standard parameters
   - Add timestamp
   - Include system information
   - Document each section with comments

2. **Create the sample sheet** (`samples.csv`):
   - 10 samples minimum
   - Include metadata columns
   - Generate partially by copying and modifying
   - Add header comments with date and project info

3. **Create the main script** (`run_analysis.sh`):
   - Bash script that reads the config
   - Loops through samples
   - Calls analysis tools
   - Include extensive comments
   - Copy/modify functions for different steps

4. **Create documentation** (`README.md`):
   - Project description
   - Include directory listings from actual filesystem
   - Include timestamp
   - Document configuration
   - Extract relevant sections from config.yaml

**Specific Tasks:**

**Part 1: Configuration File**
```bash
vim config.yaml
```

Create complete configuration including:
- Project metadata (use `:r !date` for dates)
- Paths (verify they exist with `:!ls /path`)
- Tool parameters
- Resource allocations
- Extract computational parameters to separate file

**Part 2: Sample Sheet**
```bash
vim samples.csv
```

Build sample sheet:
- Create header
- Create first sample entry
- Yank and paste 9 more times
- Modify each efficiently (change sample IDs, conditions, batches)
- Add summary statistics using shell commands
- Extract control samples to separate file

**Part 3: Analysis Script**
```bash
vim run_analysis.sh
```

Create bash script:
- Shebang and header comments with date
- Source the configuration
- Create functions for each analysis step
- Copy and modify functions for different tools
- Add error checking
- Include logging statements

**Part 4: Documentation**
```bash
vim README.md
```

Create documentation:
- Project title and date
- Insert directory structure (`:r !tree -L 2` or `:r !ls -R`)
- Document configuration (yank from config.yaml)
- Insert sample statistics
- Add usage instructions
- Insert command examples

**Completion Criteria:**

- [ ] Used search and replace to update parameters throughout
- [ ] Used yank/paste to duplicate and modify code blocks
- [ ] Used shell integration to insert live system information
- [ ] Used visual selection to extract specific sections
- [ ] Used open lines (`o`, `O`) for efficient content addition
- [ ] Navigated efficiently with search, line jumps, and motions
- [ ] Made no use of mouse or arrow keys
- [ ] Created at least one file using `:e` from within VIM
- [ ] Used `:w filename` to save sections to new files
- [ ] All files properly formatted and functional

**Time Goal:** Complete in 30-45 minutes using only VIM commands (no external editors, no mouse).

---

## The Ultimate VIM Cheat Sheet

### Lesson 1: Navigation and Basic Editing

```
STARTING VIM:
  vim filename          Open file
  vim                   Open empty buffer

NAVIGATION:
  h j k l              Left, Down, Up, Right
  Arrow keys           Also work for navigation

MODES:
  ESC                  Return to Normal mode (from any mode)
  i                    Insert before cursor
  A                    Append at end of line
  
EDITING:
  x                    Delete character under cursor
  
SAVE/EXIT:
  :w                   Save file
  :q                   Quit (if no unsaved changes)
  :wq                  Save and quit
  :q!                  Quit without saving
```

### Lesson 2: Deletion and Undo

```
DELETION:
  dw                   Delete word forward
  de                   Delete to end of word
  d$                   Delete to end of line
  dd                   Delete entire line
  3dd                  Delete 3 lines
  
MOTION MULTIPLIERS:
  2w                   Move forward 2 words
  5j                   Move down 5 lines
  
NAVIGATION:
  0                    Jump to start of line
  
UNDO/REDO:
  u                    Undo last change
  U                    Undo all changes on current line
  Ctrl-R               Redo (undo the undo)
  
GRAMMAR:
  operator [number] motion
  Example: d3w = delete 3 words
```

### Lesson 3: Paste, Replace, Change

```
PASTE:
  p                    Paste after cursor/below line
  P                    Paste before cursor/above line
  
REPLACE:
  r[char]              Replace character under cursor
  
CHANGE (delete + insert):
  cw                   Change word forward
  ce                   Change to end of word
  c$                   Change to end of line
  cc                   Change entire line
  3cw                  Change 3 words
  
NOTE: Deleted text is stored and can be pasted
```

### Lesson 4: Search and Replace

```
POSITION:
  Ctrl-G               Show file position
  gg                   Jump to first line
  G                    Jump to last line
  [number]G            Jump to line number (e.g., 42G)
  
SEARCH:
  /pattern             Search forward
  ?pattern             Search backward
  n                    Next match (same direction)
  N                    Previous match (opposite direction)
  Ctrl-O               Jump to older position
  Ctrl-I               Jump to newer position
  %                    Jump to matching bracket
  
SUBSTITUTE:
  :s/old/new           Replace first on line
  :s/old/new/g         Replace all on line
  :#,#s/old/new/g      Replace in line range
  :%s/old/new/g        Replace in entire file
  :%s/old/new/gc       Replace with confirmation
  :%s/\<old\>/new/g    Replace whole word only
```

### Lesson 5: Shell Integration

```
EXTERNAL COMMANDS:
  :!command            Execute shell command
  :!ls                 List directory
  :!ls -lh /path       Detailed listing
  
SAVE OPERATIONS:
  :w filename          Save as filename
  :w! filename         Save as (overwrite)
  
VISUAL SELECTION:
  v                    Enter visual mode (character)
  V                    Enter visual line mode
  :'<,'>w filename     Save selected lines
  
READ OPERATIONS:
  :r filename          Insert file contents
  :r !command          Insert command output
  :r !date             Insert current date
  :r !ls /path         Insert directory listing
```

### Lesson 6: Yank, Insert, Replace Mode

```
OPEN LINES:
  o                    Open line below, enter Insert
  O                    Open line above, enter Insert
  
INSERTION:
  a                    Insert after cursor
  A                    Insert at end of line
  
MOTION:
  e                    Move to end of word
  
YANK (COPY):
  yy                   Yank (copy) line
  3yy                  Yank 3 lines
  yw                   Yank word
  y$                   Yank to end of line
  V [move] y           Yank visual selection
  
REPLACE MODE:
  R                    Enter Replace mode
  [type text]          Overwrites existing text
  ESC                  Exit Replace mode
```

### Lesson 7: Settings

```
SETTINGS:
  :set ic              Ignore case in search
  :set noic            Case-sensitive search
  :set is              Incremental search
  :set hls             Highlight search
  :noh                 Clear highlights
  :set number          Show line numbers
  :set nonumber        Hide line numbers
  :set mouse=a         Enable mouse
  :set option?         Check if option is set
```

### Lesson 8: Help and Configuration

```
HELP:
  :help                Open main help
  :help command        Help for specific command
  :help 'option'       Help for setting
  Ctrl-]               Follow help link
  Ctrl-O               Go back in help
  :q                   Close help window
  
WINDOWS:
  Ctrl-W Ctrl-W        Switch between windows
  Ctrl-W q             Close current window
  
COMMAND COMPLETION:
  Ctrl-D               Show all completions
  Tab                  Cycle through completions
  
CONFIGURATION:
  ~/.vimrc             Configuration file location
  :source ~/.vimrc     Reload configuration
  " comment            Comment syntax in .vimrc
  set option           Set option (no colon in .vimrc)
```

### Quick Reference: Most Used Commands

```
MUST-KNOW COMMANDS (Daily use):
  i, A, o, O           Insert modes
  ESC                  Back to Normal
  h j k l              Navigation
  dd, dw, d$           Delete
  yy, p                Copy/paste
  u, Ctrl-R            Undo/redo
  /pattern, n, N       Search
  :%s/old/new/g        Replace all
  :w, :q, :wq          Save/quit
  gg, G, #G            Jump around
  
EFFICIENCY BOOSTERS:
  cw, ce, cc           Change commands
  0, $                 Line start/end
  V, y, p              Visual yank/paste
  :!command            Shell commands
  :r !command          Insert command output
  Ctrl-W Ctrl-W        Switch windows
  
POWER USER:
  :%s/old/new/gc       Confirm each replace
  :'<,'>w file         Save selection
  :set hls is ic       Search settings
  R                    Replace mode
  Ctrl-O, Ctrl-I       Jump history
```

### VIM Grammar Summary

```
COMMAND STRUCTURE:
  [count] operator [count] motion

OPERATORS:
  d                    Delete
  c                    Change
  y                    Yank (copy)
  
MOTIONS:
  w                    Word forward
  e                    End of word
  $                    End of line
  0                    Start of line
  G                    End of file
  gg                   Start of file

EXAMPLES:
  d3w                  Delete 3 words
  c$                   Change to end of line
  y5j                  Yank 5 lines down
  2dd                  Delete 2 lines
```

### Common Patterns by Task

```
NAVIGATE TO LOCATION:
  /text + ENTER        Search for text
  #G                   Jump to line number
  gg / G               Top / bottom of file
  
FIX A TYPO:
  /typo                Find it
  cw                   Change the word
  r[char]              Replace single character
  
DELETE CONTENT:
  dd                   Delete line
  d$ or D              Delete to end of line
  dw                   Delete word
  3dd                  Delete 3 lines
  
COPY AND PASTE:
  yy                   Copy line
  3yy                  Copy 3 lines
  p                    Paste below
  P                    Paste above
  
MOVE A LINE:
  dd                   Cut line
  [navigate]           Move cursor
  p                    Paste
  
ADD NEW LINES:
  o                    New line below
  O                    New line above
  
CHANGE TEXT:
  cw                   Change word
  ce                   Change to end of word
  c$                   Change to end of line
  cc                   Change entire line
  
SEARCH AND REPLACE:
  /pattern             Find first
  n                    Find next
  :%s/old/new/g        Replace all
  :%s/old/new/gc       Replace with confirmation
  
INSERT EXTERNAL CONTENT:
  :r filename          Insert file
  :r !date             Insert date
  :r !ls /path         Insert directory listing
  
SAVE SECTIONS:
  V [select]           Select lines
  :'<,'>w file         Save selection
  
RUN COMMANDS:
  :!ls /path           Execute and view
  :!command            Run any shell command
```

### Bioinformatics-Specific Workflows

```
UPDATE SAMPLE IDs:
  :%s/old_id/new_id/g
  
FIX FILE PATHS:
  :%s#/old/path#/new/path#g
  (Note: using # as delimiter avoids escaping /)
  
ADD COMMENTS TO CODE:
  O                    (on function line)
  # Comment            Type comment
  ESC
  
COPY FUNCTION DEFINITION:
  V                    (on function start)
  [select function]    Use j to select all lines
  y                    Yank
  G                    Go to end
  p                    Paste
  
EXTRACT CONFIGURATION:
  V                    Select config section
  :'<,'>w config.yaml
  
INSERT SAMPLE COUNTS:
  :r !ls /data/samples/*.fastq.gz | wc -l
  
CHECK FILE EXISTS:
  :!ls /path/to/file
  
DOCUMENT ANALYSIS:
  :r !date             Add timestamp
  :r !pwd              Add working directory
  :r !ls -lh /results  Add results listing
  
BUILD SAMPLE LIST:
  yy                   Yank one sample line
  p                    Paste
  cw                   Change sample ID
  (Repeat for all samples)
```

---

## Mastery Self-Assessment

Complete this checklist honestly. If you can do all of these, you've mastered VIM.

### Navigation (Lesson 1)
- [ ] Move efficiently using hjkl without thinking about it
- [ ] Enter Insert mode and return to Normal mode reflexively
- [ ] Navigate to specific locations without arrow keys
- [ ] Save and exit VIM in multiple ways
- [ ] Never need to close terminal when stuck in VIM

### Deletion and Undo (Lesson 2)
- [ ] Delete words, lines, and portions of lines fluently
- [ ] Use multipliers to delete multiple items (3dd, 5dw)
- [ ] Jump to line numbers and line start
- [ ] Undo and redo changes confidently
- [ ] Understand the operator + motion grammar

### Cut, Paste, Change (Lesson 3)
- [ ] Move lines and text blocks efficiently
- [ ] Replace single characters with r
- [ ] Change words and line portions with c commands
- [ ] Use p and P to paste deleted content
- [ ] Combine deletion and pasting for rearranging

### Search and Replace (Lesson 4)
- [ ] Jump to any location in file instantly
- [ ] Search forward and backward
- [ ] Navigate between search matches
- [ ] Perform file-wide substitutions
- [ ] Use confirmation when needed
- [ ] Find matching brackets with %

### Shell Integration (Lesson 5)
- [ ] Execute shell commands from within VIM
- [ ] Insert command output into files
- [ ] Read external files into current buffer
- [ ] Save visual selections to new files
- [ ] Work seamlessly between VIM and shell

### Advanced Editing (Lesson 6)
- [ ] Open new lines above and below efficiently
- [ ] Yank (copy) text without deleting
- [ ] Paste yanked content multiple times
- [ ] Use Replace mode appropriately
- [ ] Navigate to word endings with e

### Settings and Help (Lesson 7 & 8)
- [ ] Access VIM help system when needed
- [ ] Navigate help documentation
- [ ] Configure VIM with settings
- [ ] Maintain a .vimrc configuration
- [ ] Use command completion
- [ ] Customize VIM for personal workflow

### Integration and Efficiency
- [ ] Combine multiple commands in workflows
- [ ] Edit files without conscious thought about commands
- [ ] Prefer VIM over other editors for remote work
- [ ] Teach others basic VIM usage
- [ ] Solve real bioinformatics tasks entirely in VIM

---

## Next Steps: Beyond Essential VIM

You've mastered essential VIM. Here's what to explore next:

### Advanced Topics

**Macros** - Record command sequences and replay them
```
qa                   Start recording to register 'a'
[perform actions]    Do your edits
q                    Stop recording
@a                   Replay macro
@@                   Replay last macro
```

**Multiple Files and Buffers**
```
:e file2.txt         Open another file
:ls                  List open buffers
:b2                  Switch to buffer 2
:bn                  Next buffer
:bp                  Previous buffer
```

**Split Windows**
```
:split               Horizontal split
:vsplit              Vertical split
Ctrl-W s             Horizontal split (same as :split)
Ctrl-W v             Vertical split (same as :vsplit)
Ctrl-W hjkl          Navigate between splits
```

**Tabs**
```
:tabnew              New tab
:tabnext / :tabprev  Navigate tabs
gt / gT              Navigate tabs (Normal mode)
```

**Advanced Registers**
```
"ayy                 Yank to register 'a'
"ap                  Paste from register 'a'
:reg                 View all registers
```

**Marks**
```
ma                   Set mark 'a' at cursor
'a                   Jump to mark 'a'
:marks               View all marks
```

**Visual Block Mode**
```
Ctrl-V               Enter visual block mode
[select columns]     Move cursor to select rectangular area
I                    Insert at start of each line
c                    Change selected blocks
```

**Plugins** - Extend VIM's functionality:
- vim-plug (plugin manager)
- NERDTree (file explorer)
- fzf.vim (fuzzy file finder)
- vim-airline (status line)
- vim-fugitive (Git integration)
- coc.nvim (code completion)

### Practice Recommendations

**Daily Practice:**
1. Use VIM exclusively for one week
2. Edit at least 3 files daily using only VIM commands
3. Challenge yourself: no mouse, no arrow keys
4. Time yourself on repeated tasks to track improvement

**Weekly Challenges:**
1. Complete the graduation project again, faster
2. Learn one new command from help system
3. Add one new setting to .vimrc
4. Teach a VIM command to a colleague

**Monthly Goals:**
1. Explore an advanced topic (macros, splits, etc.)
2. Install and configure one plugin
3. Create a custom key mapping
4. Share your .vimrc with others

### Resources for Continued Learning

**Built-in Resources:**
```
:help user-manual    Complete user manual
:help howto          Task-oriented help
:help tips           Tips and tricks
vimtutor             Interactive tutorial (run from terminal)
```

**Online Resources:**
- VIM Adventures (game to learn VIM)
- VIM Golf (code golf for VIM commands)
- r/vim subreddit
- VIM Wikia
- Practical Vim by Drew Neil (book)

---

## Your VIM Journey

### Where You Started
- Couldn't exit VIM
- Afraid of remote servers
- Deleted entire files by accident
- Preferred downloading files to edit locally

### Where You Are Now
- Navigate files at the speed of thought
- Edit configuration files confidently on HPC clusters
- Perform complex text transformations in seconds
- Maintain a personalized, portable editing environment
- Solve bioinformatics tasks entirely from the terminal

### What You've Gained
- **Efficiency:** Edit faster than with graphical editors
- **Portability:** Work identically on any Unix system
- **Confidence:** Never fear being stuck in VIM
- **Skills:** A toolset that will serve your entire career
- **Understanding:** The power of modal editing

---

## Final Challenge: The VIM Master Test

Complete this test in one VIM session. Time yourself. A VIM master completes it in under 20 minutes.

**Setup:**
```bash
mkdir vim_master_test
cd vim_master_test
vim challenge.txt
```

**Tasks:**

1. Create a file with RNA-seq pipeline parameters (from memory, no copying)
2. Add a timestamp using shell integration
3. Add 10 sample entries by copying and modifying
4. Perform a file-wide search and replace
5. Extract a section to a new file
6. Insert directory listing
7. Move sections around
8. Add comprehensive comments
9. Create a second related file without leaving VIM
10. Navigate between both files
11. Save both files

**Completion criteria:**
- Both files properly formatted
- All tasks completed using VIM commands
- No mouse usage
- No external editor usage
- Clean, efficient command usage

---

## Congratulations!

You've completed the VIM Essentials for Bioinformatics series. You started as a beginner who couldn't exit VIM. Now you're a competent VIM user who can:

✓ Edit any file on any remote server  
✓ Navigate and manipulate text efficiently  
✓ Integrate VIM with your shell environment  
✓ Maintain a personalized configuration  
✓ Solve real bioinformatics problems entirely in VIM  

**VIM is now your tool.** You've invested the time to learn it properly, and that investment will pay dividends throughout your career. Every configuration file you edit, every script you write, every log file you analyze—VIM makes these tasks faster and more efficient.

Keep practicing. Keep exploring. Keep improving your .vimrc. VIM's depth is nearly infinite, but you now have the foundation to explore it confidently.

**Welcome to the community of VIM users.** You've earned your place.

---

## Keep This Cheat Sheet Handy

Print or save the cheat sheet section. Keep it visible while working. Reference it when you forget a command. Within weeks, you won't need it—the commands will be muscle memory.

## Share Your Journey

Mastered VIM? Help others:
- Share your .vimrc with colleagues
- Show teammates useful commands
- Answer VIM questions
- Write about your VIM workflow

The VIM community thrives on sharing knowledge. Now you can contribute.

---

*This concludes the VIM Essentials for Bioinformatics series. You came to learn an editor. You leave with a superpower. Happy editing, VIM master.*

**Series Complete: 9 Lessons**  
**Commands Mastered: 100+**  
**Skills Gained: Priceless**  

Now go forth and edit efficiently. Your bioinformatics work will never be the same.

{% include next-prev.html %}