---
date: 2023-04-01 12:36:40
layout: post
title: Exception Handling
description: Let's handle exceptional cases in Python.
subtitle: Avoiding Disasters | Exception Handling Best Practices for Bioinformaticieans

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 19
video_id: KssR2QMp7lQ

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1682903082/002%20Python-for-Bioinformatics/00019_PythonForBioinformatics_ggmagy.png


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


Today we will be talking about how we can handle exceptions in python code. In bioinformatics, where large amounts of complex data are analyzed which can take hours to run, it is especially important to handle exceptions appropriately to ensure the accuracy and reliability of results.

For example, a common bioinformatics task is to parse large files
containing genomic or proteomic data. If an error occurs during parsing,
such as an unexpected character or malformed sequence, an exception
handler can be used to catch the error and handle it in a way that does
not compromise the integrity of the data.

Another example is when using external libraries or APIs in
bioinformatics analysis. These libraries may raise exceptions for
various reasons, such as invalid input or server errors. Exception
handlers can be used to catch these exceptions and handle them in a way
that allows the program to gracefully recover from the error and
continue executing.


In Python, try and except are used for error handling. The basic idea is to try to execute a block of code, and if an error occurs, catch it and execute a different block of code.

Here's the basic syntax for using try and except:


```python
    try:
        try-statements 
    except ErrorClass: (TypeError, ValueError, NameError)
        except-statements
```


| <span style="font-family: Times New Roman; color: Red">__You might be wondering what is error class now!__</span>


In Python, an error class is a type of object that represents a specific category of errors. Error classes are used to handle errors that occur during program execution and provide information about the type of error that occurred.

Python comes with a large number of built-in error classes that are used to represent different types of errors. For example, the ValueError error class is used to represent errors that occur when a function is called with an argument of the correct type, but with an inappropriate value.



## Some Examples of common python errors.

### TypeError
You cannot concatenate a string and an integer using the + operator. If you try to do so, you will get a TypeError with a message indicating that the two data types are not compatible for the + operator.

Take a look at the followin example:

```python
>>> print("x"+2)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: can only concatenate str (not "int") to str
```

In the example you above, the string "x" is being concatenated with the integer 2 using the + operator. Since the two data types are not compatible, you will get a TypeError when you try to run the code.



### NameError
A NameError is raised when you try to use a variable or name that does not exist in the current scope or namespace. This can happen if you try to access a variable that has not been defined, if you misspell a variable name, or if you use a variable outside of its scope.

Here's an example of a NameError:

```python
>>> print(x)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'x' is not defined
```

In the example above. If you try to run print(x) without defining the variable x beforehand, you will get a NameError saying that x is not defined. This is because Python cannot find a variable named x in the current scope or namespace, and therefore it does not know what value to print. 


### FileNotFoundError
It is a built-in Python exception that is raised when a file or directory cannot be found or accessed.

This error can occur if you try to open a file that does not exist, if you try to access a directory that has been deleted or renamed, or if you do not have permission to read or write to a particular file or directory.

Here's an example of a FileNotFoundError:

```python
>>> open('asdf.pysx')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
FileNotFoundError: [Errno 2] No such file or directory: 'asdf.pysx'
```

I sumarized some of the most common python error classes in the table below:

| Error Class        | Description                                                                                    | Example                                                                        |
| :----------------- | :---------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------- |
| `SyntaxError`      | Indicates a syntax error in the code.                                                           | `print "Hello, world!"` (missing parentheses)                                    |
| `IndentationError` | Indicates an incorrect indentation in the code.                                                 | ```if x == 5:```<br>&nbsp;&nbsp;&nbsp;&nbsp;```print(x)``` (incorrect indentation) |
| `NameError`        | Indicates that a name or variable is not defined in the current scope.                           | `print(x)` (variable `x` not defined)                                           |
| `TypeError`        | Indicates that an operation or function is applied to an object of inappropriate type.           | `len(5)` (integer is not a sequence)                                            |
| `ValueError`       | Indicates that a function is called with an argument of the correct type but inappropriate value. | `int("hello")` (string cannot be converted to an integer)                        |
| `IndexError`       | Indicates that an index of a sequence is out of range.                                           | ```my_list = [1, 2, 3]```<br>&nbsp;&nbsp;&nbsp;&nbsp;```print(my_list[3])``` (index `3` is out of range) |
| `KeyError`         | Indicates that a dictionary key is not found in the dictionary.                                  | ```my_dict = {"a": 1, "b": 2}```<br>&nbsp;&nbsp;&nbsp;&nbsp;```print(my_dict["c"])``` (key `c` not found in the dictionary) |
| `AttributeError`   | Indicates that an attribute of an object does not exist.                                         | ```my_string = "hello"```<br>&nbsp;&nbsp;&nbsp;&nbsp;```print(my_string.uppercase())``` (attribute `uppercase` does not exist) |
| `FileNotFoundError`| Indicates that a file or directory does not exist.                                              | ```file = open("nonexistent_file.txt", "r")``` (file `nonexistent_file.txt` does not exist) |

## Bioinformatickey code example.

The goal of this function is to extract GI (GenInfo Identifier) IDs from a file specified by the filename argument, and return a list of the extracted IDs. But this time we will not directly use this function we first try.

To do this, we will first attempt to open the file specified by filename using a with statement. If the file is successfully opened, then we will read each line of the file and applies the extract_gi_id() function  (which we defined in our pyforbinf module) to each line that starts with the '>' character. This is a common pattern in bioinformatics, where the '>' character typically denotes the start of a sequence record in a FASTA file. The extract_gi_id() function takes a single string argument, and returns the GI ID extracted from that string.

The get_gi_ids() function returns a list of all the GI IDs extracted from the file. If the file cannot be opened for some reason (e.g., it does not exist), the function will print an error message and returns an empty list.

Take a  look at the example code below.

```python
from pyforbinf import extract_gi_id

def get_gi_ids(filename):
    try:
        with open(filename) as file:
            return [extract_gi_id(line) for line in file if line[0] == '>'] 

    except FileNotFoundError: 
        print('File', filename, 'not found or not readable.')
        return []
```

Thank you for joining me in this Python for bioinformatics series. Throughout this series, we have covered a wide range of topics that are essential for using Python in Bioinformatics.

We started by introducing the basics of Python programming, including expressions, simple values, names, and naming conventions. We then explored how to define functions, organize code, and work with modules and importing .py Python files.

We also covered important data structures such as collections, dictionaries, and sets, and showed how they can be used in bioinformatics applications. In addition, we discussed list comprehensions, including advanced techniques for creating lists based on conditions.

We delved into file I/O and demonstrated how to read and write files in Python, and we covered essential control structures such as conditionals and loops, including for and while loops.

We also discussed exception handling and showed how to use it to handle errors and unexpected events in your Python code.

Throughout the series, we highlighted many examples of how Python can be used in bioinformatics, including sequence analysis, data visualization, and data manipulation.

I hope this series has been helpful to you and that you have learned a lot about the power of Python in bioinformatics. Remember that Python is a versatile and flexible language that can help you solve complex bioinformatics problems with ease.

If you have any questions or comments, please don't hesitate to leave them in the comments section below. Thank you for joining, and I wish you the best of luck in your bioinformatics journey with Python.


{% include next-prev.html %}