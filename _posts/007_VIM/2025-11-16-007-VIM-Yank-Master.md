---
date: 2025-11-16 12:29:19
layout: post
title: Copy, Insert, and Customize Like a Power User
subtitle: Master Yanking, Advanced Insertion, Replace Mode, and Settings That Transform Your Editing Experience
description: Learn VIM's yank (copy) operator, advanced insertion modes, Replace mode for overwriting text, and settings customization that makes searching and editing more powerful. These commands complete your VIM mastery toolkit and unlock productivity most users never discover.


series: VIM Essentials for Bioinformatics
series_sing: true
video_number: 007
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


You need to copy a function definition to another part of your script, open new lines efficiently without awkward key combinations, overwrite incorrect parameter values, and make your searches case-insensitive. Each of these tasks has a specific VIM command designed for maximum efficiency.

This lesson covers the final essential commands that separate casual VIM users from power users. You'll learn to copy text without deleting it, insert lines and text with precision, replace entire sequences of characters, and customize VIM's behavior to match your workflow.

Let's complete your VIM education.

## Creating Our Practice File

We'll create a Python analysis script with various elements to practice on:

```bash
vim data_processing.py
```

Press `i` to enter Insert Mode, then type:

```python
#!/usr/bin/env python3
# Data Processing Pipeline
# Version 1.0

import pandas as pd
import numpy as np
from pathlib import Path

# Configuration
INPUT_DIR = "/data/raw"
OUTPUT_DIR = "/results/processed"
REFERENCE_FILE = "reference_genes.txt"

# Load reference data
def load_reference(filename):
    """Load reference gene list"""
    with open(filename, 'r') as f:
        genes = [line.strip() for line in f]
    return genes

# Process sample data
def process_sample(sample_id):
    """Process a single sample"""
    input_file = f"{INPUT_DIR}/{sample_id}.csv"
    data = pd.read_csv(input_file)
    
    # Filter by quality
    filtered = data[data['quality'] > 30]
    
    # Calculate statistics
    mean_value = filtered['expression'].mean()
    std_value = filtered['expression'].std()
    
    return mean_value, std_value

# Main analysis function
def analyze_samples(sample_list):
    """Analyze all samples in the list"""
    results = []
    for sample_id in sample_list:
        mean, std = process_sample(sample_id)
        results.append({
            'sample': sample_id,
            'mean': mean,
            'std': std
        })
    return pd.DataFrame(results)

# Save results
def save_results(dataframe, output_filename):
    """Save analysis results to file"""
    output_path = Path(OUTPUT_DIR) / output_filename
    dataframe.to_csv(output_path, index=False)
    print(f"Results saved to {output_path}")

# Entry point
if __name__ == "__main__":
    samples = ["sample_001", "sample_002", "sample_003"]
    print("Starting analysis...")
    results = analyze_samples(samples)
    save_results(results, "analysis_results.csv")
    print("Analysis complete!")
```

Press `ESC`, type `:wq`, press `ENTER`.

## Command 1: Open New Lines - `o` and `O`

You've already learned `i` (insert before cursor) and `A` (append at end of line). Now learn the most efficient way to create new lines.

### Open Line Below: `o` (lowercase)

Press `o` (lowercase o) and VIM:
1. Creates a new line below the current line
2. Moves your cursor to that new line
3. Enters Insert Mode

**Try it:**
```bash
vim data_processing.py
```

1. Navigate to the line `import numpy as np`
2. Press `o`
3. A new blank line appears below, cursor is there, Insert Mode is active
4. Type `import sys`
5. Press `ESC`

You've added an import statement in one smooth motion: `o`, type, `ESC`.

**Compare to the old way:**
- Press `A` to go to end of line
- Press `ENTER` to create new line
- Type your text
- Press `ESC`

With `o`, you skip the "go to end of line" step. Just press `o` anywhere on the line, and you're on a new line below, ready to type.

### Open Line Above: `O` (capital O - Shift-O)

Press `O` (capital O) and VIM:
1. Creates a new line above the current line
2. Moves your cursor to that new line
3. Enters Insert Mode

**Try it:**

1. Navigate to the line `# Configuration`
2. Press `O`
3. A new blank line appears above
4. Type `# Global settings`
5. Press `ESC`

**Real-world usage scenarios:**

**Add a comment above a function:**
1. Navigate to `def load_reference(filename):`
2. Press `O`
3. Type `# TODO: Add error handling`
4. Press `ESC`

**Add import at top of import block:**
1. Navigate to first import line
2. Press `O`
3. Type new import
4. Press `ESC`

**Insert a blank line for readability:**
1. Navigate to where you want space
2. Press `o`
3. Press `ESC` immediately (creates blank line without adding text)

### Why `o` and `O` Are Essential

These commands handle one of the most common editing operations: adding new lines. Without `o` and `O`, you're constantly navigating to line ends or beginnings before pressing `ENTER`. With them, you just position anywhere on the line and press `o` or `O`.

**Pattern for adding lines:**
- Need new line below? Press `o`
- Need new line above? Press `O`
- Type your content
- Press `ESC`

You'll use these commands dozens of times per editing session.

## Command 2: Advanced Insertion - `a` and `A`

You already know `A` (append at end of line). Now let's understand `a` (append after cursor) and see how it differs from `i`.

### Append After Cursor: `a`

Press `a` (lowercase a) to enter Insert Mode with the cursor positioned after the current character.

**The difference between `i` and `a`:**
- `i` - insert before the cursor
- `a` - insert after the cursor (append)

**Try it:**

1. Navigate to the line `INPUT_DIR = "/data/raw"`
2. Position cursor on the last `"` quote
3. Press `a`
4. Type additional path: `/fastq`
5. Press `ESC`

The path now reads `"/data/raw/fastq"`.

**When to use `a` vs `i`:**

Use `a` when you want to add text after the current character:
- Adding to end of a word: cursor on last letter, press `a`, type
- Continuing a string: cursor on closing quote, press `a`, type before quote
- Adding suffix to identifier: cursor on last character, press `a`, type

Use `i` when you want to insert before the current character:
- Adding prefix: cursor on first letter, press `i`, type
- Inserting into middle of word: cursor where you want to insert, press `i`, type

### You Already Know `A`

We covered `A` (capital A) in lesson 1, but it's worth reinforcing:

Press `A` to jump to end of line AND enter Insert Mode in one command.

**Example:**
1. Navigate to `REFERENCE_FILE = "reference_genes.txt"`
2. Press `A`
3. Type ` # Path to gene reference`
4. Press `ESC`

Added a comment without navigating to the end first.

## Command 3: Move to End of Word - `e`

You've learned `w` (move to start of next word). Now learn `e` (move to end of current word).

**Try it:**

1. Navigate to any line with multiple words
2. Position cursor at the start of a word
3. Press `e`
4. Cursor jumps to the last character of that word
5. Press `e` again
6. Cursor jumps to end of next word

**The difference:**
- `w` - moves to the start of the next word
- `e` - moves to the end of the current word (or next if already at end)

**Why this matters:**

Combined with operators, `e` becomes powerful:

- `de` - delete to end of word (you learned this before)
- `ce` - change to end of word (you learned this too)
- `ye` - yank (copy) to end of word (coming up next!)

**Navigation pattern:**
- Moving forward through words: use `w` (jump to starts)
- Working with word endings: use `e` (jump to ends)
- Going back: use `b` (back to start of previous word - you'll learn this soon)

## Command 4: Yank (Copy) - `y`

Finally! VIM's copy command. In VIM terminology, copying is called "yanking" (because you yank text into a register for later use).

**The yank operator:** `y`

Just like `d` (delete) and `c` (change), `y` works with motions:

- `yw` - yank word
- `ye` - yank to end of word
- `y$` - yank to end of line
- `yy` - yank entire line
- `y3w` - yank 3 words
- `2yy` - yank 2 lines

### Yank a Line: `yy`

1. Navigate to the line `import pandas as pd`
2. Press `yy`
3. The line is yanked (copied) - you'll see a message briefly or nothing at all
4. Navigate to where you want to paste
5. Press `p`
6. The line pastes below the cursor

**Try it:**
1. Navigate to `import pandas as pd`
2. Press `yy` (yank the line)
3. Move down a few lines
4. Press `p` (paste)
5. The import line appears again

Press `u` to undo the paste.

### Yank Multiple Lines: `[number]yy`

1. Navigate to the first import line
2. Press `3yy` (yank 3 lines)
3. Navigate to somewhere else in the file
4. Press `p`
5. All three lines paste

### Yank Word: `yw`

1. Navigate to any variable name, like `sample_id`
2. Position cursor at the start of the word
3. Press `yw`
4. Navigate elsewhere
5. Press `p`
6. The word pastes after cursor

### Yank to End of Line: `y$`

1. Navigate to middle of a line
2. Press `y$`
3. Navigate to another line
4. Press `p`
5. The rest of that line pastes

### Yank in Visual Mode

You can also select text visually and yank it:

1. Press `v` to enter Visual mode
2. Move cursor to select text
3. Press `y` to yank the selection
4. Navigate elsewhere
5. Press `p` to paste

**Or use Visual Line mode:**

1. Press `V` (Shift-V) to enter Visual Line mode
2. Press `j` or `k` to select lines
3. Press `y` to yank selected lines
4. Navigate elsewhere
5. Press `p` to paste

### Yank and Paste a Function

Let's copy an entire function:

1. Navigate to `def load_reference(filename):`
2. Press `V` to enter Visual Line mode
3. Press `j` repeatedly until you've selected the entire function (to the `return genes` line)
4. Press `y` to yank
5. Navigate to the bottom of the file
6. Press `p` to paste

You've copied an entire function! Press `u` to undo.

### The Complete Copy-Paste Workflow

**Pattern:**
1. Navigate to text to copy
2. Yank it: `yy` (line), `3yy` (multiple lines), `yw` (word), or visual selection + `y`
3. Navigate to destination
4. Paste: `p` (after/below) or `P` (before/above)

**Compare to delete-paste (cut-paste):**
- Delete: `dd`, `dw`, etc. - removes text AND puts in register
- Yank: `yy`, `yw`, etc. - copies text without removing it

Both can be pasted with `p`.

## Command 5: Replace Mode - `R`

Replace mode is like Insert mode, but it overwrites existing text instead of inserting.

Press `R` (capital R, Shift-R) to enter Replace mode.

Every character you type replaces the character under the cursor, and the cursor moves forward.

Press `ESC` to return to Normal mode.

### Example 1: Replace a Number

1. Navigate to the line `filtered = data[data['quality'] > 30]`
2. Position cursor on the `3` in `30`
3. Press `R`
4. Type `20`
5. The `30` becomes `20` (the `3` was replaced by `2`, the `0` was replaced by `0`)
6. Press `ESC`

### Example 2: Replace a Word

1. Navigate to `mean_value = filtered['expression'].mean()`
2. Position cursor on `mean` in `mean_value`
3. Press `R`
4. Type `avg_`
5. Now it reads `avg_value` (but you've replaced 4 characters with 4 characters)
6. Press `ESC`

### Example 3: Replace Text of Different Length

1. Navigate to `"sample_001"`
2. Position cursor on `001`
3. Press `R`
4. Type `042`
5. The `001` becomes `042`
6. Press `ESC`

### When to Use Replace Mode

**Use Replace mode when:**
- Fixing values that are the wrong length: wrong number, wrong ID
- Overwriting fixed-width fields in formatted text
- Changing parameter values in configuration
- Updating version numbers or dates

**Don't use Replace mode when:**
- Inserting new text (use Insert mode)
- Changing text that will shift other text (use change commands)

**Replace mode vs `r` command:**
- `r` - replace single character, automatically returns to Normal mode
- `R` - replace mode, keeps replacing until you press `ESC`

Use `r` for single characters, `R` for multiple characters.

## Command 6: VIM Settings - `:set`

VIM's behavior can be customized with settings. These settings make your editing experience more powerful and pleasant.

### Set a Setting: `:set option`

```
:set option
```

### Unset a Setting: `:set nooption`

```
:set nooption
```

The `no` prefix turns an option off.

### Essential Search Settings

#### Ignore Case in Searches: `:set ignorecase` or `:set ic`

By default, VIM searches are case-sensitive. `/sample` won't match "Sample".

Turn on case-insensitive search:

```
:set ignorecase
```

Or use the short form:

```
:set ic
```

**Try it:**
1. Type `:set ic` and press `ENTER`
2. Type `/sample` and press `ENTER`
3. VIM finds "sample", "Sample", "SAMPLE", etc.

To turn it off:
```
:set noignorecase
```

Or:
```
:set noic
```

#### Incremental Search: `:set incsearch` or `:set is`

With incremental search, VIM shows matches as you type the search pattern.

```
:set incsearch
```

**Try it:**
1. Type `:set is` and press `ENTER`
2. Type `/pro` (don't press ENTER yet)
3. As you type each letter, VIM jumps to the first match
4. Complete the search or press `ESC` to cancel

This is incredibly useful for finding text quickly—you see results immediately and can stop typing once you've found what you want.

To turn it off:
```
:set noincsearch
```

#### Highlight Search Matches: `:set hlsearch` or `:set hls`

This highlights all matches of your search pattern in the file.

```
:set hlsearch
```

**Try it:**
1. Type `:set hls` and press `ENTER`
2. Type `/sample` and press `ENTER`
3. All occurrences of "sample" are highlighted throughout the file
4. Press `n` to jump between highlighted matches

To clear highlights (without turning off the setting):
```
:nohlsearch
```

Or shorter:
```
:noh
```

This clears the current highlights but keeps the setting active for future searches.

To turn off the setting entirely:
```
:set nohlsearch
```

### Combining Settings

These three search settings work beautifully together:

```
:set ignorecase
:set incsearch
:set hlsearch
```

Now searching is:
- Case-insensitive (finds Sample, SAMPLE, sample)
- Incremental (shows matches as you type)
- Highlighted (all matches visible at once)

### Checking Settings

To see if a setting is on or off:

```
:set option?
```

For example:
```
:set ignorecase?
```

Shows `ignorecase` or `noignorecase`.

### Other Useful Settings

#### Show Line Numbers: `:set number`

```
:set number
```

Or:
```
:set nu
```

Line numbers appear on the left side. Useful when jumping to specific lines or referencing code locations.

Turn off:
```
:set nonumber
```

#### Enable Mouse Support: `:set mouse=a`

```
:set mouse=a
```

Now you can click to position cursor, select text with mouse, scroll with mouse wheel.

Turn off:
```
:set mouse=
```

#### Show Matching Brackets: `:set showmatch`

```
:set showmatch
```

When you type a closing bracket `)`, `]`, or `}`, the cursor briefly jumps to the matching opening bracket.

#### Autoindent: `:set autoindent`

```
:set autoindent
```

When you press `ENTER`, the new line starts at the same indentation level as the previous line.

### Making Settings Permanent

Settings you type with `:set` only last for the current session. To make them permanent, add them to your `.vimrc` file (we'll cover this in a future lesson).

## Practical Workflows

### Workflow 1: Copy Function and Modify

You need to create a similar function:

1. Navigate to the original function
2. Press `V` to enter Visual Line mode
3. Select the entire function with `j`
4. Press `y` to yank (copy)
5. Navigate to where you want the new function
6. Press `p` to paste
7. Modify the pasted function using change commands (`cw`, `ce`, etc.)

### Workflow 2: Efficient Line Addition

Adding multiple lines with comments:

1. Navigate to where you want new lines
2. Press `o` (new line below)
3. Type comment: `# Step 1: Load data`
4. Press `ESC`
5. Press `o` again
6. Type: `# Step 2: Process data`
7. Press `ESC`
8. Continue...

Much faster than navigating to end of line, pressing ENTER, etc.

### Workflow 3: Replace Parameter Values

Updating configuration values:

1. Enable settings for better search:
```
:set ic
:set hls
```

2. Search for parameter: `/quality > 30`
3. Position cursor on `30`
4. Press `R`
5. Type `25`
6. Press `ESC`
7. Press `n` to find next occurrence
8. Repeat replace if needed

### Workflow 4: Copy-Paste Multiple Elements

Building a list from existing elements:

1. Yank a line: `yy`
2. Paste it multiple times: `p`, `p`, `p`
3. Modify each pasted line: `cw` to change words

Or:

1. Yank once: `yy`
2. Paste: `p`
3. Modify: `cw`, type, `ESC`
4. Yank again: `yy` (yank the modified line)
5. Paste: `p`
6. Modify: `cw`, type, `ESC`
7. Continue building list

## Practice Exercises

### Exercise 1: Master Opening Lines

1. Open the script: `vim data_processing.py`
2. Navigate to the `# Configuration` line
3. Press `O` to add line above
4. Type `# Pipeline settings`
5. Press `ESC`
6. Press `o` to add line below
7. Type `VERSION = "2.0"`
8. Press `ESC`

### Exercise 2: Copy and Paste Functions

1. Navigate to the `load_reference` function
2. Press `V` to enter Visual Line mode
3. Select entire function (including docstring)
4. Press `y` to yank
5. Navigate to end of file: `G`
6. Press `p` to paste
7. Undo: `u`

### Exercise 3: Use Replace Mode

1. Navigate to `"sample_001"`
2. Position cursor on `001`
3. Press `R`
4. Type `999`
5. Press `ESC`
6. Undo: `u`

### Exercise 4: Configure Search Settings

1. Type `:set ic` and press `ENTER`
2. Type `:set hls` and press `ENTER`
3. Type `:set is` and press `ENTER`
4. Search: `/def` and press `ENTER`
5. Notice how all function definitions are highlighted
6. Press `n` to cycle through matches
7. Clear highlights: `:noh` and press `ENTER`

### Exercise 5: Yank and Paste Workflow

1. Navigate to the imports section
2. Press `yy` on `import pandas as pd`
3. Move down one line
4. Press `p` to paste
5. Change the pasted line: `cw`, type `import matplotlib.pyplot as plt`, `ESC`
6. Undo: `u`, then `u` again

### Exercise 6: Build Code with `o` and Yank

1. Navigate to the samples list in `__main__`
2. Press `o` to open line below
3. Type a new sample: `"sample_004",`
4. Press `ESC`
5. Press `yy` to yank the line
6. Press `p` to paste
7. Change: `cw`, type `"sample_005",`, `ESC`

## Advanced Tips

### Yank to Named Registers

You can yank to specific registers (like a clipboard with multiple slots):

```
"ayy    - yank line to register 'a'
"ap     - paste from register 'a'
```

This lets you have multiple copied items at once. We'll cover registers in detail in an advanced lesson.

### Visual Block Mode

Press `Ctrl-V` to enter Visual Block mode, which lets you select rectangular blocks of text. Great for editing columns of data or adding comments to multiple lines.

### Append vs Insert After Yank-Paste

After pasting with `p`, you can:
- Press `a` to append to the pasted text
- Press `A` to append at end of pasted line
- Press `o` to add new line below pasted text

### Replace Mode Variations

- `R` - Replace mode (overwrite characters)
- `r` - Replace single character (you learned this before)
- `gR` - Virtual Replace mode (replaces screen space, handles tabs differently)

For most use cases, `R` is what you want.

## Common Patterns

**Open new line below and type:**
```
o [type text] ESC
```

**Open new line above and type:**
```
O [type text] ESC
```

**Copy line and paste:**
```
yy [navigate] p
```

**Copy multiple lines:**
```
3yy [navigate] p
```

**Copy visually selected text:**
```
V [select] y [navigate] p
```

**Replace multiple characters:**
```
R [type replacement] ESC
```

**Enable all search enhancements:**
```
:set ic hls is
```

## Why These Commands Complete Your VIM Mastery

**Opening lines (`o`, `O`)** makes adding content natural and fast—no more awkward navigation-enter-navigation sequences.

**Yanking (`y`)** finally lets you copy without deleting first. Combined with paste (`p`), you can duplicate code, repeat configurations, and build templates efficiently.

**Replace mode (`R`)** handles overwriting scenarios perfectly—updating fixed-width fields, correcting values, and replacing text of known length.

**Settings (`:set`)** customize VIM to work how you think, particularly making searches powerful and forgiving.

Together with everything you've learned:
- Navigation (`hjkl`, `gg`, `G`, `/`, `?`)
- Deletion (`x`, `dw`, `dd`, `d$`)
- Change (`cw`, `ce`, `c$`, `cc`)
- Paste (`p`, `P`)
- Undo (`u`, `Ctrl-R`)
- Search (`/`, `?`, `n`, `N`)
- Substitution (`:s`)

You now have complete VIM proficiency for bioinformatics work.

## Quick Reference

```
OPEN LINES:
  o           - open line below, enter Insert mode
  O           - open line above, enter Insert mode

INSERTION:
  a           - insert after cursor
  A           - insert at end of line
  
MOTION:
  e           - move to end of word

YANK (COPY):
  yy          - yank line
  3yy         - yank 3 lines
  yw          - yank word
  y$          - yank to end of line
  V [move] y  - yank visual selection

REPLACE:
  R           - enter Replace mode
  [ESC]       - exit Replace mode

SETTINGS:
  :set ic          - ignore case in search
  :set noic        - case-sensitive search
  :set is          - incremental search
  :set hls         - highlight search matches
  :noh             - clear search highlights
  :set number      - show line numbers
  :set mouse=a     - enable mouse
```

## What You've Mastered

You now know how to:
- Open new lines efficiently above or below
- Insert text after cursor or at end of line
- Navigate to word endings
- Copy (yank) text without deleting it
- Paste yanked or deleted text
- Overwrite text with Replace mode
- Customize VIM settings for better searching
- Toggle settings on and off

These commands complete your essential VIM toolkit. You can now handle any editing task efficiently.

## What's Next

You've mastered the core VIM commands! Future topics include:
- Advanced customization with `.vimrc`
- Working with multiple files and splits
- Macros for repeating complex edits
- Advanced registers and clipboard integration
- Plugins for extended functionality
- Language-specific features

But you don't need these to be productive. Practice what you've learned:
- Use `o` and `O` for all new lines
- Yank and paste instead of manual retyping
- Enable search settings that work for you
- Use Replace mode when appropriate

With these commands internalized, VIM becomes an extension of your thought process. You think "copy this function" and your fingers execute `Vyp` automatically. You think "add a line here" and `o` happens without conscious effort.

This is VIM mastery: editing at the speed of thought.

Stay tuned for the next post!

---

*Congratulations—you've almost completed essential VIM training. You're now equipped to edit configuration files, scripts, and data on any remote server with confidence and efficiency. Keep practicing, and VIM will become your most powerful bioinformatics tool.*

{% include next-prev.html %}