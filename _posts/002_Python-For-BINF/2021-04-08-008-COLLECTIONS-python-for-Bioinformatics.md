---
date: 2021-04-8 12:36:40
layout: post
title: Collections
subtitle: Exploring Python Collections for Bioinformatics -- Sets, Tuples, Lists, and Dictionaries 
series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 8
video_id: VP26CcroFH8
description: Let's save the tabular data in the dictionaries.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-008.png


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

In today’s blog post, we’ll dive into Python collections and how they can be leveraged in bioinformatics to handle DNA and RNA sequences, ranges, and other essential data structures. Understanding these core concepts will help you write cleaner, more efficient code for your biological data analyses.

# 1. Sets in Python
A set in Python is an unordered collection of unique elements, perfect for tasks like sequence validation or removing duplicate bases.

## Creating Sets
```python
# Creating a set from a string
set("ATGCTAGCTAGA")
# Output: {'A', 'C', 'G', 'T'}
```

Notice that duplicate letters are automatically removed.

## Comparing DNA and RNA Bases
```python
DNABases = {"T", "A", "G", "c"}
RNABases = {"U", "A", "G", "c"}
print(DNABases)  # Output: {'A', 'G', 'c', 'T'}
print(RNABases)  # Output: {'c', 'U', 'G', 'A'}
```

Sets are case-sensitive, so `C` and `c` are treated as different characters.

## Validating a Base Sequence
The following function checks if a given sequence contains valid DNA or RNA bases:

```python
def validate_base_sequence(base_sequence, RNAFlag=False):
    """Return True if the base_sequence contains valid bases."""
    DNABases = {"T", "A", "G", "C"}
    RNABases = {"U", "A", "G", "C"}
    return set(base_sequence) <= (RNABases if RNAFlag else DNABases)

print(validate_base_sequence("ATGAG", True))  # Output: False
```


# 2. Tuples in Python
Tuples are immutable collections, meaning their contents cannot be changed after creation. They’re great for fixed data like codon-triplet representations.

## Creating Tuples

```python
# Tuple with DNA sequences
("ATCG", "TAGC")
# Output: ('ATCG', 'TAGC')

# Single string treated as a tuple
tuple("atgac")
# Output: ('a', 't', 'g', 'a', 'c')

# Tuple from a range
tuple(range(5, 10))
# Output: (5, 6, 7, 8, 9)
```

# 3. Lists in Python
Lists are mutable, allowing you to modify their contents dynamically. They’re versatile and widely used in bioinformatics.

## Basic Operations
```python
# Mixed data types in a list
[1, "sd", 123.11, [123, 123]]
# Output: [1, 'sd', 123.11, [123, 123]]

# List concatenation
list1 = [1, 2, 3]
list2 = [4, 5]
print(list1 + list2)  # Output: [1, 2, 3, 4, 5]

# Extending a list
list1.extend(list2)
print(list1)  # Output: [1, 2, 3, 4, 5, 4, 5]
```

# 4. Dictionaries in Python
Dictionaries store data as key-value pairs, making them ideal for mapping bases to their full names or codon translations.

## Creating a Dictionary
```python
# Mapping DNA bases to their names
{"A": "adenine", "G": "guanine", "C": "cytosine", "T": "thymine"}
# Output: {'A': 'adenine', 'G': 'guanine', 'C': 'cytosine', 'T': 'thymine'}
```

Dictionaries are excellent for tasks like genetic code lookups or associating sequences with metadata.







# 5. Bonus: Sequences and Ranges in Python
Ranges can be converted to sets, allowing you to create sequences for iteration or comparison.
Python's `range()` function is a powerful tool for generating sequences of numbers. It’s particularly useful when you need a predictable sequence of values, such as indices for loops or numerical datasets.

## Using `range()` with Sets
The `range()` function generates a sequence, which can be converted into a set to eliminate duplicates or to perform set operations. Let’s explore an example:

```python
# Creating a set from a range
set(range(0, -25, -5))
# Output: {0, -5, -10, -15, -20}
```

### Explanation:
`range(start, stop, step)` generates numbers starting at start, ending before stop, incremented by step.

In this case:
- `start=0`: The sequence begins at 0.
- `stop=-25`: The sequence ends just before -25.
- `step=-5`: Each step decreases the value by 5.


The resulting sequence is `[0, -5, -10, -15, -20]`, which is then converted to a set: `{-20, -15, -10, -5, 0}`.


This combination is particularly useful in bioinformatics when defining ranges for analyses, such as calculating GC content in windows along a genome or iterating through sequence indices. By converting to a set, you gain the flexibility to perform additional operations like intersections with other ranges.



# Why These Collections Matter in Bioinformatics
Python collections provide robust tools for managing biological data. Whether you’re validating a DNA sequence, mapping bases, or iterating over data, choosing the right data structure can simplify your code and improve performance.


# Wrap-Up
This quick dive into sets, tuples, lists, and dictionaries demonstrates how Python’s collections can be applied to bioinformatics workflows. If you found this helpful, stay tuned for more posts where we’ll explore advanced applications like sequence alignment, FASTA file parsing, and beyond.

In our next post, [Dictionaries in Python](/009-DICTIONARIES-python-for-Bioinformatics/), we'll explore how to store multiple Python objects in a single variable using dictionaries - a powerful data structure that lets you organize and access data using key-value pairs, perfect for managing complex biological datasets.

Let me know your thoughts, questions, or suggestions in the comments below. Happy coding! 🚀

{% include next-prev.html %}

<!-- [Music] hi everyone guys bioinformatics guy here with another video of the series python for bioinformatics in this video we will be talking about collections python has different items that group together different items if these items can contain unlimited numbers of different things it could be integer strings and it could be anything in python the good thing is that even these collections can also contain different collections so you can make a mixture of things as per your requirements so in python no strings are arrived there are no limitations and you can do anything you want to do so let's get started so in this video we will touch upon three basic types of python collections and later on we will deeply discuss those collections in detail so the first thing that we are going to discuss is sets sets do not allow duplicate items and they also don't allow individual access to the elements of the cell then we have the sequences in sequences we have numerical indexing like 0 1 2 3 you can access any of the element by giving the index then we have mappings mappings is a very special kind of thing and it's also very useful so in mapping what we have is we have a key a name and then we have its value so the difference between these different types of collections is based on how we can access individual elements in those collections so let's talk about sets a set is an unordered collection of elements with no duplicates in python you can make a new set very easily what you have to do is you have to use the set function and then in these round brackets you have to give a string or anything which is iteratable so you can give it a t g c t a g c t a g c a sequence and when you will run this you will get a set with all the individual unique values in this string and these this string will be splitted up by each character so you got a c gt now this way you can simply check that all of the characters are either a t g and c's since there is no indexing elements of the sets can appear in any order let's see a few more examples of sets and we can make dna bases is equal to t comma a comma g comma c and if we print this we got this similarly by the same token we can make rna bases and instead of t we will put u over here so we got rna bases as well as the dna bases so when a string is inside these curly braces and we run this code we see that a set is created but the string is not splitted up into individual characters and the same thing goes with when you have multiple sets of strings like let's say you have these two strings then you will see that now this set contains two unique elements with the help of sets we can write validate base sequence very easily so we will define validate base sequence and then we will give it a base sequence let's create rna flag as well and initially we will keep it false now let's add a dog string as well because it is really good practice to add doc strings we will say that return true if the string base sequence contains only upper or lower case t or u in case of rna flag a g and c characters otherwise let's close this stock string and oh we were not supposed to run this um let's complete this function first so now what we can return we can return in just like one line we will return you know we created these rna bases and dna bases so let's put them in the function we had a string and then we used this set function and it returned the unique values now we can do the same thing over here we will say set and then we will take it or we will keep base sequence over here then we will check if set is less than or equal to rna basis if rna flag else dna bases let's define this first it's again giving us an error oh the spellings are not correct now this function is defined and let's try running this print validate base sequence over here we can give it a t g c t h g we see that we see that this c and c is small so it's always a good idea to see if our dna based sequence or rna based sequence is in capital letters or small letters you can use dot upper to modify this let's keep it this way and we have to rerun this and redefine the function now it is supposed to give us true if we will add some random character like y and it is supposed to give us false and if we change it to u and also give it another argument then which is true then it also supposed to give us true and because it's an rna sequence and if we make it a dna sequence and or keep the rna flag true it is supposed to give us false okay so let's talk about sequences sequences are ordered pair in which there can be duplicates and we can access individual elements of the sequence unfortunately in python we have sequences as well as in bioinformatics we have dna rna sequences so whenever i'm talking about a python sequence i will explicitly say python sequence otherwise i will say the sequence as i already told you that these are ordered and we can access them with the help of proper indexing now there are six types of python sequences string bytes byte arrays range tuples and list very important one less we have already talked a little bit about strings in the previous videos we will also talk about them in detail in the future and buys and buys arrays are not important so in this video we will briefly discuss range tuple and list so let's start with range we add another heading range so a range represents a series of integers it might not look very useful at the moment but in python it has a very fundamental role so with one argument range and then we add a stopping point but one thing it will not include the stop integer when you will run range 4 it will give you a range object you can also check its type by you using the function its type is range what we have to do is we have to convert it into set in order to get the unique values or we can also change it to list and it will give you a list right so let's talk about set screens we already know what sets are so we will change this to set now you can see that we got 0 1 2 and 3 but we haven't got four we got four characters but we haven't got the fourth four integer you can also call range range with two arguments in which we have a starting point as well as an ending point let's say if we want to start from true and end at 4 then it will give us only 2 and 3 because 4 is not included now there is a interesting question what will happen if the starting point is greater than the ending point like this if it is 6 over here and 4 at the end what will happen you can find this out on your own and comment down below and let me know there is a third argument as well and that is when you need a step so if we want to go from one to ten and skip every second element we will write the step as two so now you see that we got one then two is kept then we got three then four is kept and we got 5 and if we change it to 2 then we would be able to get all the even numbers up and down so i have already showed you a few examples but let's discuss about some examples when the step isn't negative when the step is in negative it will go back it will go in the reverse order and then our starting and ending points are also supposed to be according to the negative steps right now we see that 2 is not included the ending point is always not included but the starting 10 is included we can see that if we want to start from 0 and go up till -25 with step of 5 with step of 5 then we can see that we got this negative table from starting from minus 20 up going up till uh zero so that's all about range is let's talk about tuples let me make it a heading so tuple is an immutable sequence that can contain any type of element so in order to create a tuple we use round brackets and we can put strings over here so this is a tuple and we can also create one element tuple just like that we can also create an empty tuple this is an empty tuple let me zoom in a little bit have you noticed that i have made a small mistake over here you can see that if we we have atcg and this is in the bracket if we have only one element and we put it in the round braces we see that we got this string it is not a tuple you can even check its type and you will see that it's not a stop you know you it is a string in order to make a tuple with one element you will have to add a comma after the first element so that in that way it will know that this is going to be a tuple now it's a tuple so just like the sets if we put a string in round brackets we will get individual elements as double so we got this atg ac now this is the tuple as we were previously discussing the range we can also make tuples from a range from 5 to 10. so we got another tuple so tuples are not that much used in python so let's move to less and i'm telling you lists are very important in python so list is a mutable sequence of any kind of element lists are highly flexible that's why they are widely applicable type of the container one way of thinking about lists is that lists are mu tabletop in tuples we we saw that we cannot make any changes to the tuples but unless we can make any kind of changes we can add the elements we can delete the elements we can change the elements we can do anything we want to do and that is the same reason why tuples are not most commonly used because they are not mutable and we usually need to update the list and change and do things like that and we are not allowed to do that with the tuples so tuppers have very specific kind of use when you know that you are going to create a sequence and you don't need to change anything you don't need to add anything you are supposed to use it just the way it is so syntax of list is very easy you will use scare brackets and then you can add elements you can add integers then you can put on a string over here then you can add a float over here and every element is supposed to be separated by commas you can also add another list in in this let's run this and you got a list in which we have different elements an integer a string a float and another list which contains two elements a string uh two integers let's create two lists list one and let's add a few elements one two and three let's create another list list two and let's add some other elements four five that's all and now we can add two list very simply so print list one plus list two so we got one two three four five and if we will print list one again we will see that the list one has not changed now if we want to change or mutate the list one what we have to you do is we have to use this extend function list one dot extend and then we can extend it by with the uh by list2 so now if we will run printless one list one will be updated see we got one two three four five but since we haven't performed any function on list two if we will print list two uh then we will see that list2 is not modified it's just the way it was so let's talk about the last and very important thing mappings so there is only one kind of mapping in python and that is this dictionary this physical dictionary and python's dictionary are very similar in this dictionary we we know that we have this word mexican and then there will be a definition of mexican and in python we also have a word or a key and then we have a value of that key so one important thing about dictionary is that these are unordered and they are mutable you can make changes in the dictionaries apart from that we can access individual elements of dictionaries by using the specific value of a specific key so let's create a very simple dictionary as we know that there are four bases a t g and c and then we know that they represent adenine gone in thymine and cytosine we can create a dictionary for that and to create a dictionary we will be using curly braces and our keys are supposed to be in the strings because these are the names so our first key could be at a and its value is going to be followed up by this colon so we have a d e n i n e adenine then we have the g for g g u a and i n e gone in then we have c for cytosine then we have t for thymine t ts by mini now we have created a dictionary in which we have we have four keys a g c and t and their values are is is value is adenine g's value is gone in c value cytosine and t's value is thymine so that's all that i want to talk about dictionaries in this videos because in the next video we will talk about the dictionary in great detail so that's all for today and if you have any questions comments or concerns about this video you can put them in the comments down below i will happy to help you out apart from that if you want to see this script i have shared it in my github repository you can find the link for that down below you can also get help from our bioinformatics guys community which is a facebook group you will find the link in the description down below and if you want to know what i do other than programming you can check out my vlogging channel so that's all for today thank you very much for watching and i will see you around in the next video do  -->