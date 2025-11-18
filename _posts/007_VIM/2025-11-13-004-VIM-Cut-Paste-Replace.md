---
date: 2025-11-13 12:29:19
layout: post
title: Cut, Paste, and Transform Text in Seconds
subtitle: Replace, Change, and Rearrange Without Ever Reaching for Your Mouse
description: Master VIM's put, replace, and change commands that transform how you edit text. Learn to paste deleted content, replace characters instantly, and change entire text blocks with single commands—the editing operations you'll use hundreds of times per day.


series: VIM Essentials for Bioinformatics
series_sing: true
video_number: 004
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


# VIM Essentials for Bioinformatics: Cut, Paste, and Transform Text in Seconds

## Replace, Change, and Rearrange Without Ever Reaching for Your Mouse

**Description:** Master VIM's put, replace, and change commands that transform how you edit text. Learn to paste deleted content, replace characters instantly, and change entire text blocks with single commands—the editing operations you'll use hundreds of times per day.

---

You've deleted a line with `dd`. Immediately, you realize you need it somewhere else in the file. In most editors, you'd think "oops, undo, cut, move, paste." In VIM, you just navigate to where you want it and press `p`. The line appears. Done.

This is VIM's approach to text manipulation: deleted text isn't destroyed—it's cut and ready to paste. Combine this with commands that let you replace characters instantly or change entire text objects in one motion, and you have an editing workflow that's fundamentally more efficient than traditional select-delete-retype cycles.

Let's learn these essential operations.

## Creating Our Practice File

We'll create a realistic bioinformatics configuration file that needs editing—a Snakemake workflow with some issues we need to fix:

```bash
vim workflow_config.txt
```

Press `i` to enter Insert Mode, then type:

```
# Snakemake Workflow Configuration
# RNA-seq Analysis Pipeline

# Sample Information
samples = ["sample_001", "sample_002", "sample_003"]
conditions = ["control", "treated", "control"]

# Reference Files
genome = "/data/genomes/hg38.fa"
annotation = "/data/annotations/gencode.v38.gtf"
adapters = "/data/adaptors/truseq.fa"

# Tool Parameters
fastqc_threads = 4
trimmomatic_threads = 8
alignment_threads = 16

# Quality Control
min_quality = 20
min_length = 50
adapter_mismatch = 2

# Output Directories
qc_output = "/results/quality_control"
trim_output = "/results/trimed_reads"
alignment_output = "/results/alignments"

# Pipeline Options
run_fastqc = True
run_trimming = True
skip_alignment = False
```

Press `ESC`, type `:wq`, press `ENTER`. Now we have a file with several issues we can fix using today's commands.

## Command 1: Put (Paste) - The `p` Command

When you delete text in VIM with `dd`, `dw`, `d$`, or `x`, that text isn't gone—it's stored in a register (VIM's clipboard). The `p` command pastes this deleted text.

**How `p` works:**
- For deleted characters or words: pastes AFTER the cursor
- For deleted lines: pastes BELOW the current line

Let's practice. Open the file:

```bash
vim workflow_config.txt
```

### Example 1: Moving a Line

Navigate to the line `adapters = "/data/adaptors/truseq.fa"` (use `j` to move down).

**Task:** This line should be with the other reference files, but it's separated. Let's move it.

1. Press `dd` - the line is deleted (cut)
2. Press `k` to move up one line (to the `annotation` line)
3. Press `p` - the deleted line appears below the cursor

Your reference files section now looks like:

```
genome = "/data/genomes/hg38.fa"
annotation = "/data/annotations/gencode.v38.gtf"
adapters = "/data/adaptors/truseq.fa"
```

The line moved exactly where you wanted it. Three keystrokes: `dd`, `k`, `p`.

### Example 2: Moving Multiple Lines

Navigate to the "Pipeline Options" section (the last four lines). These should be at the top of the file after the comment header.

**Task:** Move all four pipeline option lines to the top.

1. Position cursor on `# Pipeline Options`
2. Press `4dd` - deletes 4 lines (cut)
3. Press `gg` to jump to the top of the file (we'll learn this properly later, but it jumps to line 1)
4. Press `2j` to move down 2 lines (below the comment header)
5. Press `p` - all four lines paste below the cursor

Now your pipeline options appear near the top where they're more visible.

**Important:** When you paste lines with `p`, they go below the current line. If you want them above, use `P` (capital P) instead—it pastes before/above the cursor.

### Example 3: Word-Level Cut and Paste

Navigate to the line `trim_output = "/results/trimed_reads"`. There's a typo: "trimed" should be "trimmed".

One approach: delete the word and retype it. But here's a VIM approach:

1. Position cursor on the word `trimed`
2. Press `dw` - deletes the word
3. Type `trimmed` - type the correct word
4. Press `ESC`

Actually, there's an even better way using the change command (we'll cover this next), but this demonstrates that `dw` cuts the word, making it available to paste elsewhere if needed.

## Command 2: Replace Character - The `r` Command

The `r` command replaces the single character under your cursor with whatever you type next. It's incredibly efficient for fixing typos.

**How `r` works:**
1. Position cursor on the wrong character
2. Press `r`
3. Type the correct character
4. You're automatically back in Normal Mode

No need to enter Insert Mode, delete, type, and exit. Just `r` and the new character.

### Example 1: Fix a Typo

Navigate to line `adapters = "/data/adaptors/truseq.fa"`. The directory name has a typo—"adaptors" should be "adapters" (with an 'e').

1. Position cursor on the `o` in "adaptors"
2. Press `r`
3. Type `e`

The `o` becomes `e` instantly. The path now correctly reads "adapters".

**Compare this to other editors:**
- Mouse: click, select character, delete, type new character
- Keyboard: arrow to position, backspace, type new character
- VIM: position cursor, `r`, type character

VIM's method is faster and requires no mode switching.

### Example 2: Fixing Boolean Values

Navigate to `skip_alignment = False`. You want to change this to `True`.

1. Position cursor on `F` in `False`
2. Press `r`
3. Type `T`
4. Move to `a`, press `r`, type `r`
5. Move to `l`, press `r`, type `u`
6. Move to `s`, press `r`, type `e`
7. Move to `e`, press `x` to delete it

Actually, this is tedious. For replacing multiple characters, there's a better command: change (next section). But `r` is perfect for single-character fixes.

**Better approach for this case:** Use the change command `cw` (change word) which we'll cover next.

### Example 3: Quick Symbol Fixes

Navigate to `min_quality = 20`. You want to change the `=` to `:` for some reason.

1. Position cursor on `=`
2. Press `r`
3. Type `:`

Changed instantly.

**Real-world usage:** Fixing punctuation, changing operators, correcting single-character typos in variable names, fixing path separators—any single-character replacement is faster with `r`.

## Command 3: Change - The `c` Operator

The change command is like delete, but it automatically puts you in Insert Mode afterward. It's a delete + insert in one operation.

**Format:** `c` + motion

Just like delete (`d`), change works with motions:
- `cw` - change from cursor to start of next word
- `ce` - change to end of current word
- `c$` - change to end of line
- `c3w` - change 3 words
- `cc` - change entire line (like `dd` but enters Insert Mode)

### Example 1: Change Word (`cw`)

Navigate to the line `fastqc_threads = 4`. You want to change this to `fastqc_cores = 4`.

1. Position cursor on the `t` in `threads`
2. Press `cw`
3. VIM deletes "threads " and enters Insert Mode
4. Type `cores`
5. Press `ESC`

The word changed in one command. No separate delete and insert steps.

**What happened:** `cw` deleted from cursor to the start of the next word (including the space), then automatically entered Insert Mode so you could type the replacement.

### Example 2: Change to End of Word (`ce`)

Navigate to `alignment_threads = 16`. Change "alignment" to "align".

1. Position cursor on the `m` in "alignment"
2. Press `ce` - deletes "ment" and enters Insert Mode
3. Press `ESC` (we're just shortening, no need to add text)

Result: `align_threads = 16`

**The difference between `cw` and `ce`:**
- `cw` changes to the start of the next word (includes trailing space)
- `ce` changes to the end of current word (no trailing space)

Use `ce` when changing part of a word or variable name. Use `cw` when replacing entire words in text.

### Example 3: Change to End of Line (`c$`)

Navigate to `qc_output = "/results/quality_control"`. You want to change the entire path.

1. Position cursor on the `/` in the path
2. Press `c$`
3. Everything from cursor to end of line is deleted, and you're in Insert Mode
4. Type `/output/qc/`
5. Press `ESC`

**Compare to the manual way:**
- Press `d$` to delete to end of line
- Press `i` to enter Insert Mode
- Type new text
- Press `ESC`

With `c$`, you skip the `i` step—it's automatic.

### Example 4: Change Entire Line (`cc`)

Navigate to the comment line `# Quality Control`. You want to rewrite this comment.

1. Press `cc`
2. The entire line is deleted and you're in Insert Mode (cursor is indented if there was indentation)
3. Type `# QC Parameters`
4. Press `ESC`

**Compare to `dd` then `i`:**
- `dd` deletes line, next line moves up
- `o` or `O` to open new line and enter Insert Mode
- Type text
- `ESC`

With `cc`, it's just: delete current line content, enter Insert Mode, type, done.

### Example 5: Change Multiple Words

Navigate to `conditions = ["control", "treated", "control"]`. You want to change the list to just `["untreated", "treated"]`.

1. Position cursor on the `[` bracket
2. Press `c$` to change to end of line
3. Type `["untreated", "treated"]`
4. Press `ESC`

Or, if you just want to change from "control" to the end:

1. Position cursor on `"control"`
2. Press `c3w` (change 3 words: "control", "treated", "control")
3. Type `"untreated", "treated"]`
4. Press `ESC`

## The Grammar Pattern: Change Follows Delete

Notice the pattern? Change uses the same grammar as delete:

**Delete:**
- `dw` - delete word
- `de` - delete to end of word
- `d$` - delete to end of line
- `dd` - delete line
- `d3w` - delete 3 words

**Change:**
- `cw` - change word
- `ce` - change to end of word
- `c$` - change to end of line
- `cc` - change line
- `c3w` - change 3 words

The only difference: change automatically enters Insert Mode after deleting. It's a convenience for the very common delete-and-replace workflow.

**The full grammar:**
```
[number] operator [number] motion
```

Where operator can be:
- `d` - delete (stays in Normal Mode)
- `c` - change (enters Insert Mode)

This composability is VIM's power. Learn a few operators and a few motions, and you can combine them in dozens of ways.

## Practical Workflows

### Workflow 1: Rearranging Lines

You need to move configuration sections around:

1. Navigate to the line to move
2. Press `dd` (or `3dd` for multiple lines)
3. Navigate to destination
4. Press `p` to paste below, or `P` to paste above

**Example:** Moving all thread configurations together:
1. Delete each thread config line with `dd`
2. Move to where you want them
3. Paste with `p`

### Workflow 2: Fixing Typos

Single character typo:
1. Navigate to wrong character
2. Press `r`, type correct character

Word typo:
1. Navigate to wrong word
2. Press `cw`
3. Type correct word
4. Press `ESC`

### Workflow 3: Updating Values

Changing a parameter value:
1. Navigate to the value
2. Press `cw` (or `ce` if no space after)
3. Type new value
4. Press `ESC`

**Example:** Changing `min_quality = 20` to `min_quality = 30`:
1. Position cursor on `20`
2. Press `cw`
3. Type `30`
4. Press `ESC`

### Workflow 4: Rewriting Sections

Need to rewrite from cursor to end of line:
1. Press `c$`
2. Type new content
3. Press `ESC`

Need to rewrite entire line:
1. Press `cc`
2. Type new content
3. Press `ESC`

## Combining with Previous Commands

You can combine today's commands with everything you've learned:

**Delete and paste multiple lines:**
```
5dd    - delete 5 lines
/pattern - search for where to paste (we'll cover search later)
p      - paste the 5 lines
```

**Change with multipliers:**
```
c3w    - change 3 words
2cc    - change 2 lines
```

**Undo and redo:**
```
dd     - delete line
p      - paste it below
u      - undo the paste
u      - undo the delete
```

Everything composes together.

## Practice Exercises

Let's practice with our workflow file. Reopen it:

```bash
vim workflow_config.txt
```

### Exercise 1: Move Lines

Move the "Tool Parameters" section to be after "Reference Files":
1. Navigate to `# Tool Parameters`
2. Press `4dd` (to delete the section header and 3 parameter lines)
3. Navigate to the line after `adapters = ...`
4. Press `p`

### Exercise 2: Fix Typos with Replace

There are several typos in the file:
1. "trimed_reads" should be "trimmed_reads"
   - Navigate to the second `m` position (where it should be)
   - Press `i`, type `m`, press `ESC` (or wait for a better method)
   - Actually, navigate to `i` in "trimed"
   - Press `r`, type `m`
   - Move to `e`, press `r`, type `m`

Actually, this shows `r` isn't ideal for this. Better approach:

1. Navigate to `trimed`
2. Press `cw`
3. Type `trimmed`
4. Press `ESC`

### Exercise 3: Change Values

Update all thread counts to be multiples of 4:
1. Navigate to `fastqc_threads = 4`
2. Position on `4`, press `cw`, type `8`, press `ESC`
3. Navigate to `trimmomatic_threads = 8`
4. Position on `8`, press `cw`, type `12`, press `ESC`
5. Navigate to `alignment_threads = 16`
6. Position on `16`, press `cw`, type `16` (or leave it), press `ESC`

### Exercise 4: Rewrite a Path

Change the QC output path completely:
1. Navigate to `qc_output = "/results/quality_control"`
2. Position cursor on the `/` in the path
3. Press `c$`
4. Type `/output/fastqc/`
5. Press `ESC`

### Exercise 5: Reorganize Using Cut and Paste

The configuration is a bit disorganized. Let's fix it:

1. Delete the "Output Directories" section (3 lines):
   - Navigate to `# Output Directories`
   - Press `4dd` (comment + 3 directory lines)

2. Paste it near the top:
   - Navigate to after the "Sample Information" section
   - Press `p`

3. Verify your changes look good:
   - Scroll through the file (use `j` and `k`)

4. Save: `:w`

## Understanding VIM's Registers (Advanced Preview)

When you delete or change text, VIM stores it in registers. The `p` command pastes from the default register. 

**Quick facts:**
- Deleted text goes into the default register
- You can paste it multiple times with multiple `p` commands
- Newer deletions overwrite older ones in the default register

We'll cover registers in depth in a later lesson, but for now, know that `dd` followed by `p` works like cut and paste.

## Common Patterns You'll Use Constantly

**Pattern 1: Move a line**
```
dd     - cut line
[navigate]
p      - paste below
```

**Pattern 2: Fix single character**
```
r[char] - replace with character
```

**Pattern 3: Replace a word**
```
cw      - change word
[type]
ESC
```

**Pattern 4: Rewrite to end**
```
c$      - change to end of line
[type]
ESC
```

**Pattern 5: Replace entire line**
```
cc      - change line
[type]
ESC
```

These five patterns handle most text editing scenarios in configuration files, scripts, and data files.

## Why These Commands Transform Your Workflow

**Speed:** No mouse movement, no selecting, no multiple steps. Just position cursor and execute.

**Composability:** The same motions work with delete (`d`), change (`c`), and other operators you'll learn later.

**Muscle memory:** After a week of use, your fingers execute these patterns without conscious thought.

**Efficiency:** Editing becomes expressing intentions ("change this word," "move this line") rather than mechanical steps ("select, delete, move cursor, paste").

## Real-World Bioinformatics Usage

**Configuration files:** Change parameter values with `cw`, move sections with `dd` and `p`, fix typos with `r`.

**Sample sheets:** Rearrange samples, update conditions, fix sample IDs—all with these commands.

**Scripts:** Change variable names with `cw`, reorganize code blocks with `dd`/`p`, fix operators with `r`.

**Analysis outputs:** Edit paths, update values, reorganize sections—everything is faster.

These aren't commands you'll use occasionally. They're commands you'll use hundreds of times every day.

## Quick Reference

```
PUT (PASTE):
  p        - paste after cursor/below line
  P        - paste before cursor/above line

REPLACE CHARACTER:
  r[char]  - replace character under cursor

CHANGE (delete + insert mode):
  cw       - change word forward
  ce       - change to end of word
  c$       - change to end of line
  cc       - change entire line
  c3w      - change 3 words
  
REMEMBER:
  - Deleted text is stored and can be pasted
  - r is for single characters
  - c is like d but enters Insert Mode
  - Change follows same grammar as delete
```

## What You've Mastered

You can now:
- Cut and paste lines with `dd` and `p`
- Replace single characters instantly with `r`
- Change words, portions of lines, or entire lines with `c` commands
- Combine operators and motions fluently
- Edit configuration files efficiently on remote servers

These operations, combined with navigation and deletion from previous lessons, give you a complete basic editing toolkit.

## What's Next

In the next lesson, we'll level up your navigation and introduce:
- Search commands to jump directly to text
- Marks to bookmark locations
- Faster ways to navigate files
- Visual mode for selecting text
- Copy (yank) commands distinct from delete

But for now, practice these commands. Open configuration files, scripts, and sample sheets. Move lines around, fix typos, change values. Build muscle memory for `p`, `r`, and `c` commands.

The more you use them, the more natural they become. Soon you'll be composing edit operations without thinking about individual keystrokes—you'll just think "change this word" and your fingers will execute `cw`.

---

*You're no longer just editing character by character—you're manipulating text objects with single commands. Next up: navigating files at the speed of thought with search and marks.*

{% include next-prev.html %}