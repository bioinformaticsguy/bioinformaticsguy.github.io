---
date: 2021-02-23 12:36:40
layout: post
title: Unlocking Python Modules
subtitle: Modules will enable you to access millions and billions of useful functions.

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 6
video_id: e7mbdD5Q6Oc
description: Modules will enable you to access millions and billions of useful functions.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-006.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}


Hello, bioinformatics enthusiasts! 

Welcome back to the *Python for Bioinformatics* series. In today’s post, we’ll explore the concept of Python modules—a powerful feature that extends Python’s capabilities by providing pre-defined functions and methods. Whether you’re analyzing DNA sequences, simulating mutations, or working with complex datasets, understanding Python modules will elevate your coding skills.  

# What Are Python Modules?  
A Python module is essentially a script file that contains Python code, such as functions, classes, or variables. Modules are designed to promote code reuse, making your scripts more organized and efficient.  

### Built-in vs. External Modules  
- **Built-in Modules**: Included with Python’s installation (e.g., `os`, `math`, `random`).  
- **External Modules**: Need to be installed separately (e.g., `Biopython`, `NumPy`).  
- **Personal Modules**: Custom modules created by you or your team for specific tasks.

# Using Python Modules  

## Importing Modules

Instead of importing everything, you can selectively import functions, classes, or variables from a module.

```python
from module_name import name1, name2, name3
```


To use a module in Python, you simply use the `import` statement:  
```python
import os
import math
from random import randint
```

For example, importing specific elements from the math module:

```python 
from math import pi, remainder
print(pi)  # Prints the value of π
print(remainder(10, 3))  # Computes the remainder of 10 divided by 3
```

## Using Aliases for Imported Items

You can also rename a module for convenience:


```python
from math import factorial as fac
import random as rnd
```

## Importing Everything from a Module
To bring all items from a module into the namespace:

```python 
from math import *
print(sqrt(16))  # Prints 4.0
```

> ⚠️ **Caution:** Avoid using `*` in larger projects to prevent name clashes.

## Using the `sys` Module to Access System Information
The `sys` module provides system-specific parameters and functions:

```python
from sys import version
print(version)  
# Prints the Python version for example see below:
# '3.8.5 (default, Jul 28 2020, 12:59:40) \n[GCC 9.3.0]'
```

Or you can import the entire module:
```python
import sys
print(sys.version)  # Same output as above
```

## Random Number Generation with `random`

```python
from random import randint

def random_base(RNAFlag=False):
    return ("UCGA" if RNAFlag else "TCGA")[randint(0, 3)]

print(random_base(True))  # Example output: U

def random_codon(RNAFlag=False):
    return random_base(RNAFlag) + random_base(RNAFlag) + random_base(RNAFlag)

print(random_codon(True))  # Example output: UCC
```

## Random Base Replacement in DNA
Here are three approaches to randomly replace a base in a DNA sequence:

### 1. Using Temporary Variables
```python
def replace_base_randomly_using_names(base_seq):
    position = randint(0, len(base_seq) - 1)
    base = base_seq[position]
    bases = "TCGA".replace(base, "")
    new_base = bases[randint(0, 2)]
    return base_seq[:position] + new_base + base_seq[position+1:]

print(replace_base_randomly_using_names("ATGCTA"))  # Example: 'ATGCCA'
```

### 2. Using a Single Expression
```python
def replace_base_randomly_using_expression(base_seq):
    position = randint(0, len(base_seq) - 1)
    return (base_seq[:position] +
            "TCGA".replace(base_seq[position], "")[randint(0, 2)] +
            base_seq[position+1:])

print(replace_base_randomly_using_expression("ATGCTA"))  # Example: 'CTGCTA'
```

### 3. Simplified Version

```python
def replace_base_randomly(base_seq):
    position = randint(0, len(base_seq) - 1)
    bases = "TCGA".replace(base_seq[position], "")
    return base_seq[:position] + bases[randint(0, 2)] + base_seq[position+1:]

print(replace_base_randomly("TTTTTTTTT"))  # Example: 'TTTTTTTCT'
```

# Working with DNA Sequences Using BioPython
`BioPython` is a powerful library for biological computations. Let’s explore sequence manipulation:

```python
from Bio.Seq import Seq

my_random_seq = Seq("ATGCTATATATATGCGCGCGCG")
print(my_random_seq)  # Original sequence: 'ATGCTATATATATGCGCGCGCG'
print(my_random_seq.complement())  # Complement: 'TACGATATATATACGCGCGCGC'
print(my_random_seq.reverse_complement())  # Reverse complement: 'CGCGCGCGCATATATATAGCAT'
```

# Summary
In this blog post, we covered:

- Importing modules: Selectively, with aliases, or entirely.

- Practical examples: Random DNA/RNA generation and sequence manipulation.

- Using libraries like BioPython to simplify complex tasks.

Modules are a core feature of Python, enabling modular and maintainable code. Experiment with these examples to deepen your understanding of Python's module system!

Thank you for reading! In our next post, we'll explore [Importing .py Python Files](/007-IMPORTING-.py-PYTHON-FILES-python-for-Bioinformatics/), where we'll learn how to create, import and use our own Python modules and packages. We'll cover different import methods, package structures, and best practices for organizing larger Python projects.

{% include next-prev.html %}

<!--
# Examples with Built-in Modules
## Generating Random Numbers
The random `module` is often used in bioinformatics to simulate random sequences or mutations.

```python
from random import randint

# Generate a random base
bases = ['A', 'T', 'G', 'C']
random_base = bases[randint(0, 3)]
print(random_base)
```


 hi guys bioinformatics guy here with another video of the series python for bioinformatics in this video we will be talking about the modules so apart from the basic functions methods and objects python also provide a large variety of optional functions and methods these function methods can be imported into python by using the modules so modules are basic python script files which are present in the library directory and this directory is created alongside the installation of python you can also download and import different kind of other modules which are not part of basic installation of python and then you can also use them module file is basically a python script which contains the definition of the functions and those definitions can change the docs strings and docs strings explain the functionality and the basic purpose of those functions so in this video we will be talking about the basic use of python modules and how to import them and how to use those functions so let's get started okay let's start with importing a module contents are brought into the interpreter by a simple import state the basic form of the import statement loads the module into the python environment it's gonna be just like import and name is gonna be the name of the module for example the module os provides an interface to the computer operating system you can simply import it by import os let's run this and it is important now as i already told you that there are a lot of python modules already installed alongside python installation so in order to use them we run the import statement and what import statement does is that it imports that module name into the python interpreters library and then you are able to use that function or the module sometimes you don't need to import everything of a module and you can only import a few functions of that module and this is gonna be very simple let me make it a bit bigger we have to type from modules name import name one comma name two comma name three and we can import more than one modules at a time so let me give you an example of this we can import from math import pi and import remainder all right let's run this and this is important sometimes you want to change the name of the module that you are importing so you can report it as alien from math import factorial as fact so now you will be able to use it as fact if you want to import all the names what you will have to do is to import you are from math import and then use the star sign it will import everything in the math module so you should not be imported everything because you don't know what names you are importing and sometimes that the functions you have created might cause conflict so it's always better to import a function and then use import as and use specific name for that function that you have imported so that you will know that i have imported this function by this name and then it won't cause any conflict in your code let me give you another example of the module says if you will import says then for every function you will have to write down says dot version this dot the function name this dot the version name from this import version you will only have to type version and then you will get the value see you got the version and if you will import only says import says then what you will have to do is to you will have to write says version in order to get the version i don't think so version is gonna work right now yeah it is working because we have already imported that so let's talk about the random module random module is a very useful module so one of the functions that is most widely used in python is random dot random it will import a random integer between a range so you will have to add two numbers in the as the arguments of the functions for example random dot rand and one comma four will return one two three or four both of the numbers are included like one will also be included in four will also be included now let's write a function that will return a random base let's import from random import rand int let's run this and in the new cell let's define our function def and the name of the function is going to be random base and let's also make our rna flag and let's keep it by default as false all right now we will return u c g a f r n a flag now if rna flag is true then it will consider ucga else it will consider atgc or you can write tcga all right then we have to select our now here we will use the render our a and event end and we need from 0 to 3 so 0 1 2 3 4 option let's run this and see if the function is defined now it's defined very nicely let's try a few example print um then random base and over here we can run this we got a we got t we got g we got g then we got c let's make the rna flag true or just write true over here let's run this again now this time we should be able to see a u once in a while see now we got the u by using this random module let's define another function that will return a random codon of three bases def random codon we will also create rna flag over here and by default let's keep it false now we will return we will use the previous function random base rna flag plus since we need three codons we will just sum these three times sounds good let's run this and see if this function is defined properly this function is defined properly let's try a few examples print random codon we got att gtd tga tta let's turn the rn flag through so that we will get the rna rna codons now we got ugg see it's working very good now you might have noticed that how breaking down a code into smaller functions help us we first defined a function that returned us a random base and then we use that function in another function to get a random codon so defining small functions is just like building up your vocabulary you will define a small function then it's gonna be added to your vocabulary and then you can use those different functions to make out a huge sentence and or you can say that a huge function so rather than making a huge function uh it's always suggested to make smaller functions so that you can use those smaller functions in your upcoming future functions okay now let's make a function that simulate a single base mutation let's name this function replace base randomly using the name of the function is very long but you will get to know why i'm naming this naming this function like this very soon and we will be needing a base sequence and let's define a dot string as well in our dark string to turn a sequence with a base at a randomly selected position of a base c replaced by a base chosen chosen randomly from three bases that are not in that position so let's see what is our position going to be so our position could be anything so we will use the rand in again and our position could be anywhere from 0 to the length of our base sequence minus 1 why we are subtracting it because we know that that of the length function is gonna start from one and our random brand end is inclusive of all the numbers so we are subtracting one all right this is gonna be our position and let's add a shortcoming minus one because land is one past end if you want to be sure about why we are doing this minus one you can just go into a python interpreter or python shell and then you can see that what is the length then you can try importing from zero to the answer that you get without the minus one and you will see an error okay so our base is gonna be base c position so this is gonna be our base that we are supposed to change and our total bases are gonna be tcga simple okay i was not supposed to run this because this function is not completed yet so now we got to replace the base we will replace the base by basis dot replace and then we will replace our base with an empty string our new base is going to be basis and it's going to be rand in 0 comma 2 okay now beginning is gonna be base c and it's gonna be from zero till the position let's add a small comment up to position and then our end is gonna be from base sequence and this time we will start from the position position plus one because we have our beginning is still position now we need to move to the next one and if we will keep this empty we will get all of the rest of the stuff we will return the beginning plus our new base plus and sounds good let's try to run this okay no it's not working fine string object is not callable yeah this is there all right so there was this uh stupid braces over here so it's running just as fine let's try running this print we are gonna be using our function replace base randomly using names and then our string is going to be atgc ta let's run this and see what we got we are getting atgcga so t is changed to g so atg ctc atg gta atg cca so let's define the same function with a little bit of complex board and this time we won't be using a lot of assignment statements so def replace base randomly using expressions using expression and we will give it base sequence basic and let's come to the bodyguard function so our position so our position is simply going to be the same brand end and then it's going to start from 0 and it will go to the length of the base sequence minus one and you know why we are doing this minus one now our return statement is gonna be very long so what we need now is we need base sequence and we need the starting position which is gonna be zero to the position all right then we will add the the new base and new and we get the new base by tcga and we replace it with base sequence at the position with an empty string and then brandon 0 comma 2. now we will add the ending and the ending is going to be base okay let's move to the next line all right let's write this in the next line then write this in the next line okay so it's gonna be base c and position plus one till end so we will keep this empty let's run this this function is defined really nicely okay let's write a new example print replace using expression then our base is gonna atg cta let's run this we got atg cca this t is replaced with this c let's run this again ctg so this a is replaced with this c c t g c t a so there is no clear cut rule about how many assignment statements are there it should be in a function and how much complicated your function should be in case of this function something between these two extreme is going to be very perfect let's take a look at a moderate function let's make a new cell and define the place base randomly and base c so position is going to be same brand int and then it's going to be 0 till length of base c minus 1 we will keep the empty string over here tcga dot replace and then base pull c position with an empty string and what we will be returning over here is base sequence and it's going to be the beginning so it will be zero till position and then we are supposed to add the new base and new base is spaces then rand end and it's gonna be zero till two that's at the ending and ending is gonna be base c and this is going to be position plus one and we will go till the end so this function is defined let's try an example print uh-oh print replace randomly let's try only t is this okay so we got g now it's replaced uh c is replaced a is placed so you can see that there are quite a few random replacements over here all right now let's talk about a module that i installed myself and the name of this module is bio python let me show you it on website bio python you can install it yourself and then you can explore it i will give you a very basic example of it you can see over here how to download it and they will also tell you how to install bioware python you are supposed to use the pip to install this and let me give you a very basic example of how this is gonna work so from bio dot c okay if you don't know how i got to know this that i am supposed to use bio dot c what you will have to do is you will have to go to the documentation of bio python and then you can see over here that everything is described um you can see wiki wiki documentation this is the seat and over here it's returned that i'm going to be working on the same example and we'll let you know how this thing works so from bio dot c we have imported the seek and let's make a new cell and let me tell you how you are going to make a sequence object written by a python module so in order to do that we will name it my random seek and it's going to be equal to we will have to use this function c and in the argument we will put our sequence a d g c d a d a t a t a g c g c g c so our sequence is defined let's see what we get by this simple variable we get this let's try printing this it's saying that this is an object of sequence my random sequence and now we got a sequence now let me show you the magic so in this new cell over here if we use a complement function dot complement then it's gonna return the complement dot of our c now you can see that a is changed to d t is changed to a g string to c and over here this c is changed to g so it's gonna it's taking the complement you can also take the reverse complement so we will write okay we will write dot reverse complement now you will get the reverse complement of the same string so now you can see that we were able to do several functions because of the biopython module all right that's all for today in the next video we will be talking about python files if you have any questions comments or concerns about this video feel free to comment down below moreover if you want to discuss something you can check out our bioinformatics guys community which is a facebook group i will put the link in the description down below if you want to know what i do other than programming you can check out my vlogging channel thank you very much for watching and i will see you around in the next video you   -->