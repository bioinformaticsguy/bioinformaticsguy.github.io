---
date: 2021-04-23 12:36:40
layout: post
title: Dictionaries
subtitle: Understanding Dictionaries in Python -- A Deep Dive

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 9
video_id: h4gQH-rtChA 
description: Now you can save different types of python objects in one variable.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-009.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

# What are python dictionaries?
In Python, a dictionary is one of the most versatile data structures. It allows us to store and retrieve data efficiently using keys and values. This structure is key for tasks ranging from data manipulation to biological computations, such as RNA sequence translation. Let’s break down some practical examples to illustrate how dictionaries work, and how they can be applied in bioinformatics.

# Basic Structure of a Dictionary
A Python dictionary is created using curly braces {} with key-value pairs. The key is a unique identifier, and the value is the data associated with that key. Here's an example:

```python
info = {"FirstName" : "Ali", "LastName" : "Hassan", "Age" : 25}
```

In this dictionary:

- `"FirstName"`, `"LastName"`, and `"Age"` are the keys.
- `"Ali"`, `"Hassan"`, and `25` are their respective values.

You can access the value associated with a key like this:

```python
print(info["FirstName"])  # Output: Ali
```

## Iterating Over a Dictionary
You can easily iterate over a dictionary to get keys and values:

```python
for key, value in info.items():
    print(f"{key}: {value}")
```

This will output:
```python
FirstName: Ali
LastName: Hassan
Age: 25
```

# Using Dictionaries in Bioinformatics
Dictionaries are especially useful in bioinformatics for mapping biological data. For instance, the RNA codon table is a perfect example where dictionaries come into play.

The RNA codon table maps nucleotide triplets (codons) to specific amino acids. Let’s take a look at how a dictionary might represent this table:

```python
RNA_codon_table = {
# Second Base
# U C A G
# U
 'UUU': 'Phe', 'UCU': 'Ser', 'UAU': 'Tyr', 'UGU': 'Cys', # UxU
 'UUC': 'Phe', 'UCC': 'Ser', 'UAC': 'Tyr', 'UGC': 'Cys', # UxC
 'UUA': 'Leu', 'UCA': 'Ser', 'UAA': '---', 'UGA': '---', # UxA
 'UUG': 'Leu', 'UCG': 'Ser', 'UAG': '---', 'UGG': 'Urp', # UxG
# C
 'CUU': 'Leu', 'CCU': 'Pro', 'CAU': 'His', 'CGU': 'Arg', # CxU
 'CUC': 'Leu', 'CCC': 'Pro', 'CAC': 'His', 'CGC': 'Arg', # CxC
 'CUA': 'Leu', 'CCA': 'Pro', 'CAA': 'Gln', 'CGA': 'Arg', # CxA
 'CUG': 'Leu', 'CCG': 'Pro', 'CAG': 'Gln', 'CGG': 'Arg', # CxG
# A
 'AUU': 'Ile', 'ACU': 'Thr', 'AAU': 'Asn', 'AGU': 'Ser', # AxU
 'AUC': 'Ile', 'ACC': 'Thr', 'AAC': 'Asn', 'AGC': 'Ser', # AxC
 'AUA': 'Ile', 'ACA': 'Thr', 'AAA': 'Lys', 'AGA': 'Arg', # AxA
 'AUG': 'Met', 'ACG': 'Thr', 'AAG': 'Lys', 'AGG': 'Arg', # AxG
# G
 'GUU': 'Val', 'GCU': 'Ala', 'GAU': 'Asp', 'GGU': 'Gly', # GxU
 'GUC': 'Val', 'GCC': 'Ala', 'GAC': 'Asp', 'GGC': 'Gly', # GxC
 'GUA': 'Val', 'GCA': 'Ala', 'GAA': 'Glu', 'GGA': 'Gly', # GxA
  'GUG': 'Val', 'GCG': 'Ala', 'GAG': 'Glu', 'GGG': 'Gly' # GxG
}
```

With this table, we can translate a given RNA codon (a sequence of three nucleotides) into its corresponding amino acid. For example:

```python
print(RNA_codon_table['AAA'])  # Output: Lys
```

## Translating RNA Codons into Amino Acids
We can write a simple function to translate RNA codons into amino acids using our dictionary:

```python
def translate_RNA_codon(codon):
    """Returns the amino acid for the given codon."""
    return RNA_codon_table[codon]

print(translate_RNA_codon("GGG"))  # Output: Gly

```


Here, the function `translate_RNA_codon()` takes a codon as input and returns the corresponding amino acid by looking it up in the RNA_codon_table.


# Summary
Python dictionaries are a powerful tool for storing and manipulating key-value pairs. In bioinformatics, they can be used to map complex biological data, like RNA codons to amino acids. Understanding how to use and manipulate dictionaries effectively can enhance your ability to work with various biological datasets.

Whether you're working with simple personal data or complex biological sequences, Python dictionaries offer an efficient and intuitive way to store and retrieve information.


Join us in the next post, [Reading and Writing Files in Python](/010-READING-AND-WRITING-FILES-python-for-Bioinformatics/), where we'll learn how to handle files - from reading DNA sequences from FASTA files to writing analysis results. We'll explore essential file operations that are crucial for processing biological data in your bioinformatics workflows.

{% include next-prev.html %}

<!-- hi guys bioinformatics guy here with another video of the series python for bioinformatics in this video we will be talking about dictionaries dictionaries is another representation of tabular formula in python so let's get started as you know that we have rna code on tables in which we have specific set of codons you can see that we have this table and let me see if i can zoom in over here so we have this table and this is rna codon table and we see that if we have this uh rna sequence of uu it represents to the fenin then we have different sequences represent different amino acids so if we want to save this whole table in python then we can use dictionaries so i have already uh written down all the code for this over here and we can simply copy it but we will have to do is we have to simply paste it over here uh you can find the script in github repository uh other than that you can also define this table on your own so i just need to make some improvements over here so this is the second base and though so the first base is going to be u then we are going to have the second base is going to be c in this whole column and then the third base is going to be a and the last one we are going to have g and you can see that over here all of these things are g so now we have created this table in a very symmetrical way there are some errors i will have to sort them out so over here we have uh defined our rna codon table very nicely so the thing is uh what i've done is i have created this variable i have added a is equals to sign then i started curly braces and then i added some comments that on the top we are these are the second bases uh this u c a g are the first bases and then there is another error yeah now it's sorted out so yeah last thing so then we know that uh this is a representation of the last element of this thing so if and you can see that uu represents phenine uuc represents phenine uua represents leucine and so on and so forth so if we will run this then we this table is stored in rna codon tip variable in order to get a specific value from this table rna codon table what we will do is uh we will write the name of the codon or name of the key in uh this square bracket so see you can see that we have all these different codons now we can select any of the codon let's select aaa and if we will run this we got lysine and we can see that over here we have yeah aaa and this represents two lysine and we can also define a very simple function define a translate rna codon c-o-d-n but we have to give this thing is a codon let's add a simple dot string returns the amino acid for the given dawn and this is going to be just one return statement return so since we have already defined rna codon table above we can use this table over here is going to be rna codon table and over here we will write codon let's define this and if we will run this function print or translate rna codon and give this a simple codon say uu then we got phenine and we see that eu is feeding and if we will give it um let's say ggg then we are supposed to get glycy so this is just one use of dictionaries dictionaries can be used for several things and they're very helpful in python so let's talk about different operations and different functions of python dictionaries for that i will define a basic python dictionary let's define a very simple dictionary and the name of that dictionary is info and in which we can add simple values like first name is equals to we have to keep the values in the inverted commas oh come on it's gonna be like this so first name is going to be ali then last name is going to be hassan then we can add something more h could be 25. now our dictionary is created we see that this is our dictionary now let's talk about different dictionary operations so the first operation is that in order to get any value of a specific key we will put we will write info and in the scare brackets we will write a key and the key is first a emmy name and it is supposed to give us ali now if we need to modify the first name we will add as equals to sign and then type the new value it could be jho and john now if we will just run this and then we will get the new value john now you can do one more thing you can multiply add or subtract or perform all the operations to a specific value of a dictionary key let's say i want to add 1 to the h we can see that currently our age is 25 over here if if i want to append it by one i am going to write it plus is equals to one and if we will run this age again we will see that now the age is 26 similarly you can also multiply and divide and do all sorts of stuff if you want to delete a specific key you will have to write del and then you will write the name of the dictionary after that in the brackets you will write that specific key if i will run this and then i will see what's inside our info then we see that there is only first name and last name let's talk about some dictionary methods so the first method is the get method and by this method you will give it a key like first name and it returns the default value right if that is not provided it will give you it won't give you anything because uh first name with double e is not present in that dictionary so if you want to get all the keys what you will do is you will use this function keys you will get that dictionary keys as first name and last name if you want to see all the values then you will use this values function john's and hassan if you want to see key like tuples you can use this method items and this will show you the all the keys and the things like that now previously we have defined this rna codon table but we haven't tried to print this and see how it's get printed so let's print rna codon table and we will see that it is printed like a single line very difficult to read so let's import pretty print which will help us printing it in a very nicer way we will import it just like this from p print import p print as pb instead of writing print we will write pp over here and then we will run this now you can see that this is printed in a very nice way we have all the keys with all the values one by one and you might have also noticed that these keys are arranged in ascending order in alphabetical order first of all we have all the a's then we have c's and we have gs and at the end we have the use you can see that this is a good way to print this whole big dictionary and in future i will also tell you how you can print this dictionary in this way so that's all about dictionaries today in the next video we will be talking about files how to handle files with python code if you have any questions comments or concerns about this video feel free to comment down below i will be happy to help you out other than that if you want to join our bioinformatics guys community which is a facebook group you can join it by using the link which is in the description down below and you can also find an article about the same video on my website bioinformatics guys and you if you want to see the script you can see the script on my github repository links are given down below so that's all for today if you want to know what i do other than programming you can check out my vlogging channel and i will see you around in the next video  -->