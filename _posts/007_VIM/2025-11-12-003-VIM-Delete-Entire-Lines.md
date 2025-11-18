---
date: 2025-11-12 12:29:19
layout: post
title: Delete Entire Lines in One Keystroke
subtitle: Stop Deleting Character by Character—Learn VIM's Grammar of Editing
description: Discover VIM's composable command structure that lets you delete words, lines, and text blocks with single commands. Learn the operator-motion pattern that makes VIM exponentially more powerful than holding down the delete key.


series: VIM Essentials for Bioinformatics
series_sing: true
video_number: 003
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


You're reviewing a failed pipeline's configuration file. There's a line that needs to go—a parameter that's causing problems. In a normal editor, you'd select the entire line with your mouse (or hold Shift and press arrow keys multiple times), then delete it. In VIM, you press `dd`. The line vanishes instantly.

This is where VIM starts feeling like magic. You're about to learn the grammar that makes VIM not just a text editor, but an editing *language*.

## Creating Our Practice File

Let's create a realistic bioinformatics script to work with—a pipeline configuration that needs cleanup:

```bash
vim cleanup_demo.sh
```

Press `i` to enter Insert Mode, then type or paste:

```python
#!/bin/bash
# RNA-seq quality control pipeline
# TODO: update paths before running

fastqc_threads=8
trimmomatic_threads=4
memory_limit=16G

# Input files
raw_data=/data/fastq/
reference_genome=/genomes/hg38.fa
adapter_file=/adapters/truseq.fa

# Run quality control
fastqc --threads 8 input/*.fastq -o qc_results/
echo "Quality control complete"

# Trimming step (optional)
trimmomatic PE -threads 4 input.fastq trimmed.fastq ILLUMINACLIP:adapters.fa:2:30:10

# Additional processing steps
echo "Pipeline started"
multiqc qc_results/ -o multiqc_report/
echo "Pipeline complete"
```

Press `ESC`, type `:wq`, press `ENTER`. Now we have a real file to practice on.

## The Problem with Character-by-Character Deletion

In our last lesson, you learned `x` deletes one character. That's fine for fixing typos, but what about deleting entire words? Whole lines? Everything from your cursor to the end of a line?

Holding down `x` works, but it's slow and error-prone. You might delete too much or too little. VIM has a better way: **deletion commands that operate on text objects**.

## Command 1: Delete Word Forward (`dw`)

Open our practice file:
```bash
vim cleanup_demo.sh
```

Navigate to the line with `trimmomatic_threads=4`. Position your cursor on the word `trimmomatic` (use `j` to move down, `0` to jump to the start of the line—we'll cover `0` more later).

Now press `dw`.

The word `trimmomatic` disappears, leaving `_threads=4`. The `d` means "delete" and the `w` means "word forward." Together, `dw` means "delete from cursor to the start of the next word."

**Why this matters:** You're editing a sample name that's wrong:
```
sample_old_batch1_rep1.fastq
```

Position cursor on `old`, press `dw`, and you get:
```
sample_batch1_rep1.fastq
```

One command. Instant. No selecting, no holding delete.

**Important detail:** `dw` deletes the word AND the space after it. This is usually what you want—when removing words from a sentence, you want the spacing to remain correct.

## Command 2: Delete to End of Word (`de`)

Sometimes you want to delete just the word itself, not the trailing space. That's `de`.

Navigate to the line `memory_limit=16G`. Position cursor on `limit`, press `de`.

The word `limit` disappears, but the `=` stays right next to `memory`. You get `memory=16G`.

**The difference:**
- `dw` = delete word including trailing space (for deleting words in text)
- `de` = delete to end of word only (for editing within code/parameters)

**Practical example:** You have a typo in a variable name:
```
fastqc_thredas=8
```

Position cursor on `thredas`, press `de`, press `i`, type `threads`, press `ESC`. Fixed. The `de` command removed just the wrong word, leaving the `=8` intact.

## Command 3: Delete to End of Line (`d$`)

Often you need to delete everything from your cursor to the end of the line. Press `d$`.

Navigate to the comment line `# TODO: update paths before running`. Position your cursor on the word `update`. Press `d$`.

Everything from `update` onwards disappears. You're left with `# TODO: `.

**Common scenario:** You're updating an output path:
```
output_dir=/scratch/old_project/results/batch1/
```

You want to keep `/scratch/` but change the rest. Position cursor on `old_project`, press `d$`, press `i`, type the new path, press `ESC`.

**Pro tip:** Think of `$` as "end of line" (like in regex). So `d$` literally means "delete to end of line."

## Command 4: Delete Entire Line (`dd`)

This is the command you'll use constantly. Press `dd` and the entire line under your cursor disappears.

Find the line that says `echo "Pipeline started"`. Position your cursor anywhere on that line—doesn't matter where. Press `dd`.

The line vanishes. The line below moves up to fill the gap.

**Why this is powerful:** You're cleaning up a log file or removing debugging statements from a script. Instead of selecting the entire line (go to start, select to end, delete), you just put your cursor on the line and press `dd`. Done.

**Real workflow:** Your pipeline has old commented-out code:
```
# Old trimming parameters
# trimmomatic PE -threads 2 input.fastq output.fastq
# minlen=36 avgqual=20
```

Navigate to the first line, press `dd`. Second line, press `dd`. Third line, press `dd`. Three unwanted lines removed in seconds.

## The Grammar of VIM: Operator + Motion

Here's where VIM becomes truly powerful. Commands like `dw`, `de`, and `d$` aren't random memorizations—they follow a pattern:

```
operator + motion
```

**Operator:** What to do (`d` = delete)  
**Motion:** Where to do it (`w` = word, `e` = end of word, `$` = end of line)

This means VIM's commands are *composable*. Learn a few operators and a few motions, and you can combine them in dozens of ways.

**More motion examples:**
- `w` = forward one word
- `e` = to end of current word
- `$` = to end of line
- `0` = to start of line (we'll use this next)

So `d` + any motion = delete to that location.

This pattern extends beyond deletion (we'll learn more operators in future lessons), but for now, understand that VIM's commands have structure and logic, not arbitrary memorization.

## Command 5: Jump to Start of Line (`0`)

Press `0` (zero) and your cursor jumps to the first character of the current line.

Navigate to any line in your file. Press `l` a bunch of times to move right. Now press `0`. You're instantly at the start of the line.

**Why you'll use this constantly:**

You're on a long line and need to edit something at the beginning:
```
output_file=/scratch/user/project/rnaseq/results/sample_001_trimmed_filtered_aligned.bam
```

Instead of holding `h` to move left forever, press `0`. You're at the start immediately.

**Combining with deletion:** Remember `d$` deletes to end of line? Now you know `0` jumps to the start. So:
- `0` then `d$` = delete entire line content (different from `dd`, which also removes the line itself)

## Command 6: Multipliers (Repeat Commands)

Here's where VIM gets really efficient. You can prepend any motion with a number to repeat it:

- `2w` = move forward 2 words
- `3j` = move down 3 lines
- `5l` = move right 5 characters

**Try this:** Navigate to any line. Press `3j`. You jump down 3 lines. Press `5w`. You jump forward 5 words.

**Why this matters:** You're scanning through a sample sheet:
```
sample_001,control,A
sample_002,control,A
sample_003,treated,A
sample_004,treated,B
sample_005,control,B
```

You need to check every 5th sample. Press `5j` to jump 5 lines down. Press `5j` again. You're moving through the file precisely and quickly.

### Multipliers with Deletion

Here's the real power: you can multiply *operators* too.

**Delete multiple words:** `d3w` = delete 3 words forward  
**Delete multiple lines:** `3dd` = delete 3 lines

Let's practice. Find these lines in your file:
```
# Additional processing steps
echo "Pipeline started"
multiqc qc_results/ -o multiqc_report/
echo "Pipeline complete"
```

Position your cursor on the line `echo "Pipeline started"`. Press `3dd`.

All three lines disappear in one command. You deleted 3 lines with three keystrokes.

**Real scenario:** Your script has a block of old debugging output:
```
echo "Debug: starting analysis"
echo "Debug: loading data"
echo "Debug: processing samples"
echo "Debug: writing output"
```

Position cursor on the first debug line. Press `4dd`. All debug lines gone instantly.

### The Full Grammar

Now you understand VIM's complete command structure:

```
[number] operator [number] motion
```

Examples:
- `d2w` = delete 2 words forward
- `2dd` = delete 2 lines
- `d5l` = delete 5 characters to the right (rarely used, but valid)

**In practice, you'll mostly use:**
- `dw`, `de`, `d$` for single operations
- `3dd`, `5dd` for multiple lines
- `2w`, `3j` for navigation jumps

The pattern is consistent: number first for how many, operator for what to do, motion for where to do it.

## Command 7: Undo and Redo

You will make mistakes. You'll delete the wrong thing. VIM makes this safe with undo.

**Undo last action:** Press `u` (lowercase)

Try it now. Delete a line with `dd`, then press `u`. The line comes back.

Press `u` again. The action before that undoes. Keep pressing `u` to step backward through your changes.

**Undo all changes on current line:** Press `U` (capital U)

This is useful when you've made multiple edits to one line and want to reset it to its original state.

**Redo (undo the undo):** Press `Ctrl-R`

You undid too many changes? Press `Ctrl-R` to redo, moving forward through your change history.

**Practice this workflow:**
1. Delete a line with `dd`
2. Delete another line with `dd`  
3. Press `u` - second deletion undoes
4. Press `u` - first deletion undoes
5. Press `Ctrl-R` - first deletion redoes
6. Press `Ctrl-R` - second deletion redoes

You can navigate your entire editing history backward and forward. This makes VIM safe to experiment with—nothing is permanent until you save.

**Real scenario:** You're cleaning up a configuration file. You delete several lines with `dd`, then realize you deleted one you needed. Press `u` a few times until it comes back, then continue editing. No panic, no stress.

## Practice Workflow: Cleaning Up a Script

Let's put everything together. Reopen our file:
```bash
vim cleanup_demo.sh
```

**Task 1: Remove the TODO comment**
- Navigate to the line `# TODO: update paths before running`
- Press `dd`
- The line disappears

**Task 2: Fix a variable name**
- Navigate to `trimmomatic_threads=4`
- Position cursor on `trimmomatic`
- Press `dw` (deletes the word)
- Press `i`, type `trim`, press `ESC`
- Now it reads `trim_threads=4`

**Task 3: Shorten a path**
- Navigate to `reference_genome=/genomes/hg38.fa`
- Position cursor on `/genomes/hg38.fa`
- Press `d$` (delete to end of line)
- Press `i`, type `/ref/hg38.fa`, press `ESC`

**Task 4: Remove multiple comment lines**
- Navigate to the first echo statement
- Count how many echo lines there are (3)
- Press `3dd`
- All three echo lines disappear

**Task 5: Undo that last deletion**
- Press `u`
- The three lines come back
- Maybe you wanted to keep them after all

Save and exit: `:wq`

## Real-World Applications

These commands handle everyday bioinformatics editing tasks:

### Cleaning Sample Sheets
```
sample_001_old_naming,control,batch_A
sample_002_old_naming,treated,batch_A
```

Position cursor on `_old_naming` in first line, press `de`, repeat for other lines (we'll learn faster ways to repeat soon).

### Removing Failed Samples
Your sample sheet has entries for failed samples. Position cursor on each failed sample line, press `dd`. They're gone.

### Editing Long Paths
```
input_bam=/data/projects/rnaseq/collaborator_name/batch_2023/processed/aligned/
```

Position cursor on `collaborator_name`, press `d$`, type new path structure.

### Deleting Debug Statements
Your script has 10 debug print statements. Navigate to each, press `dd`. Or navigate to the first, press `10dd` if they're consecutive.

### Fixing Parameter Names
```
old_parameter_name=value
```

Press `0` to jump to start, press `dw` to delete `old_parameter_name`, press `i`, type the correct name.

## Common Patterns You'll Use Daily

**Delete word under cursor:** Position cursor on word, press `dw`

**Delete from cursor to end:** Press `d$`

**Delete entire line:** Press `dd` (cursor can be anywhere on the line)

**Delete multiple lines:** Press `3dd`, `5dd`, etc.

**Undo mistake:** Press `u`

**Jump to line start:** Press `0`

**Move several lines quickly:** Press `5j` or `5k`

These patterns become muscle memory within a week of regular use.

## Understanding Delete vs. Remove

A subtle but important point: when you "delete" in VIM, you're not just removing text—you're *cutting* it. The deleted text goes into a register (VIM's clipboard) and can be pasted elsewhere.

We'll cover this properly in the next lesson on copying and pasting, but know that `dd` doesn't destroy the line—it cuts it. This makes `dd` useful for moving lines around, not just removing them.

## Why This Changes Everything

With character-by-character deletion (just `x`), editing feels mechanical and slow. You think in terms of individual keystrokes: "move cursor, delete, delete, delete..."

With these commands, you think in terms of intentions: "delete this word," "remove this line," "clear to end of line." Your edits match your thoughts. You express what you want to happen, and VIM does it.

This is VIM's editing grammar in action. You're composing commands from operators and motions, creating exactly the edit you need. And because it's grammar, not memorization, you can start improvising: "I know `d` deletes and `$` is end of line, so `d$` probably deletes to end of line." And it does.

## Practice Exercises

Create and edit these files to build muscle memory:

### Exercise 1: Clean a Configuration

Create a messy config:
```bash
vim messy_config.txt
```

Press `i`, add:
```
# Old configuration file
threads_old=4
memory_setting_outdated=8
output_directory_path=/old/path/here/
temp_files=/tmp/old/
reference_genome_file=/genomes/old_version.fa
# End of old config
```

Practice:
1. Delete the entire first comment line (`dd`)
2. On line with `threads_old`, delete just `_old` (position cursor, `de`)
3. On line with `memory_setting_outdated`, delete from `_setting` onwards (`d$`), then append correct value
4. Delete the last comment line (`dd`)
5. Undo all changes (`u` repeatedly) and watch your edits rewind
6. Exit without saving (`:q!`)

### Exercise 2: Remove Debug Output

Create a script:
```bash
vim debug_script.sh
```

Press `i`, add:
```
echo "Starting pipeline"
echo "DEBUG: loading libraries"
echo "DEBUG: checking input files"
echo "Processing samples"
echo "DEBUG: sample count is 10"
echo "DEBUG: running analysis"
echo "Pipeline complete"
```

Practice:
1. Delete all DEBUG lines (use `dd` on each, or `3dd` if they're consecutive)
2. Undo (`u`)
3. Try deleting them again with different approaches
4. Save (`:wq`)

### Exercise 3: Edit Paths

Create a path configuration:
```bash
vim paths.txt
```

Press `i`, add:
```
input=/data/raw/fastq/batch_001/lane_1/
output=/results/processed/aligned/batch_001/lane_1/
temp=/scratch/temporary/processing/batch_001/lane_1/
```

Practice:
1. On each line, delete from `batch_001` onwards (`d$`)
2. Type new shorter paths
3. Use `0` to jump to line starts
4. Use `u` to undo and try different approaches

## Mental Model: Thinking in Text Objects

Start thinking of your text as objects, not characters:
- **Words** are objects you can delete with `dw` or `de`
- **Lines** are objects you can delete with `dd`
- **From here to there** is an object you can delete with `d` + motion

When you need to make an edit, ask yourself:
- "What text object am I changing?" (word? line? to end of line?)
- "What's the motion to that object?" (`w`, `e`, `$`, etc.)
- "What operator do I need?" (for now, just `d` for delete)

Then compose: operator + motion = command.

This mental shift—from "I need to delete these individual characters" to "I need to delete this word"—is what makes VIM feel natural once it clicks.

## Quick Reference

```
DELETION:
  dw       - delete word forward (including space)
  de       - delete to end of word (no space)
  d$       - delete to end of line
  dd       - delete entire line
  3dd      - delete 3 lines

NAVIGATION:
  0        - jump to start of line
  2w       - move forward 2 words
  3j       - move down 3 lines

UNDO/REDO:
  u        - undo last change
  U        - undo all changes on current line
  Ctrl-R   - redo (undo the undo)
```

## What You've Learned

You now understand VIM's editing grammar:
- Operators (`d` for delete) combined with motions (`w`, `e`, `$`)
- Multipliers to repeat commands (`3dd`, `5j`)
- The `0` key to jump to line starts
- Undo/redo to safely experiment

More importantly, you're starting to think in VIM's language. You're not deleting character by character—you're operating on text objects with single commands.

## What's Next

In the next lesson, we'll learn the rest of VIM's core editing operations:
- Copying (yanking) text
- Pasting (putting) text
- Changing text (delete + insert in one command)
- Visual mode for selecting text
- Search and replace basics

But for now, practice these deletion commands until they're automatic. Open configuration files, scripts, and data files on your remote servers. Make edits using `dw`, `dd`, `d$`. Get comfortable with undo. Build the muscle memory.

You're moving from "I can use VIM" to "I can edit efficiently in VIM." That's real progress.

---

*You're no longer fighting VIM—you're speaking its language. Next time: copying, pasting, and truly powerful text manipulation.*

{% include next-prev.html %}