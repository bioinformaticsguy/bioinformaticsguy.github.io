---
date: 2022-11-11 12:36:40
layout: post
title: For Loop I of II
description: The loop which can solve 99.99% of your daily life problems. 
subtitle: Now it is time to talk about my favourite loop in python programming. 

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 17
video_id: w6Gztdhkd3U

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1668248715/002%20Python-for-Bioinformatics/0017_fpyrlt.png


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


These are also known as iterations. These are way easier than the while loops in most of the cases and you can implment with using quite less lines as compared to the while loop.


Before we take a look at the sudo code I will like to explain the concept of the loops with the help of an example. 


Imagine that you have like 100,000 files could be fasta files and you want to go over to the each and every file and then you want to extract the name and the accession number from each file then technically what we have learned so far we can write a function and then call that function a hundred thousand times to get the job done. In this way you will have to write down atleast 100,000 lines of code. Which is not a bioinformaticy way to do this job. What if I tell you that you can do the same task in just a few lines!


We will take a look at a bunch of different scanarios with for loops in this video like:

- Basic Idea (Iteration)
- File Iteration
- Dictionary Iteration
- Numbering Iterations
- Repeat
- Collect
<!-- #endregion -->

## Basic Idea (Iteration)
So, the basic idea of the for loop can be summarized in the sudo code below. It starts with the keyword **```for```** and then you have a variable which stored the current value for each iteration then you have a collection which could be a dictionary, list or set depending on your requirments. Then in the body of the for loop you can do something with the current item in each iteration.


```
for item in collection:
    do something with the item
```

Let's take a look at the basic code example in which we have a list of integers from 1 to 5 and we apply for loop to print all those integers.

```python
lst = [1,2,3,4,5]

for item in lst:
    print(item)
```

## File Iteration

Doing something with each line of a file object is an especially useful application of the for statement. Now, we know how to write a basic for loop. It is time to handle a file with the help of a for loop. The basic idea is that you first open the file by using the **```with```** keyword and open() function than we have to store this opened file in a variable so we use **```as```** keyword and then in the next line we start our for loop. In the body of the for loop here we are just printing the line.


```
with open(filename) as file:
    for line in file:
        do something with the line
```

```python
with open("seqdump.txt") as file:
    for line in file:
        print(line)
```

## Dictionary Iteration

**Iteration can be performed with a dictionary’s keys, values, or key/value pairs.** 

The idea is very similar to the previous for loop it is just that this time our collection is gonna be a dictionary and you can simply access the keys by using the **```.keys()```**  function and then simply you can do something in the body of the for loop. Have a look at the sudo code and the code example below:


```
for key in dictionary.keys():
    do something with key
```

```python
dictionary = {"one": 1, "two": 2, 'three': 3}

for key in dictionary.keys():
    print(key)
```


<font color=green>Task: Now try to iterate over the values of a dictionary and then both keys and values</font>
> Hint: You may wanna use .values or .items


## Numbering Iterations

**Use the function enumerate and tuple unpacking to generate numerical keys in parallel with the values in an iterable.**

**enumerate()** is a very interesting function and it makes our life easier when we have to get the index of the value and the value it self as well. Let's not go into the details of the enumerate function but focus on out topic at hand for loop. Here as you can see in the sudo code we will be doing something with the index which is denoted by n as well as with the value.

```
for n, value in enumerate(iterable):
    do something with n and value
```


So in the code example below we are printing the index along with the item in the small list that we defined for the sake of explanantion.

```python
lst = ["DNA", "RNA", "mRNA", "microRNA"]

for n, value in enumerate(lst):
    print(n, value)
```

## Repeat


To repeat a block of statements n times, iterate over range(n). Sometimes you need to do the same thing over and over again so you can use this structure of a for loop where you are doing the same thing and you dont even use the iterator. It will get clear with the code example.

```
for count in range(n):
    statements
```

Frequently, count would not even be used in the body of the iteration.

```python
for count in range(10):
    print("ATGC")
```

<!-- #region -->
## Collect

A Collect iteration starts with an empty collection and uses a method or 
operator ap-propriate to its type to add something to it for each iteration.


I would like to take this oppertunity to explain this idea with the help of an example. So we have two buckets bucket A and Bucket B. Bucket A is empty and Bucket B is full but only some of the stuff in bucket B is usefull. Now you have to take out one item at a time from bucket B and then check if that item is useful you will put it in the bucket A if not that you will move on to the next item.  

Let's take a look at the pseudocode we will initialize our empty collection (bucket A) and we store this in the result variable. This collection could be anything (depends on the needs and the requirments of the hour) it could be a list it could be a dictionary it could be a set or anything.


Then we will start our for Loop for item in collection and remember that this collection is gonna be something where we have a lot of stuff and we just want to collect useful stuff (so we can say it will be bucket B).

Once we are in the body of for Loop then we will write down some statements using the item variable and then we will append our results as an expression based on the statements.
<!-- #endregion -->

```
result = emptyCollection
for item in collection:
    statemnets wsing the item
    result.append(expression based on the statements)
```


Now, after we get the basic idea from the sudo code it is time to take a look at the code. So, we are defining a new function **readFastaIteration()**. 

This function is gonna be for the fasta files. Before we go into the function let me explain with the help of the fasta file what we really want to do here. Take a look at some of the text from the fasta file below. If you want to see the full file you can find that in the repository [here]. 


```
>AB021961.1 Mus musculus mutant p53 mRNA, complete cds
TTCCTGGNCTGTAGGTAGCGACTACAGTTAGGGGGCACCTAGCATTCAGGCCCTCATCCTCCTCCTTCCCAGCAGGGTGT
CACGCTTCTCCGAAGACTGGATGACTGCCATGGAGGAGTCACAGTCGGATATCAGCCTCGAGCTCCCTCTGAGCCAGGAG
ACATTTTCAGGCTTATGGAAACTACTTCCTCCAGAAGATATCCTGCCATCACCTCACTGCATGGACGATCTGTTGCTGCC
CCAGGATGTTGAGGAGTTTTTTGAAGGCCCAAGTGAAGCCCTCCGAGTGTCAGGAGCTCCTGCAGCACAGGACCCTGTCA
CCGAGACCCCTGGGCCAGTGGCCCCTGCCCCAGCCACTCCATGGCCCCTGTCATCTTTTGTCCCTTCTCAAAAAACTTAC
CAGGGCAACTATGGCTTCCACCTGGGCTTCCTGCAGTCTGGGACAGCCAAGTCTGTTATGTGCACGTACTCTCCTCCCCT
CAATAAGCTATTCTGCCAGCTGGCGAAGACGTGCCCTGTGCAGTTGTGGGTCAGCGCCACACCTCCAGCTGGGAGCCGTG
TCCGCGCCATGGCCATCTACAAGAAGTCACAGCACATGACGGAGGTCGTGAGACGCTGCCCCCACCATGAGCGCTGCTCC
GATGGTGATGGCCTGGCTCCTCCCCAGCATCGTATCCGGGTGGAAGGAAATTTGTATCCCGAGTATCTGGAAGACAGGCA
GACTTTTCGCCACAGCGTGGTGGTACCTTATGAGCCACCCGAGGCCGGCTCTGAGTATACCACCATCCACTACAAGTACA
TGTGTAATAGCTCCTGCATGGGGGGCATGAACCGCCGACCTATCCTTACCATCATCACACTGGAAGACTCCAGTGGGAAC
CTTCTGGGACGGGACAGCTTTGAGGTTCGTGTTTGTGCCTGCCCTGGGAGAGACCGCCGTACAGAAGAAGAAAATTTCCG
CAAAAAGGAAGTCCTTTGCCCTGAACTGCCCCCAGGGAGCGCAAAGAGAGCGCTGCCCACCTGCACAAGCGCCTCTCCCC
CGCAAAAGAAAAAACCACTTGATGGAGAGTATTTCACCCTCAAGATCCGCGGGCGTAAACGCTTCGAGATGTTCCGGGAG
CTGAATGAGGCCTTAGAGTTAAAGGATGCCCATGCTACAGAGGAGTCTGGAGACAGCAGGGCTCACTCCAGCTACCTGAA
GACCAAGAAGGGCCAGTCTACTTCCCGCCATAAAAAAACAATGGTCAAGAAAGTGGGGCCTGACTCAGACTGACTGCCTC
TGCATCCCGTCCCCATCACCAGCCTCCCCCTCTCCTTGCTGTCTTATGACTTCAGGGCTGAGACACAATCCCCAGGATCC
ACTCANACTGNCTGCCTNTGNATCCNGTCCCCATNACCANCCTCCCCNTNTCCTTGCTGNNTTATGACT
>AB020317.1 Mus musculus mRNA for p53, complete cds
CCTCCTTGGCTGTAGGTAGCGACTACAGTTAGGGGGCACCTAGCATTCAGGCCCTCATCCTCCTCCTTCCCAGCAGGGTG
TCACGCTTCTCCGAAGACTGGATGACTGCCATGGAGGAGTCACAGTCGGATATCAGCCTCGAGCTCCCTCTGAGCCAGGA
GACATTTTCAGGCTTATGGAAACTACTTCCTCCAGAAGATATCCTGCCATCACCTCACTGCATGGACGATCTGTTGCTGC
CCCAGGATGTTGAGGAGTTTTTTGAAGGCCCAAGTGAAGCCCTCCGAGTGTCAGGAGCTCCTGCAGCACAGGACCCTGTC
ACCGAGACCCCTGGGCCAGTGGCCCCTGCCCCAGCCACTCCATGGCCCCTGTCATCTTTTGTCCCTTCTCAAAAAACTTA
CCAGGGCAACTATGGCTTCCACCTGGGCTTCCTGCAGTCTGGGACAGCCAAGTCTGTTATGTGCACGTACTCTCCTCCCC
TCAATAAGCTATTCTGCCAGCTGGCGAAGACGTGCCCTGTGCAGTTGTGGGTCAGCGCCACACCTCCAGCTGGGAGCCGT
GTCCGCGCCATGGCCATCTACAAGAAGTCACAGCACATGACGGAGGTCGTGAGACGCTGCCCCCACCATGAGCGCTGCTC
CGATGGTGATGGCCTGGCTCCTCCCCAGCATCTTATCCGGGTGGAAGGAAATTTGTATCCCGAGTATCTGGAAGACAGGC
AGACTTTTCGCCACAGCGTGGTGGTACCTTATGAGCCACCCGAGGCCGGCTCTGAGTATACCACCATCCACTACAAGTAC
ATGTGTAATAGCTCCTGCATGGGGGGCATGAACCGCCGACCTATCCTTACCATCATCACACTGGAAGACTCCAGTGGGAA
CCTTCTGGGACGGGACAGCTTTGAGGTTCGTGTTTGTGCCTGCCCTGGGAGAGACCGCCGTACAGAAGAAGAAAATTTCC
GCAAAAAGGAAGTCCTTTGCCCTGAACTGCCCCCAGGGAGCGCAAAGAGAGCGCTGCCCACCTGCACAAGCGCCTCTCCC
CCGCAAAAGAAAAAACCACTTGATGGAGAGTATTTCACCCTCAAGATCCGCGGGCGTAAACGCTTCGAGATGTTCCGGGA
GCTGAATGAGGCCTTAGAGTTAAAGGATGCCCATGCTACAGAGGAGTCTGGAGACAGCAGGGCTCACTCCAGCTACCTGA
AGACCAAGAAGGGCCAGTCTACTTCCCGCCATAAAAAAACAATGGTCAAGAAAGTGGGGCCTGACTCAGACTGACTGCCT
CTGCATCCCGTCCCCATCACCAGCCTCCCCCTCTCCTTGCTGTCTTATGACTTCAGGGCTGAGACACAATCCCAGATTCC
ACTCANACTGACTGCCTCTGCATCCCGTCCCCATCACCAGCCTCCCCNNCTCCTTGCTGTCTTATGACTTCAGGGNTGAG
ACANAATCCNAGATCCA
```

As you might have noticed that there are two fasta sequences in this above example but in the real fasta file that we are going to use for this example has more than 2 sequencs. We can see that each new sequence starts with the **>** sign. What we want to do is to extract the descriptioin and the sequence of each fasta sequence in the file. We can store each pair in a form of a touple. 

So we will start by initializing the empty list and store it in the sequence variable. Here we will need to initialize another variable descrip to save the description temporarily. Then we open our file start our for loop. Check if the line is starting from the > sign we already have something in the description. We  append the description and the seq variable (which has our sequence). Then outside the if condition i-e when we were unable to find the description we will store this line in the descrip variable and we will update the seq varibale to an empty string to start the new sequence.

In the else condition we keep on collecting the seq lines by adding new lines to the seq string. At the very end we will append our last sequence and the description captured to the list.

At the very end we return the sequences list.

```python
def readFastaIteration(filename):
    '''Given a fasta file returns a list of all the touples
    in which the first element of touple is the description of the fasta sequence 
    and the 2nd element is the sequence itself.'''
    sequences = []
    descrip = None
    with open(filename) as file:
        for line in file:
            if line[0] == ">":
                if descrip:
                    sequences.append((descrip, seq))
                descrip = line[1:-1].split('|')
                seq = '' 
            else:
                seq = seq + line[:-1]
        sequences.append((descrip, seq))
    
    return sequences

print(readFastaIteration('seqdump.txt')) 
```


{% include next-prev.html %}