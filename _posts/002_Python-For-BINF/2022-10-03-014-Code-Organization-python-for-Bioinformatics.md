---
date: 2022-10-03 12:36:40
layout: post
title: Code Organization 
subtitle: You can stay alive without organing the code but it won't be so much fun in the long run. So we need to unlock the Power of Well-Structured Code


series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 14
video_id: g3btUAKq3Yk           
description: You can skip this topic but if I were you I won't.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1667340049/002%20Python-for-Bioinformatics/0014_uq0se3.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

Welcome back, bioinformatics enthusiasts!

Today, we're discussing code organization—a fundamental practice that can significantly improve your coding experience and efficiency. A well-organized codebase not only makes your life easier but also helps others collaborate effectively.

# Why Organize Your Code?
Good code organization is like having a well-labeled toolbox. Imagine searching for a screwdriver in a chaotic drawer versus picking it up from a neatly labeled section. The benefits of organizing your code include:

- Readability: Clean code is easier to read and understand.
- Reusability: Organized functions and modules can be reused across multiple projects.
- Debugging and Maintenance: Locating and fixing bugs becomes a breeze.
- Collaboration: Makes teamwork more productive and reduces onboarding time for new contributors.
- Scalability: A structured codebase can handle growing project complexity.

# Example: The <span style="background-color: black; color: white; padding: 2px 6px;">pyforbinf</span> Module

To demonstrate the importance of code organization, I've created a sample Python module named pyforbinf. This module includes several bioinformatics-related utility functions. Most of these functions we have already learned how to write in previous blog posts. Feel free to check out some previous posts if you are confused about any of the functions in this file. You can also comment your confusions down below I will get back to you as soon as possible. You can download it from my GitHub repository to follow along.

Check out the Sample [pyforbinf.py](https://github.com/bioinformaticsguy/0002YS_PythonForBioinformatics/blob/master/014CodeOrganization/pyforbinf.py) to see the complete implementation.

```python
from random import randint
from os.path import dirname, join


def validate_base_sequence(base_sequence, RNAflag=False):
    """Return True if the string base_sequence contains only 
    upper - or lowercase T, C, A, and G characters, 
    otherwise False"""
    seq = base_sequence.upper()
    return len(seq) == (seq.count('U' if RNAflag else 'T') 
                     + seq.count('C') 
                     + seq.count('A') 
                     + seq.count('G'))


def recognition_site(base_sequence, recognition_seq):
	return base_sequence.find(recognition_seq)


def gc_content(base_sequence):
    """Return the percentage of G and C characters in base_seq"""
    assert validate_base_sequence(base_sequence), \
            'argument has invalid characters'
    seq = base_sequence.upper()
    return ((base_sequence.count('G') + base_sequence.count('C')) / len(base_sequence))



def random_base(RNAflag = True):
	return ("UCAG" if RNAflag else "TCAG")[randint(0,3)]


def random_codon(RNAflag = False):
	return  random_base(RNAflag) + \
			random_base(RNAflag) + \
			random_base(RNAflag)

def replace_base_randomly_using_names(base_sequence):
	""" Return a sequence with the base at a randomly
	selected position of base_seq replaced by a base 
	chosen randomly from the three bases that are not 
	at that position """
	position = randint(0, len(base_sequence)-1) # -1 because len is one past end
	base = base_sequence[position]
	bases = "TCAG"
	base.replace(base,"") #replace with empty string!
	newbase = bases[randint(0,2)]
	beginning = base_sequence[0:position] # up to position
	end = base_sequence[position+1:] # omitting the base at position

	return beginning + newbase + end

def replace_base_randomly_using_expression(base_sequence):
	position = randint(0, len(base_sequence)-1)
	return (base_sequence[0:position] + "TCAG".replace(base_sequence[position], "")[randint(0,2)]+ base_sequence[position+1:])

def replace_base_randomly(base_sequence):
	position = randint(0, len(base_sequence)-1)
	bases = 'TCAG'.replace(base_sequence[position], '')
	return (base_sequence[0:position] + bases[randint(0,2)] + base_sequence[position+1:])


def validate_base_sequence(base_sequence, RNAflag = False): 
    """Return True if the string base_sequence contains only upper
    or lowercase T (or U, if RNAflag), C, A, and G characters, 
    otherwise False"""

    DNAbases = {'T', 'C', 'A', 'G'}
    RNAbases = {'U', 'C', 'A', 'G'}

    return set(base_sequence) <= (RNAbases if RNAflag else DNAbases)




# print(RNA_codon_table)

DNABases=dict((('A', 'adenine'),
               ('C', 'cytosine'),
               ('G', 'guanine'),
               ('T', 'thymine')))



def translate_RNA_codon(codon):
    """ returns the amino acid for the given codon """

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
    'GUG': 'Val', 'GCG': 'Ala', 'GAG': 'Glu', 'GGG': 'Gly'  # GxG
    }

    return RNA_codon_table[codon]

def random_codons(minlength = 3, maxlength = 10, RNAflag = False):
    """ Generate a random list of codons (RNA if RNAflag, else DNA)
    between minimum and maximum length, inclusive. 
    """
    return [random_codon(RNAflag) for n in range(randint(minlength, maxlength))]

def random_codons_translation(minlength = 3, maxlength = 10):
    """ Generates a random list of amino acids between minimum and 
    maximum length inclusive. Then returns the translation of each 
    codon in the form of a list.
    """
    return [translate_RNA_codon(codon) for codon in random_codons(minlength, maxlength, True)]

def read_FASTA_strings(filename):
    current_dir = dirname(__file__)
    with open(current_dir + "./" + filename) as file:
        return file.read().split(">")[1:]
        
def read_FASTA_entries(filename):
    return [seq.partition("\n") for seq in read_FASTA_strings(filename)]

def read_FASTA_sequences(filename):
    return [[seq[0],
            seq[2].replace("\n", "")]
            for seq in read_FASTA_entries(filename)]


def make_indexed_sequence_dictionary(filename):
    return {info:seq for info, seq in read_FASTA_sequences(filename)}
```


# Using the pyforbinf Module
Once you download the pyforbinf.py file, you can import and use its functions in your scripts:

```python
from pyforbinf import random_codon
from pyforbinf import random_base

# Generate a random RNA base
print(random_base()) # outputs: 'U'

# Generate a random RNA codon
print(random_codon()) # outputs: 'UUC'

# Translate a codon to its amino acid
print(translate_codon("AUG")) # outputs: 'Met'
```

# Best Practices for Code Organization
## 1. Use Modules
Break down large scripts into smaller, reusable modules like pyforbinf.

## 2. Add Comments and Docstrings
Every function should have a brief docstring describing its purpose.

## 3. Follow Naming Conventions
Use descriptive names for variables and functions (e.g., random_base instead of rb).

## 4. Separate Concerns
Divide your code into sections such as input/output, data processing, and analysis.

## 5. Version Control
Use Git to track changes and collaborate effectively.

## 6. Keep It Simple
Avoid over-complicating your code. Use Python's built-in features like comprehensions where appropriate.

# Final Thoughts
Code organization might seem tedious at first, but it pays off in the long run. Whether you’re managing a small script or a large bioinformatics pipeline, a well-structured codebase will save you time and headaches.

# Next Steps
Ready to master decision-making in Python? Jump into our next exciting tutorial on [Conditionals](/015-Conditionals-python-for-Bioinformatics/) in Python where you'll learn how to make your code smarter with if-else statements. Perfect for handling different DNA sequences and biological data scenarios! Let's level up your Python skills! 🧬

Happy coding! 🚀


{% include next-prev.html %}

<!-- hi guys bioinformatics guy here with another video of the series python for bioinformatics in this video we will be talking about dictionaries dictionaries is another representation of tabular formula in python so let's get started as you know that we have rna code on tables in which we have specific set of codons you can see that we have this table and let me see if i can zoom in over here so we have this table and this is rna codon table and we see that if we have this uh rna sequence of uu it represents to the fenin then we have different sequences represent different amino acids so if we want to save this whole table in python then we can use dictionaries so i have already uh written down all the code for this over here and we can simply copy it but we will have to do is we have to simply paste it over here uh you can find the script in github repository uh other than that you can also define this table on your own so i just need to make some improvements over here so this is the second base and though so the first base is going to be u then we are going to have the second base is going to be c in this whole column and then the third base is going to be a and the last one we are going to have g and you can see that over here all of these things are g so now we have created this table in a very symmetrical way there are some errors i will have to sort them out so over here we have uh defined our rna codon table very nicely so the thing is uh what i've done is i have created this variable i have added a is equals to sign then i started curly braces and then i added some comments that on the top we are these are the second bases uh this u c a g are the first bases and then there is another error yeah now it's sorted out so yeah last thing so then we know that uh this is a representation of the last element of this thing so if and you can see that uu represents phenine uuc represents phenine uua represents leucine and so on and so forth so if we will run this then we this table is stored in rna codon tip variable in order to get a specific value from this table rna codon table what we will do is uh we will write the name of the codon or name of the key in uh this square bracket so see you can see that we have all these different codons now we can select any of the codon let's select aaa and if we will run this we got lysine and we can see that over here we have yeah aaa and this represents two lysine and we can also define a very simple function define a translate rna codon c-o-d-n but we have to give this thing is a codon let's add a simple dot string returns the amino acid for the given dawn and this is going to be just one return statement return so since we have already defined rna codon table above we can use this table over here is going to be rna codon table and over here we will write codon let's define this and if we will run this function print or translate rna codon and give this a simple codon say uu then we got phenine and we see that eu is feeding and if we will give it um let's say ggg then we are supposed to get glycy so this is just one use of dictionaries dictionaries can be used for several things and they're very helpful in python so let's talk about different operations and different functions of python dictionaries for that i will define a basic python dictionary let's define a very simple dictionary and the name of that dictionary is info and in which we can add simple values like first name is equals to we have to keep the values in the inverted commas oh come on it's gonna be like this so first name is going to be ali then last name is going to be hassan then we can add something more h could be 25. now our dictionary is created we see that this is our dictionary now let's talk about different dictionary operations so the first operation is that in order to get any value of a specific key we will put we will write info and in the scare brackets we will write a key and the key is first a emmy name and it is supposed to give us ali now if we need to modify the first name we will add as equals to sign and then type the new value it could be jho and john now if we will just run this and then we will get the new value john now you can do one more thing you can multiply add or subtract or perform all the operations to a specific value of a dictionary key let's say i want to add 1 to the h we can see that currently our age is 25 over here if if i want to append it by one i am going to write it plus is equals to one and if we will run this age again we will see that now the age is 26 similarly you can also multiply and divide and do all sorts of stuff if you want to delete a specific key you will have to write del and then you will write the name of the dictionary after that in the brackets you will write that specific key if i will run this and then i will see what's inside our info then we see that there is only first name and last name let's talk about some dictionary methods so the first method is the get method and by this method you will give it a key like first name and it returns the default value right if that is not provided it will give you it won't give you anything because uh first name with double e is not present in that dictionary so if you want to get all the keys what you will do is you will use this function keys you will get that dictionary keys as first name and last name if you want to see all the values then you will use this values function john's and hassan if you want to see key like tuples you can use this method items and this will show you the all the keys and the things like that now previously we have defined this rna codon table but we haven't tried to print this and see how it's get printed so let's print rna codon table and we will see that it is printed like a single line very difficult to read so let's import pretty print which will help us printing it in a very nicer way we will import it just like this from p print import p print as pb instead of writing print we will write pp over here and then we will run this now you can see that this is printed in a very nice way we have all the keys with all the values one by one and you might have also noticed that these keys are arranged in ascending order in alphabetical order first of all we have all the a's then we have c's and we have gs and at the end we have the use you can see that this is a good way to print this whole big dictionary and in future i will also tell you how you can print this dictionary in this way so that's all about dictionaries today in the next video we will be talking about files how to handle files with python code if you have any questions comments or concerns about this video feel free to comment down below i will be happy to help you out other than that if you want to join our bioinformatics guys community which is a facebook group you can join it by using the link which is in the description down below and you can also find an article about the same video on my website bioinformatics guys and you if you want to see the script you can see the script on my github repository links are given down below so that's all for today if you want to know what i do other than programming you can check out my vlogging channel and i will see you around in the next video  -->