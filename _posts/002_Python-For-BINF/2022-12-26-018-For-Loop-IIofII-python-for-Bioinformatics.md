---
date: 2022-12-26 12:36:40
layout: post
title: For Loop Part II of II
description: Some advanced topics in for loop. 
subtitle: Now it is time to talk about my favourite loop in python programming. 

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 18
video_id: zSp-KPm0Rys

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1672119321/002%20Python-for-Bioinformatics/018_ForloopsAdvanced.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

<!-- https://jupytext.readthedocs.io/en/latest/using-cli.html -->
<!-- jupytext --to markdown ForLoops-IIofII.ipynb -->


This is a bit advanced topic for the for loop. Understanding all the possible ways to use the for loop is very helpful for python programming skills.


We will take a look at a bunch of different scanarios with for loops in this video like:

- Combine
- Count
- Collection Combine
- Search
- Filter Do
- Filtered Combine
- Filtered Count
- Nested Iteration
<!-- #endregion -->

### Before we start we have to define a function
We will be using our previous knowledge to define a function in two different ways. First we will define it using the basic for loops and then we will define it using the list comprehentions.

```python
## List comprehentions
def read_FASTA(filename):
    with open(filename) as file:
        return [(part[0].split('|'),
                 part[2].replace('\n', ''))
                    for part in 
                         [entry.partition('\n') for entry in file.read().split('>')[1:]]]
```

```python
print(read_FASTA('sequence.fasta')[1:10])
```

# Combine
Well in our last video we ended up talking about the collection. Here we are going to start with the combine. There is very minor difference between collect and combine. Rather than making a collection this time you will keep on adding or combinig to the value and at the end you will just return that value.

```
result = identity-value  
for item in collection:
    result = result . item      # One of these will be used
    result = .= item            # The top one does the same 
    result = fn(result, item)
return result                      
```

- The identity value is the value i for which i · v == v or fn(i,v) == v. Typical examples will be 0 for addition and 1 for multiplication
- representing a binary operation

Let's try to use this in a bioinformatickey function to get the longest sequence form a fasta file with multiple sequences.

```python
def longest_sequence(filename):
    longest_seq = ''
    for info, seq in read_FASTA(filename):
        longest_seq = max(longest_seq, seq, key=len)
    return longest_seq


print(longest_sequence('longestSeq.fasta'))
```

Before we go to the next topic. You can try to think and comment down below that which form out of three forms described in the sudo code above is used the in the function longest_sequence.


# Count

Well again it is very similar to the previous one. This time we will increment by just one because we are gonna be counting.

```
count = 0
for item in iterable:
    count += 1
return count
```

```python
kmers = ['tag', 'atgcgt', 'tagat', 'aaaaaaaaaaaaaa']

count = 0
for kmer in kmers:
    count += 1


print(count)
```

# Collection Combine

An ordinary Combine operation “reduces” a collection to a value; a Collection Combine reduces a collection of collections to a single collection. (In the template presented here the reduction is done step by step, but it could also be done by first assembling the entire collection of collections and then reducing them to a single collection.)

```
result = []
for item in collection:
    result += fn(item)
    # merge result with previous result
```

```python
def extract_gi_id(description):
    '''Given a FASTA file description line, return its GenInfo ID if it has one'''
    if description[0] != '>':
        return None
    fields = description[1:].split('|')
    if 'gi' not in fields:
        return None
    return fields[1 + fields.index('gi')]

def get_gi_ids(filename):
    """Return a list of GenInfo IDs of all sequences in the file names filename"""
    with open(filename) as file:
        return [extract_gi_id(line) for line in file if line[0] == '>']

def get_gi_ids_from_files(filenames):
    """Return a list of the GenInfo ID's of all sequences formed in the
    files whose names are contained in the collection filenames."""
    idlst = []
    for filename in filenames:
        idlst += get_gi_ids(filename)
    return idlst


get_gi_ids_from_files(['longestSeq.fasta', 's3.fasta'])
```

<!-- #region -->
# Search

With in a for loop you simply keep on testing for a specific thing and then return as soon as you find it. Here is the sudo code. Suppose you have a huge fasta file and you want to see if that file contains a sequence with specific id then it will not be a good idea to store all the detials about that file. So, we will just read one sequence at a time and then check if this matches with our id and returns it otherwise it go to get the next sequence from the file.

```
for item in colleciton:
    if test item:
        return item
```

Let't take a look at the bioinformatickey example of the code. Like I always recomend we will be defining 4 functions to achieve this task. The four functions are as follow in the order in which we will define them:


```
search_FASTA_file_by_gi_id(id, filename):   
    FASTA_search_by_gi_id(id, fil)          
        extract_gi_id(line)   
        read_FASTA_sequence(fil)
```

### search_FASTA_file_by_gi_id(id, filename)
This is the top level function which is usually simplest function and just the entry point for complicated tasks. The main purpose of this function is to provide the next function data in correct form. This function will open the file to start the real search operation.

### FASTA_search_by_gi_id(id, fil):
It will keep on searching for lines starting with '>'. As soon as it finds such line it will call the function ```get_gi_i(description)``` to get the GenInfo ID from the line if it exixts. Then it will compare. If there is a match we will call the read_FASTA_sequence and return. Otherwise we will keep on loooking for next sequence.

So, let's strart coding by difining the top level function.

<!-- #endregion -->

```python
def search_FASTA_file_by_gi_id(id, filename):
    """Return the sequence with the GenInfo ID ID from the FASTA file
    named filename, reading one entry at a time until it is found"""
    id = str(id) # user might call with a number
    with open(filename) as file:
        return FASTA_search_by_gi_id(id, file) 


## About the functions that we will define next
## there will be a task for you after we finish 
## defining them here.


def FASTA_search_by_gi_id(id, file):
    for line in file:
        if (line[0] == '>' and
            str(id) == get_gi_id(line)):
            return read_FASTA_sequence(file)

def read_FASTA_sequence(file):
    seq = '' 
    for line in file:
        if not line or line[0] == '>':
            return seq
        seq += line[:-1]
   

def get_gi_id(description):
    fields = description[1:].split('|')
    if fields and 'gi' in fields:
        return fields[1 + fields.index('gi')]


print(search_FASTA_file_by_gi_id('1443065911', 'sequence.fasta'))
```

Now here is the task for you. You have to define the following functions by the help of a while loop:
- FASTA_search_by_gi_id(id, file)
- read_FASTA_sequence(file)
- get_gi_id(description)


#### Special case for search Iteration

We will keep on searching and rather than returning the item we found we will return True or False. Let's take a look at two code examples to make things clear.

```python
def rna_sequence_is_valid(seq):
    for base in seq:
        if base not in 'UCAGucag':
            return False
    return True


def dna_sequence_contains_N(seq):
    for base in seq:
        if base == 'N':
            return True
```

##### Can you point out the difference between these two functions defined above?


# Filter

This time we will filter stuff based on the specific condition. We can have quite a few different filter iterations. Let's talk about them one by one:

## Filter Do
In filter do we will do a an action on the item if it is according to a specific condition. Here is the sudo code.

```
for item in collection:
                                    # we could have initializatios here before the 
                                    # conditional
    if test item:                   #Test condition shown here could be complicated
        statements using item 
```

Let's take a look at the function in which we will print all the headers of the fasta file.

```python
def print_FASTA_headers(filename): 
    with open(filename) as file:
        for line in file:
            if line[0] == '>':
                print(line[1:-1])
```

## Filtered Combine

It is just like normal combine but this time we will only combine if it passes a given test.

```
result = identity-value
    for item in collection:
        if test item:
            result = result · item          # One of these
            result ·= item                  # three forms
            result = fn(result, item)       # is used.
return result
```


## Filtered Count

This is like count but this time we will count only for those who pass the test.

```
count = 0
for item in iterable:
    if test item:
        count += 1
return count
```


Your task is to think of a scenario where we can implement the Filtered Combine and Filtered Count approach in a Bioinformatickey or just ordinary function.


# Nested iterations
Lets talk about the last topic of this video. This is when we want to do  (a same set of things) for each item in the collection. Sudo code will look like this and it will get clear once we take a look at the code examples.

```
for outer in outer_collection:
    for inner in inner_collection:
        do something with inner and outer
```

Time to code a nested iteration function where we will be printing the codon table.

```python
from pyforbinf import translate_RNA_codon
def print_codon_table():
    """Print the DNA codon table in a nice, but simple, arrangement"""
    DNA_bases = ['A', 'U', 'G', 'C']
    
    for base1 in DNA_bases: # horizontal section (or "group")
        for base3 in DNA_bases: # line (or "row")
            for base2 in DNA_bases: # vertical section (or "column")    
                # the base2 loop is inside the base3 loop!
                print(base1+base2+base3,
                        translate_RNA_codon(base1+base2+base3),
                        end='     ')
            print()
        print()

print_codon_table()
```


{% include next-prev.html %}
