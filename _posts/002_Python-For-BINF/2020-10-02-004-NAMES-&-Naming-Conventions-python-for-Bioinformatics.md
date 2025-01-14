---
date: 2020-10-02 12:36:40
layout: post
title: Names & Naming Conventions
subtitle: Following the naming conventions in Python can be really helpful.

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 4
video_id: nvv5LUg0f54
description: Following the naming conventions in Python can be really helpful for understanding the code and it can also save a lot of your time in the long run.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-004.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}


Hello, Bioinformatics Guy here! 

In this installment of our Python for Bioinformatics series, we’ll delve into the world of names and naming conventions—a small yet critical topic that forms the foundation of effective programming. Think of it as naming a newborn baby but without the family debate! 

Let’s jump right in.

# What Are Names in Python?
In Python, a name is essentially a label for a value. You can assign any name to any value using the = operator. This makes working with data—like protein sequences, DNA sequences, or numbers—much easier.

```python
>>> pro1 = "MNK"  
>>> pro1
"MNK"
>>> pro2 = "AARHQGR"  
>>> pro2
"AARHQGR"
>>> dna1 = "ATGCTAGC"  
>>> dna1
"ATGCTAGC"
>>> dna2 = "THEGATACGA"  
>>> dna2
"THEGATACGA"
```
Here, names like pro1, pro2, dna1, and dna2 are assigned to respective protein or DNA sequences. Let's check the length of some of these:

```python
>>> len(pro1)
3
>>> len(dna1)
8
```

Let's try what is stored inside this anme dna3:

```python
>>> dna3
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'dna3' is not defined
```

Let's assign same value to dna3 name: 

```python
>>> dna3 = dna2  
>>> dna3  
THEGATACGA
>>> dna2  
THEGATACGA  
```



## Key Takeaways on Names:
- Names are like containers that store data.
- If a name hasn’t been assigned a value, Python will throw an error.
- You can assign the same value to multiple names


## Chaining and Shortcuts in Assignments
You can chain multiple names to the same value:

```python
>>> a = b = c = D = 0
>>> a
0
>>> b
0
>>> c
0
>>> D
0
```


## Chaining and Shortcuts in Assignments
You can chain multiple names to the same value:

```python
>>> age = 0
>>> age = 1
>>> age = age + 1
>>> age 
2
>>> age += 1
>>> age
3
>>> age -= 1
>>> age
2
```

This shorthand, called augmented assignment, works with addition, subtraction, multiplication, and division.

> Try this short cut assignment with multiplication and division and post your answers in the comments below.

## Why Naming Conventions Matter
Proper naming conventions help others (and your future self) understand your code better. Imagine naming a variable l or O. These can be confused with 1 or 0 in most fonts, leading to unnecessary errors and confusion.

Here are some essential tips:
- Avoid Ambiguous Names:
  - Don’t use single letters like l, I, or O. 
  - See Example below:

```python
>>> l = 10  # Is it a lowercase L or a 1?  
```

- Follow Standard Naming Conventions:

  - Use snake_case for variables and functions.
  - Example bwlow

```python
protein_sequence = "MNK"  
```

- Start Names with Letters or Underscores Only:

  - Numbers at the start of a name are invalid.
  - Example:

```python
# Incorrect: 1st_protein = "MNK"  
# Correct: first_protein = "MNK"  
```

- Keep Names Descriptive:
  - Names should indicate their purpose.
  - Example

```python
# Not ideal: x = "MNK"  
# Better: protein_sequence = "MNK"  
```


# Further Reading

To explore naming conventions in greater detail, check out [PEP 8 Naming Conventions](https://peps.python.org/pep-0008/). This Python style guide offers best practices for clean and readable code.



# Final Thoughts
Naming is a small but vital part of Python programming. It ensures clarity and prevents misunderstandings, especially when working on collaborative projects or revisiting your code later.

Thank you for reading, and I’ll see you in the next post about [Defining Functions](/005-DEFINING-FUNCTIONS-python-for-Bioinformatics/).

Happy coding!

{% include next-prev.html %}

<!-- hi everyone guys bye informatics guy here with another video of the series python for bioinformatics in this video we will be talking about names and naming conventions this is a small teeny tiny topic but the thing is in the world of programming languages you cannot survive with this topic so let's get started all right naming in python is just like naming a newborn baby with this one exception that you don't need to have approval of all the family members at your home before assigning a name to anything in python you can just choose to assign any name to anything in python so it is denoted by a single equal to sign all it does is to name a value so let's try this pro one protein one and we can name it m and k m and k l okay so we have to start python in our terminal first p y t h o and three okay now we can assign name pro one is equals to m and k m and k l so this sequence of protein is stored in this name pro one so let's try it saving another protein sequence pro two this sequence could be aar hq [Music] gr now let's save a dna sequence dna 1 equals to atg c t a g c let's name another dna sequence dna 2 t-h-e g-a-t-a-c-g-a all right so you have noticed that nothing is printed unless you type the name so let's type pro one and you got this left type dna one and you got the dna one you can check the length of the dna just by using the length function dna one you can check the length of pro one all right so dna three oh we got that because we haven't saved or assigned anything to this name dna three so that's why we got the error so there is one cool thing that you can do you can assign the same dna 2 to dna 3 both dna 2 and dna 3 are going to contain the same sequence you can check that out over here dna 3 and then dna 2 all right so both have the same sequence now names can also be chained together like a is equals to b is equals to c there can be something capital is equal to zero now you will see that a is also equal to zero b is also equal to zero d is also equal to zero and so is the c so this is really handy in programming and we will talk about it later on now there is a bit of shorthand for arithmetic updates in python let me explain it with an example suppose that a new baby is born and age of that baby at that time will be zero so we store the age of that baby in this variable age and that age will be zero we can store it simply like age equals to zero now after one year the baby is going to be one year old so if we have to update this age variable so that it has one rather than having zero the simpler way will be age equals to one so this is one way to assign a new number to that same variable again and again you know that we are adding the number of years so we can add one to the same variable so we can do it like age equals to age plus one and you will see that now 8 is equals to 2 so the short end in python is very simple and very handy so you can do it simply age plus equals to 1 right you don't have to type age again and if you will see what's inside age you will get three so this is an argumented assignment statement and it can be applied to subtraction to multiplication to division so on and so forth let's try it with subtraction age minus equals to 1 and you will see that the age is 2 now now if you want to try it with multiplication you can do it simply like age star equals to 2 and age will be four if you want to try it with divide age slash equals to two and you will see that age is back to two the next thing i'm gonna talk about is naming conventions it is not compulsory but i highly recommend you to keep on searching on google about this topic i will show you the way how you can do that and while you learn python through this series just keep this topic in your mind what are the naming conventions that are supposed to be followed in python so in this way while you are learning python you will develop the correct habit of naming things in pythons correctly so i will be explaining it very briefly as cumbersome details are not gonna make much sense at this point once you are done with this whole series i will hopefully make another video on the naming conventions in which i will explain the naming conventions that are needed to be followed in full detail so let me explain it with an example now the example is you know that whenever you have to name a newborn baby you see that whether a baby is a boy or a girl and you name that uh baby accordingly so the benefit of following these naming conventions with reference to the gender is that correct names help us to know whether a person is a male or female without even seeing them like generally if you hear this word sarah you know that this is going to be a female and if you hear this word john you will know that this is going to be a male similarly in python we follow naming conventions that help us to know beforehand before seeing the object or the thing in python just by their names there are quite a few naming styles that are followed in python and you can read more about them over here pep 8 naming conventions alright so you can go through this website i will put the link in the description down below and you can read a little bit about over here uh what are the naming conventions that are being followed in python you can go through it on your own like there is this limit of 79 characters there are a lot of details over here however for starters let me share a few very basic naming conventions that you need to keep in mind whenever you are trying to name something in python so first off don't name anything with capital l capital i or small l as you can see that this capital l capital i and small l are very similar to each other in fact this i and l are exactly like each other in most of the fonts that are used in text editors so if you will name something with these single alphabet characters if someone else is reading your code they might get confused whether it's an l or a capital i or a capital l right the second thing that you need to keep in mind is that never name something with a single alphabet letter o because you know that this is o and this is zero they are very much similar to each other but over here in terminal you see that there is a small dot which makes you feel like it's a zero however in the o and there is no dot it makes a little bit easier to differentiate between them just like i mentioned before in most of the text editors the phones that are used in zero and o are very alike so it's quite hard to differentiate between them you can try o is equals to zero which is logical you are storing the value zero in this alphabet name o but you know now this don't make much sense well like zero is equal to zero you are doing 0 is equal to 0 or what are you doing moreover if you will go the other way around like if you will try something like this 0 is equal to capital o which is again very similar and it's going to confuse other people who are going to read your code not only this this is also an invalid statement because there should be an alphabets in the names and names don't start with a digit so you got the syntax error over here so i will keep on adding a few tips on naming conventions in my videos so that you will keep on learning the naming conventions alongside the whole series so that's all for today if you have any questions comments or concerns about this video do let me know in the comments down below moreover if you want to see the scripts that are used in this video you can always check out the link of our website that will be available in the description and lastly if you want to know what i do other than programming you can always check out my vlogging channel right over here so thank you very much for watching and i will see you around in the next video [Music]  -->