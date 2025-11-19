---
date: 2025-11-15 12:29:19
layout: post
title: Execute Commands Without Leaving Your Editor
subtitle: Run Shell Commands, Save File Sections, and Import External Content—All From Within VIM
description: Learn to integrate VIM with your shell environment by executing external commands, saving portions of files, reading in external content, and building seamless workflows that never require leaving your editor. Master the commands that make VIM a complete working environment.


series: VIM Essentials for Bioinformatics
series_sing: true
video_number: 006
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

You're editing a pipeline script. You need to check if an input file exists, save just the configuration section to share with a colleague, and insert a directory listing into your documentation. In most editors, you'd switch to a terminal, run commands, copy-paste results, and juggle multiple windows. In VIM, you never leave the editor.

Type `:!ls /data/samples`, and the directory listing appears. Type `:'<,'>w config_only.txt`, and those selected lines save to a new file. Type `:r !date`, and the current timestamp inserts at your cursor. All without interrupting your editing flow.

This is VIM as a complete working environment, not just a text editor.

## Creating Our Practice Files

We'll create a project documentation file and a small script to work with:

```bash
vim project_notes.md
```

Press `i` to enter Insert Mode, then type:

```markdown
# RNA-seq Analysis Project Notes

## Project Setup
Date: [INSERT DATE HERE]
Analyst: Research Team
Project: DSD Gene Analysis

## Directory Structure
[INSERT DIRECTORY LISTING]

## Sample Information
Total samples: 15
Controls: 5
Treated: 10

## Configuration Parameters
```yaml
genome: /data/genomes/hg38.fa
annotation: /data/annotations/gencode.v38.gtf
threads: 16
memory: 32G
output: /results/rnaseq_analysis
```

## Analysis Steps
1. Quality control with FastQC
2. Read trimming with Trimmomatic
3. Alignment with HISAT2
4. Count generation with featureCounts
5. Differential expression with DESeq2

## File Locations
Reference files: /data/references/
Raw data: /data/raw/fastq/
Results: /results/project_2024/

## Status
- [x] Setup complete
- [x] QC finished
- [ ] Alignment in progress
- [ ] Counts pending
- [ ] Analysis pending

## Notes
Quality looks good across all samples.
Sample 007 has slightly lower read count - discussing with sequencing core.

## Commands Used
[INSERT COMMAND HISTORY]
```

Press `ESC`, type `:wq`, press `ENTER`.

Now create a simple analysis script:

```bash
vim quick_stats.sh
```

Press `i`, type:

```bash
#!/bin/bash
# Quick sample statistics

echo "Checking sample files..."
# List all FASTQ files
# Count total samples
# Show file sizes
```

Press `ESC`, type `:wq`, press `ENTER`.

## Command 1: Execute External Commands - `:!command`

VIM can run any shell command without you leaving the editor. The syntax is:

```
:!command
```

The output appears on screen, you press `ENTER` to return to editing, and your file is exactly as you left it.

### Example 1: List Files

Open your notes:
```bash
vim project_notes.md
```

You want to check what files are in your current directory. Type:

```
:!ls
```

Press `ENTER`.

The screen clears, shows your directory listing, then prompts "Press ENTER or type command to continue". Press `ENTER`, and you're back in your file.

**Try it now with different commands:**

List files with details:
```
:!ls -lh
```

Check available disk space:
```
:!df -h
```

See who's logged in (on multi-user systems):
```
:!who
```

### Example 2: Check File Existence

You're editing your script and need to verify an input file exists. Type:

```
:!ls /data/raw/fastq/sample_001.fastq.gz
```

If the file exists, you see the listing. If not, you see an error. Either way, you know the answer without leaving VIM.

### Example 3: Check Command Availability

Verify a tool is installed:

```
:!which samtools
```

Shows the path if installed, error if not.

Check tool version:

```
:!samtools --version
```

### Example 4: Quick Calculations

You need to calculate something:

```
:!echo $((16 * 1024))
```

Shows the result (16384) - useful for memory calculations in megabytes to gigabytes conversions.

Or use `bc` for complex math:

```
:!echo "scale=2; 100/3" | bc
```

### Example 5: Process Management

Check running jobs:

```
:!ps aux | grep python
```

Check system load:

```
:!uptime
```

**Real-world workflow:** You're editing a pipeline script, want to check if your previous run is still running, type `:!ps aux | grep pipeline.py`, see it's finished, and continue editing to update parameters for the next run. Never left VIM.

### Important Notes

- The `!` tells VIM "this is a shell command"
- Output displays on screen but doesn't insert into your file
- Your file remains unchanged
- You return to exactly where you were

## Command 2: Save to Different Filename - `:w FILENAME`

You've edited a file but want to save it with a different name (like "Save As").

```
:w new_filename.txt
```

This saves the current buffer to `new_filename.txt` while keeping the original file unchanged. Your VIM session is now editing the original file still.

### Example 1: Create a Backup

You're about to make major changes:

```
:w project_notes_backup.md
```

Now you have a backup. Continue editing `project_notes.md`, and if things go wrong, you have `project_notes_backup.md` to fall back on.

### Example 2: Save a Template

You've created a generic analysis script and want to save it as a template:

```
:w template_analysis.sh
```

The template is saved, and you can continue editing the current file for your specific analysis.

### Example 3: Save Configuration Separately

Open your notes file. You want to extract just the configuration section and save it:

We'll do this properly with visual selection next, but you could manually:

1. Delete everything except the configuration
2. `:w config_only.yaml`
3. Undo all deletions with `u` repeatedly
4. Continue editing

But there's a better way (next section).

## Command 3: Visual Selection and Save - `v motion :w FILENAME`

This is where VIM becomes really powerful. You can select specific lines and save only those lines to a new file.

### Enter Visual Mode: `v`

Press `v` (lowercase v) to enter Visual mode.

Your cursor position is now the anchor point. Move your cursor with `h`, `j`, `k`, `l`, and VIM highlights the selected text.

**Try this:**
1. Open `project_notes.md`
2. Navigate to the "Configuration Parameters" line
3. Press `v` to enter Visual mode
4. Press `j` several times to select the configuration block
5. Press `ESC` to exit Visual mode (no changes made)

### Visual Line Mode: `V` (Shift-V)

Press `V` (capital V) to select entire lines.

This is usually more useful for saving sections of files.

**Try this:**
1. Navigate to "## Configuration Parameters"
2. Press `V` (Shift-V)
3. Press `5j` to select 5 lines down
4. The entire lines are highlighted
5. Press `ESC` to deselect

### Save Visual Selection: `:'<,'>w FILENAME`

Here's the magic: while text is selected in Visual mode, type `:w filename`.

VIM automatically fills in `:'<,'>w` which means "write the visually selected lines".

**Complete workflow:**
1. Navigate to "## Configuration Parameters"
2. Press `V` to enter Visual Line mode
3. Press `6j` to select the configuration section (adjust number as needed)
4. Type `:w config_extract.yaml`
5. VIM shows: `:'<,'>w config_extract.yaml`
6. Press `ENTER`

The selected lines are saved to `config_extract.yaml`, and your original file remains unchanged.

Check it worked:
```
:!ls -lh config_extract.yaml
```

And look at the contents:
```
:!cat config_extract.yaml
```

### Example 2: Extract Sample Information

Select just the sample information section:

1. Navigate to "## Sample Information"
2. Press `V`
3. Select the lines with `j`
4. Type `:w samples_only.txt`
5. Press `ENTER`

Now you have a file with just sample information to share with colleagues.

### Example 3: Save Multiple Sections

You can't select non-contiguous lines with basic visual mode, but you can save multiple sections sequentially:

1. Select first section with `V` and movement
2. `:w section1.txt`
3. Select second section with `V` and movement
4. `:w! section1.txt` to append... wait, that overwrites.

For appending, you'd need to do:
```
:'<,'>w >> section1.txt
```

The `>>` appends to the file (this is a shell redirection that VIM supports).

## Command 4: Read in External Files - `:r FILENAME`

You can insert the contents of any file at your cursor position.

```
:r filename.txt
```

This reads `filename.txt` and inserts its contents below your current line.

### Example 1: Insert Configuration

You have a standard configuration saved. Insert it into your current file:

First, create a sample config file:
```
:!echo "threads: 16" > standard_config.txt
:!echo "memory: 32G" >> standard_config.txt
```

Now in your notes file:
1. Navigate to where you want to insert it
2. Type `:r standard_config.txt`
3. Press `ENTER`

The file contents appear below your cursor.

### Example 2: Insert Script Template

You have a header template for all scripts:

```
:r script_header_template.sh
```

The header inserts into your current file.

### Example 3: Merge Files

You're combining multiple analysis results into one document:

```
:r analysis_part1.txt
:r analysis_part2.txt
:r analysis_part3.txt
```

Each command inserts that file's contents at your cursor position.

## Command 5: Read Command Output - `:r !command`

This is where things get really powerful. You can run a shell command and insert its output directly into your file.

```
:r !command
```

### Example 1: Insert Directory Listing

Your notes have a placeholder "[INSERT DIRECTORY LISTING]". Navigate to that line and:

```
:r !ls -lh /data/samples
```

The directory listing inserts into your file below the cursor. Replace the placeholder text with the actual listing.

### Example 2: Insert Current Date

Navigate to "[INSERT DATE HERE]" and:

```
:r !date
```

The current date and time insert into your file.

Or for just the date:
```
:r !date +\%Y-\%m-\%d
```

Note the backslashes before `%` to escape them for VIM.

### Example 3: Insert Command History

Navigate to "[INSERT COMMAND HISTORY]" and:

```
:r !history | tail -20
```

Your last 20 commands insert into the file - perfect for documenting what you did.

### Example 4: Insert File Statistics

Document how many samples you have:

```
:r !ls /data/raw/fastq/*.fastq.gz | wc -l
```

Inserts the count of FASTQ files.

### Example 5: Insert Gene List

You have a file with gene names, and want the count:

```
:r !wc -l genes_of_interest.txt
```

### Example 6: System Information

Document your analysis environment:

Navigate to where you want system info and:

```
:r !uname -a
```

Inserts system information.

```
:r !cat /proc/cpuinfo | grep "model name" | head -1
```

Inserts CPU information.

## Practical Workflows

### Workflow 1: Document Your Analysis

You're maintaining analysis notes. Use VIM to:

1. **Insert date:** `:r !date`
2. **List samples:** `:r !ls /data/samples`
3. **Count files:** `:r !ls /data/samples | wc -l`
4. **Check disk usage:** `:r !du -sh /results`
5. **Record commands:** `:r !history | tail -10`

All documentation done without leaving VIM.

### Workflow 2: Build a Script from Templates

You're creating a new analysis script:

1. Start with VIM: `vim new_analysis.sh`
2. Insert header template: `:r script_template.sh`
3. Add sample list: `:r !ls /data/samples`
4. Verify file paths: `:!ls /data/genomes/hg38.fa`
5. Continue editing

### Workflow 3: Create Project Summary

Compile information from multiple sources:

1. Insert project details: type manually or `:r project_details.txt`
2. Add file listing: `:r !ls -lh /results`
3. Include sample stats: `:r !wc -l /data/sample_sheet.csv`
4. Add timestamp: `:r !date`
5. Check before saving: `:!wc -l %` (% represents current file)
6. Save: `:w project_summary.md`

### Workflow 4: Extract and Share Configuration

You need to share just your configuration with a colleague:

1. Open your full pipeline script
2. Select the configuration section: `V` and movement
3. Save it: `:'<,'>w config_to_share.yaml`
4. Verify it saved: `:!cat config_to_share.yaml`
5. Continue editing your full script

### Workflow 5: Build Documentation from Execution

You're documenting a completed analysis:

1. Insert what you did: `:r !history | grep "samtools"`
2. Insert result counts: `:r !wc -l results/*.txt`
3. Insert file sizes: `:r !ls -lh results/`
4. Add timestamp: `:r !date`

Complete documentation without switching windows.

## Advanced Examples

### Check and Insert in One Workflow

You're documenting and want to verify files before mentioning them:

```
:!ls /data/genomes/hg38.fa
```

Verify it exists, then document it by typing or:

```
:r !echo "Reference: $(ls /data/genomes/hg38.fa)"
```

### Conditional Insertions

Insert only if files exist:

```
:r !ls /data/results/*.bam 2>/dev/null || echo "No BAM files found"
```

The `2>/dev/null` suppresses errors if no files exist.

### Process and Insert

Count samples and insert a formatted message:

```
:r !echo "Total samples: $(ls /data/samples/*.fastq.gz | wc -l)"
```

### Insert Multiple Command Outputs

Run a series of checks:

```
:r !echo "=== System Information ===" && uname -a && echo "" && echo "=== Disk Usage ===" && df -h /data
```

Inserts formatted system information.

## Understanding the Visual Selection Markers

When you use Visual mode and then a command, VIM shows `:'<,'>`.

- `'<` marks the start of the visual selection
- `'>` marks the end of the visual selection

You can actually use these marks manually:

```
:'<,'>w filename.txt
```

This saves from the visual selection start to end, even if you're not currently in Visual mode (as long as you've made a selection previously in this session).

## Combining Commands

You can combine these techniques:

1. Execute command to check something: `:!ls /data`
2. Read in a file: `:r template.txt`
3. Select lines: `V` and movement
4. Save selection: `:'<,'>w extracted.txt`
5. Read in command output: `:r !date`
6. Save final version: `:w final_document.md`

All without leaving VIM or switching to a terminal.

## Practice Exercises

### Exercise 1: Document Your Environment

Open your notes file:
```bash
vim project_notes.md
```

1. Navigate to a blank area
2. Insert current date: `:r !date`
3. Insert system info: `:r !uname -a`
4. Insert current directory listing: `:r !ls -lh`
5. Save: `:w`

### Exercise 2: Create a File Inventory

1. Create new file: `vim file_inventory.txt`
2. Add header: type "File Inventory" and press `ENTER`
3. Insert date: `:r !date`
4. Insert listing: `:r !ls -lhR /data/samples` (recursive listing)
5. Insert count: `:r !find /data/samples -type f | wc -l`
6. Save: `:w`

### Exercise 3: Extract Configuration

1. Open your notes: `vim project_notes.md`
2. Navigate to configuration section
3. Enter Visual Line mode: `V`
4. Select the configuration block (use `j` to extend selection)
5. Save it: `:'<,'>w config_backup.yaml`
6. Verify: `:!cat config_backup.yaml`

### Exercise 4: Build Script from Pieces

1. Create new script: `vim combined_analysis.sh`
2. Add shebang manually: `i` then type `#!/bin/bash` then `ESC`
3. Read in template: `:r script_header.txt` (if you have one, or skip)
4. Insert sample list: `:r !ls /data/samples/*.fastq.gz`
5. Add timestamp comment: `:r !echo "# Generated on $(date)"`
6. Save: `:w`

### Exercise 5: Verify Before Documenting

1. Check if directory exists: `:!ls /data/genomes`
2. If it exists, document it: `:r !ls -lh /data/genomes`
3. Check file count: `:!ls /data/genomes | wc -l`
4. Insert the count: `:r !echo "Total genome files: $(ls /data/genomes | wc -l)"`

## Common Patterns

**Check file/directory:**
```
:!ls /path/to/check
```

**Insert file contents:**
```
:r filename.txt
```

**Insert command output:**
```
:r !command
```

**Save selection:**
```
V (select lines)
:'<,'>w newfile.txt
```

**Save to different name:**
```
:w newname.txt
```

**Insert date/time:**
```
:r !date
```

**Insert directory listing:**
```
:r !ls -lh /path
```

**Count and insert:**
```
:r !find /path -type f | wc -l
```

## Why This Matters

These commands integrate VIM into your complete workflow:

- **No context switching:** Stay in your editor, maintain focus
- **Live documentation:** Insert real command outputs, not manually typed versions
- **Verification:** Check file existence and paths without leaving VIM
- **Selective saving:** Share specific sections without manual copying
- **Dynamic content:** Documentation that reflects actual state of your system

For bioinformatics work where you're constantly:
- Documenting analyses
- Checking file locations
- Verifying results
- Sharing configurations
- Building scripts

These commands transform VIM from a text editor into a complete working environment.

## Quick Reference

```
EXTERNAL COMMANDS:
  :!command              - execute shell command
  :!ls                   - list directory
  :!ls -lh /path         - detailed listing
  :!which tool           - check if tool installed
  
SAVE OPERATIONS:
  :w filename            - save as filename
  :w! filename           - save as filename (overwrite)
  
VISUAL SELECTION:
  v                      - enter visual mode (character)
  V                      - enter visual line mode
  :'<,'>w filename       - save selected lines
  
READ OPERATIONS:
  :r filename            - insert file contents
  :r !command            - insert command output
  :r !date               - insert current date
  :r !ls /path           - insert directory listing
  :r !echo "text"        - insert text from command
```

## What You've Mastered

You now know how to:
- Execute shell commands from within VIM
- Save files with different names
- Select and save specific sections of files
- Read external files into your current buffer
- Insert command output directly into files
- Build integrated documentation workflows

Combined with search, replace, and text manipulation from previous lessons, VIM is now a complete environment for your bioinformatics work.

## What's Next

In the next lesson, we'll cover:
- Working with multiple files simultaneously
- Split windows for viewing multiple files
- Tabs for organizing multiple editing sessions
- Buffers for managing many open files
- Advanced file navigation

But for now, practice integrating VIM with your shell:
- Document an analysis by inserting command outputs
- Extract configuration sections to share
- Verify file paths without leaving the editor
- Build scripts by combining templates and live data

You'll quickly find that leaving VIM to run commands feels unnecessarily disruptive. The integrated workflow becomes natural.

---

*VIM is no longer just a text editor—it's your complete working environment. Next time: managing multiple files simultaneously with splits, tabs, and buffers.*


{% include next-prev.html %}