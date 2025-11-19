---
date: 2025-11-14 12:29:19
layout: post
title: Search and Replace Like a Pro
subtitle: Jump to Any Text Instantly and Replace Across Entire Files in Seconds
description: Master VIM's search, navigation, and substitution commands that let you find text instantly, jump between matches, and perform complex find-and-replace operations across hundreds of lines. Learn the commands that make editing large genomics files effortless.


series: VIM Essentials for Bioinformatics
series_sing: true
video_number: 005
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


You're reviewing a 500-line pipeline script. You need to find every occurrence of an old sample ID and replace it with a new one. In a graphical editor, you'd scroll through the file, use find-and-replace dialog boxes, click through confirmations. In VIM, you type `:%s/old_id/new_id/gc`, press Enter, and quickly confirm each replacement with `y` or `n`.

This is where VIM's power becomes undeniable. You can jump to any text in a file instantly, navigate between matches with single keystrokes, and perform complex substitutions that would require custom scripts in other editors.

Let's learn these essential navigation and editing commands.

## Creating Our Practice File

We'll create a realistic bioinformatics analysis script with multiple issues we need to fix using search and replace:

```bash
vim analysis_pipeline.py
```

Press `i` to enter Insert Mode, then type or paste:

```python
#!/usr/bin/env python3
# RNA-seq Analysis Pipeline
# Process samples and generate counts

import os
import sys
from pathlib import Path

# Configuration
SAMPLE_PREFIX = "sample_old"
REFERENCE_GENOME = "/data/genomes/hg38.fa"
ANNOTATION_FILE = "/data/annotations/gencode.gtf"
OUTPUT_DIR = "/results/rnaseq"

# Sample information
samples = [
    "sample_old_001",
    "sample_old_002", 
    "sample_old_003",
    "sample_old_004",
    "sample_old_005"
]

def process_sample(sample_name):
    """Process a single sample through the pipeline"""
    input_file = f"{sample_name}.fastq.gz"
    output_bam = f"{sample_name}_aligned.bam"
    
    # Quality control step
    qc_command = f"fastqc {input_file} -o {OUTPUT_DIR}/qc"
    print(f"Running QC for {sample_name}")
    os.system(qc_command)
    
    # Alignment step
    align_command = f"hisat2 -x {REFERENCE_GENOME} -U {input_file} | samtools view -bS - > {output_bam}"
    print(f"Aligning {sample_name}")
    os.system(align_command)
    
    # Count generation
    count_command = f"featureCounts -a {ANNOTATION_FILE} -o {sample_name}_counts.txt {output_bam}"
    print(f"Generating counts for {sample_name}")
    os.system(count_command)
    
    return output_bam

def process_all_samples():
    """Process all samples in the list"""
    results = []
    for sample in samples:
        print(f"Processing sample: {sample}")
        bam_file = process_sample(sample)
        results.append(bam_file)
    return results

def main():
    """Main pipeline execution"""
    print("Starting RNA-seq pipeline")
    print(f"Output directory: {OUTPUT_DIR}")
    
    # Create output directory if it doesn't exist
    Path(OUTPUT_DIR).mkdir(parents=True, exist_ok=True)
    
    # Process all samples
    bam_files = process_all_samples()
    
    print(f"Pipeline complete. Processed {len(bam_files)} samples")
    print(f"Results saved to {OUTPUT_DIR}")

if __name__ == "__main__":
    main()
```

Press `ESC`, type `:wq`, press `ENTER`. Now we have a realistic Python script with several items we need to find and fix.

## Command 1: File Position and Jumping - `Ctrl-G`, `G`, `gg`

Before you can navigate efficiently, you need to know where you are in the file.

### Check Your Position: `Ctrl-G`

Open the file:
```bash
vim analysis_pipeline.py
```

Press `Ctrl-G` (hold Control, press G).

At the bottom of the screen, you'll see something like:
```
"analysis_pipeline.py" 67 lines --100%--
```

Or if you're partway through the file:
```
"analysis_pipeline.py" line 15 of 67 --22%--
```

This tells you:
- The filename
- Current line number and total lines
- Percentage through the file

**Why this matters:** When debugging pipelines or reviewing logs, knowing exactly where you are helps communicate with colleagues ("the error is at line 45") and track your progress through large files.

### Jump to End of File: `G` (Shift-G)

Press `G` (capital G, so Shift-G).

Your cursor jumps to the last line of the file. Instantly. No scrolling, no holding down arrow keys.

**Real-world usage:** You're reviewing a log file. You want to see the most recent entries at the bottom. Press `G`, and you're there.

### Jump to Start of File: `gg`

Press `gg` (lowercase g, twice).

Your cursor jumps to the first line of the file.

**Try this now:** Press `G` to jump to the end, then `gg` to jump back to the start. These two commands let you bounce between file extremes instantly.

### Jump to Specific Line Number: `[number]G`

Want to jump to line 25? Type `25G` (type 25, then press Shift-G).

Your cursor jumps directly to line 25.

**Example workflow:** Your pipeline failed with "Error at line 42". Type `42G`, and you're looking at exactly where the problem is.

**Practice:**
- Type `10G` - jump to line 10
- Type `30G` - jump to line 30
- Type `1G` - jump to line 1 (same as `gg`)
- Press `G` - jump to end

These commands are essential for navigating large files. No more scrolling through hundreds of lines to find a specific location.

## Command 2: Search - `/` and `?`

Jumping to line numbers is useful when you know the line. But often you need to find text: a function name, a variable, a sample ID. VIM's search is incredibly fast and powerful.

### Search Forward: `/`

Press `/` (forward slash).

The cursor jumps to the bottom of the screen, and you see `/` waiting for your search term.

Type `sample_old` and press `ENTER`.

VIM highlights the first occurrence of "sample_old" after your cursor position and jumps there. The search wraps around—if it reaches the end of the file, it continues from the beginning.

**Try it now:**
1. Press `gg` to go to the top of the file
2. Press `/`
3. Type `process_sample`
4. Press `ENTER`

Your cursor jumps to the first occurrence of "process_sample" in the file.

### Search Backward: `?`

Press `?` (question mark).

Type your search term and press `ENTER`.

VIM searches backward (upward) from your current position.

**Example:**
1. Press `G` to jump to the end of the file
2. Press `?`
3. Type `import`
4. Press `ENTER`

You jump backward to the last "import" statement in the file.

### Navigate Between Matches: `n` and `N`

After searching, you often need to find the next occurrence.

**`n` (next):** Repeats the search in the same direction
**`N` (previous):** Repeats the search in the opposite direction

**Try this workflow:**
1. Press `gg` to go to the top
2. Press `/sample_old` and `ENTER`
3. Press `n` - jumps to next occurrence
4. Press `n` again - next occurrence
5. Press `n` again - next occurrence
6. Press `N` - jumps back to previous occurrence

You can cycle through all matches in the file with `n` and `N`. This is how you review every occurrence of a variable or sample ID.

**Real-world scenario:** Your script references a configuration file path in multiple places. Search for the path with `/path`, then press `n` repeatedly to visit each occurrence and verify they're all correct.

### Case Sensitivity

By default, VIM searches are case-sensitive. `/Sample` won't match "sample".

To make a search case-insensitive, add `\c` to your search:
```
/\csample
```

This matches "sample", "Sample", "SAMPLE", etc.

### Search Highlights

VIM highlights all matches (if your version has this enabled). To clear highlights after you're done searching, type `:noh` (short for "no highlight") and press `ENTER`.

## Command 3: Jump History - `Ctrl-O` and `Ctrl-I`

VIM remembers where you've been in the file. When you jump around with searches or line numbers, you can navigate backward and forward through that history.

**`Ctrl-O` (O for "older"):** Jump to previous location
**`Ctrl-I` (I for... newer):** Jump to next location in history

**Try this:**
1. Press `gg` to go to line 1
2. Type `30G` to jump to line 30
3. Type `50G` to jump to line 50
4. Press `/OUTPUT_DIR` and `ENTER` to search
5. Now press `Ctrl-O` - jumps back to line 50
6. Press `Ctrl-O` again - jumps back to line 30
7. Press `Ctrl-O` again - jumps back to line 1
8. Press `Ctrl-I` - jumps forward to line 30
9. Press `Ctrl-I` - jumps forward to line 50

This jump history is incredibly useful when you're navigating a complex file, checking multiple locations, and need to backtrack.

**Real scenario:** You're in a 500-line script. You search for a function definition, check how it's called, jump to check a configuration value, then need to get back to where you started. Press `Ctrl-O` a few times, and you're back.

## Command 4: Matching Brackets - `%`

When writing or editing code, you often need to find matching brackets, parentheses, or braces.

Position your cursor on a `(`, `)`, `[`, `]`, `{`, or `}`, and press `%`.

Your cursor jumps to the matching bracket.

**Try this:**
1. Navigate to the line `def process_sample(sample_name):`
2. Position cursor on the opening `(` after "process_sample"
3. Press `%`
4. Your cursor jumps to the closing `)`
5. Press `%` again
6. Your cursor jumps back to the opening `(`

**More examples:**

Find the function with square brackets:
1. Navigate to `samples = [`
2. Position on the `[`
3. Press `%`
4. Jump to the matching `]` at the end of the list

Find matching braces in functions:
1. Navigate to `def main():`
2. Move down to the opening function (if there were braces, but in Python we look for other structures)

**Why this matters:** In complex nested code, finding matching brackets by counting is error-prone. Press `%` and VIM shows you exactly where a code block starts or ends.

## Command 5: Substitute (Find and Replace) - `:s`

This is where VIM becomes exceptionally powerful. The substitute command lets you find and replace text with incredible precision and flexibility.

### Basic Syntax

```
:s/old/new
```

This substitutes "new" for the first occurrence of "old" on the current line.

### Substitute All on Current Line: `:s/old/new/g`

The `g` flag means "global" (all occurrences on the line).

**Example:**
1. Navigate to the line `samples = [`
2. Type `:s/sample_old/sample_new/g`
3. Press `ENTER`

All occurrences of "sample_old" on that line become "sample_new".

### Substitute in a Range: `:#,#s/old/new/g`

Replace between specific line numbers:

```
:10,20s/sample_old/sample_new/g
```

This replaces all occurrences between lines 10 and 20.

**Try it:**
1. Type `:13,18s/sample_old/sample_new/g`
2. Press `ENTER`

All "sample_old" in the samples list (lines 13-18) become "sample_new".

### Substitute Throughout Entire File: `:%s/old/new/g`

The `%` means "entire file". This is the most commonly used form.

```
:%s/sample_old/sample_new/g
```

**Try this now:**
1. Type `:%s/sample_old/sample_new/g`
2. Press `ENTER`

Watch as VIM reports something like:
```
5 substitutions on 5 lines
```

Every occurrence of "sample_old" in the entire file is now "sample_new".

**This is incredibly powerful.** In one command, you've updated every reference throughout a 67-line file. No scrolling, no clicking, no missed instances.

### Substitute with Confirmation: `:%s/old/new/gc`

The `c` flag means "confirm each change". VIM stops at each match and asks what you want to do.

Let's change "sample_new" back to "sample_old", but with confirmation:

```
:%s/sample_new/sample_old/gc
```

At each match, VIM shows:
```
replace with sample_old (y/n/a/q/l/^E/^Y)?
```

Your options:
- **y** - yes, make this substitution
- **n** - no, skip this one
- **a** - all, substitute this and all remaining without asking
- **q** - quit, stop substituting
- **l** - last, make this substitution and quit

Press `y` a few times to confirm changes, or `a` to accept all remaining.

**When to use confirmation:** When you're not 100% sure the replacement should happen everywhere. For example, replacing "data" might catch "metadata" unintentionally. Confirmation lets you review each case.

## Real-World Examples

### Example 1: Update Sample IDs Throughout Pipeline

You need to change all sample IDs from "sample_old" to "batch2_sample":

```
:%s/sample_old/batch2_sample/g
```

One command updates the variable, the list, and all function calls.

### Example 2: Fix Path Typo

You misspelled a directory name throughout the file:

```
:%s/resulst/results/g
```

Every occurrence of the typo is fixed instantly.

### Example 3: Update Variable Names

You want to rename `OUTPUT_DIR` to `OUTPUT_PATH` for clarity:

```
:%s/OUTPUT_DIR/OUTPUT_PATH/g
```

**But wait!** This would also change "OUTPUT_DIRECTORY" if it existed. To match whole words only, use word boundaries:

```
:%s/\<OUTPUT_DIR\>/OUTPUT_PATH/g
```

The `\<` and `\>` ensure you only match "OUTPUT_DIR" as a complete word.

### Example 4: Update Function Names

Rename a function and all its calls:

```
:%s/process_sample/analyze_sample/g
```

Every definition and call is updated.

### Example 5: Change File Extensions

Update all file extensions from .bam to .sorted.bam:

```
:%s/\.bam/.sorted.bam/g
```

Note: The `.` is escaped with `\` because `.` is a special character in regex (matches any character). `\.` matches a literal period.

### Example 6: Selective Replacement in Range

Only update sample names in the sample list (lines 13-18):

```
:13,18s/sample_old/exp_sample/g
```

The rest of the file remains unchanged.

## Combining Search and Replace

Here's a powerful workflow:

1. **Search for text:** `/old_name` to see all occurrences
2. **Review matches:** Press `n` to visit each one
3. **Decide on replacement:** Once you've seen where it appears
4. **Substitute:** `:%s/old_name/new_name/gc` with confirmation
5. **Review each:** Press `y` or `n` for each match

This gives you complete control while being much faster than manual editing.

## Practice Exercises

Let's practice with our script. If you've already made changes, create the file again:

```bash
vim analysis_pipeline.py
```

### Exercise 1: Jump Around the File

1. Press `gg` - go to start
2. Press `G` - go to end
3. Type `20G` - go to line 20
4. Press `Ctrl-G` - check your location
5. Type `1G` - back to start

### Exercise 2: Search for Variables

1. Press `/OUTPUT_DIR` and `ENTER`
2. Press `n` to find next occurrence
3. Press `n` again
4. Press `N` to go back to previous
5. Press `Ctrl-O` to jump back to where you started

### Exercise 3: Find Matching Brackets

1. Navigate to any line with parentheses or brackets
2. Position cursor on an opening bracket
3. Press `%` to jump to closing bracket
4. Press `%` again to jump back

### Exercise 4: Replace Sample Prefix

Change all "sample_old" to "rna_sample":

```
:%s/sample_old/rna_sample/g
```

Verify: Press `/rna_sample` and use `n` to check all changes.

### Exercise 5: Selective Replacement

Change "print" to "logging.info" only in the main function (lines 53-62):

```
:53,62s/print/logging.info/g
```

### Exercise 6: Replace with Confirmation

Change all occurrences of "sample" to "specimen" with confirmation:

```
:%s/sample/specimen/gc
```

Press `y` or `n` for each match. Notice how it would catch "rna_sample" too—that's why confirmation is useful.

Press `q` to quit the substitution when you realize this affects too much.

Undo with `u`.

### Exercise 7: Fix Path Issues

Suppose you need to change the genome path. Search for it first:

```
/REFERENCE_GENOME
```

Press `ENTER`, then on that line:

```
:s#/data/genomes/hg38.fa#/reference/genomes/GRCh38/hg38.fa#
```

Note: We used `#` as the delimiter instead of `/` to avoid escaping slashes in the path. Any character can be a delimiter!

## Advanced Tips

### Using Different Delimiters

When your search or replacement contains many `/` characters (like file paths), use a different delimiter:

```
:%s#/old/path#/new/path#g
:%s|old_pattern|new_pattern|g
```

Any character can be the delimiter—use whatever makes your command most readable.

### Case-Insensitive Substitution

Add `\c` to make the search case-insensitive:

```
:%s/\csample/specimen/g
```

Matches "sample", "Sample", "SAMPLE", etc.

### Preserve Case During Replacement

VIM can't automatically preserve case, but you can use capture groups (advanced topic). For simple cases, do multiple targeted replacements:

```
:%s/Sample/Specimen/g
:%s/sample/specimen/g
```

### Count Matches Without Replacing

Want to know how many matches exist?

```
:%s/sample//gn
```

The `n` flag means "count only, don't substitute". VIM reports the count without making changes.

## Common Patterns

**Replace in entire file:**
```
:%s/old/new/g
```

**Replace with confirmation:**
```
:%s/old/new/gc
```

**Replace in range:**
```
:10,50s/old/new/g
```

**Replace whole words only:**
```
:%s/\<word\>/replacement/g
```

**Replace using different delimiter:**
```
:%s#/path/old#/path/new#g
```

**Case-insensitive replacement:**
```
:%s/\cold/new/g
```

## Why These Commands Matter

**Search (`/`, `?`, `n`, `N`)** lets you navigate files at the speed of thought. No scrolling, no visual scanning—just type what you're looking for and you're there.

**Jump commands (`gg`, `G`, `#G`)** let you move through files instantly. Reviewing a 1000-line script becomes manageable.

**Substitution (`:s`)** performs in seconds what would take minutes of manual editing. More importantly, it's accurate—you won't miss instances or make typos.

**Combined,** these commands transform how you work with large files. Configuration files with hundreds of parameters, scripts with thousands of lines, log files from failed pipelines—all become easily navigable and editable.

## Real-World Bioinformatics Impact

**Pipeline maintenance:** Update sample IDs across all scripts with one command.

**Configuration management:** Find and update paths, parameters, and settings quickly.

**Log analysis:** Jump to error lines, search for specific patterns, review all occurrences of warnings.

**Script refactoring:** Rename variables and functions accurately throughout codebases.

**Data file editing:** Update sample names, fix typos, modify paths in metadata files.

These aren't theoretical scenarios—you'll use these commands daily once they become natural.

## Quick Reference

```
NAVIGATION:
  Ctrl-G     - show file position and status
  gg         - jump to first line
  G          - jump to last line
  [number]G  - jump to specific line number
  
SEARCH:
  /pattern   - search forward
  ?pattern   - search backward
  n          - next match (same direction)
  N          - previous match (opposite direction)
  Ctrl-O     - jump to older position
  Ctrl-I     - jump to newer position
  %          - jump to matching bracket
  
SUBSTITUTE:
  :s/old/new              - replace first on line
  :s/old/new/g            - replace all on line
  :#,#s/old/new/g         - replace in line range
  :%s/old/new/g           - replace in entire file
  :%s/old/new/gc          - replace with confirmation
  :%s/\<old\>/new/g       - replace whole word only
  :%s#old/path#new/path#g - using different delimiter
```

## What You've Mastered

You now know how to:
- Navigate files instantly with jumps and searches
- Find any text in seconds
- Move between matches effortlessly
- Perform complex find-and-replace operations
- Update multiple occurrences throughout large files
- Review and confirm changes selectively

Combined with the deletion, change, and paste commands from previous lessons, you now have a complete VIM editing toolkit.

## What's Next

In the next lesson, we'll cover:
- Visual mode for selecting text
- Copying (yanking) text
- Working with multiple files
- Split windows
- More advanced text object selections

But for now, practice these search and substitution commands. They're among the most powerful and frequently used commands in VIM.

Open your real work files—configuration files, scripts, sample sheets—and practice:
- Searching for variables and functions
- Jumping between matches
- Performing substitutions
- Using confirmation when uncertain

The search and replace workflow will quickly become second nature, and you'll wonder how you ever edited large files without it.

---

*You can now navigate and transform files with surgical precision. Next time: Visual mode and advanced text selection that makes VIM feel like it can read your mind.*

{% include next-prev.html %}