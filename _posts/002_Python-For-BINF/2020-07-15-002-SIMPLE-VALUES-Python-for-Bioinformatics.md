---
date: 2020-07-15 12:26:40
layout: post
title: Simple Values
subtitle: The building Blocks.

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 2
video_id: KUXgAjSz4ro
description: If you have never learned programing language and you are from the field of Biology. You can learn python with examples from the realm of Biology. 

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-002.png


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

It’s the Bioinformatics Guy here, back with another installment in our series: Python for Bioinformatics. In this post, we’ll cover one of the fundamental building blocks of Python programming: simple values. These include Booleans, integers, floats, special values, and strings. Understanding these concepts is crucial for working with biological data, so let’s dive in!


# Booleans: The Logical Values
Booleans represent true or false states, often used in decision-making processes in programming.Booleans are case-sensitive, so True and False must start with uppercase letters.

Here’s how you define a Boolean in Python:
```python
>>> True
True  
>>> False  
False 
```

To check the type of a value, use the type() function:
Here’s how you define a Boolean in Python:

```python
>>> type(True)  
<class 'bool'>
```
Remember, boolean values are case-sensitive in Python, so ensure correct spellings when using them in your code. Booleans will become very useful in future lessons when we discuss logical operations and conditional statements.

# Integers: Whole Numbers
Integers are the simplest form of numbers. Just type them in—no commas or extra characters. They are used extensively in various computations. They include both positive and negative whole numbers:

```python
>>> 3
3
>>> -7
-7
```

To check the type of an integer, use:
```python
>>> type(10)   
<class 'int'>
```

Note that Python does not use separators like commas or periods in large numbers. Instead, you’d write:
```python
>>> 1000000  
1000000
```

You can also check the class of the integers.


```python
type(1)
<class 'int'>
```


You can also enter a very huge integer like this:

```python
>>> 1234531244038974908237
1234531244038974908237
```

You might have noted that commas and seprators (which are there to make the huge numbers more readable) 
are not used in python for integers.

# Floats
Floats, short for floating point numbers (also known as Decimal Numbers), are used to represent 
decimal values or numbers in scientific notation. In Python, the term "float" refers to a data type 
used to represent decimal numbers (numbers with a fractional part). 

Here's a glimpse:

```python
>>> 2.5
2.5
```

You can also check the type by using the type function:
```python
>>> type(2.5)
<class 'float'>
```

Python automatically switches to scientific notation for extremely large float values.
```python
>>> 123213123123123123123.12321329
1.2321312312312313e+20
```


# Special Values
The special value `None` denotes the absence of a value, often used to indicate missing data in datasets. If you will 
type None in the python shell and hit enter you will not get back any thing like you used to get with other types.
See the code example below:
```python
>>> None
>>>
```

We will see how and where None can be used in later videos.

# Strings
Strings play a crucial role in bioinformatics, especially when dealing with DNA, RNA, or protein sequences. 
They are enclosed within single quotes, double quotes, or triple quotes for multiline strings:

```python
>>> "Python for Bioinformatics"
'Python for Bioinformatics'
```


Lets take a look at the protein sequence:
```python
>>> 'MKMDLMK'
'MKMDLMK'
```

Lets take a look at the DNA sequence:
```python
>>> "ATGCTCTCGTCGACGACDAT"
'ATGCTCTCGTCGACGACDAT'
```

Strings enable us to represent and manipulate textual data efficiently, 
making them indispensable in bioinformatics workflows.

Next we will be talking about [Expressions](/003-EXPRESSIONS-python-for-Bioinformatics/).


{% include next-prev.html %}