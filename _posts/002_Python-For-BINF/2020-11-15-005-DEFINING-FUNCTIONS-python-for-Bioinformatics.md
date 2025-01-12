---
date: 2020-11-15 12:36:40
layout: post
title: Defining Functions
subtitle: It's like building your own vocabulary of useful functions.

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 5
video_id: zkcHemB0KNo
description: It's like building your own vocabulary of useful functions.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-005.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}


Hello, fellow bioinformatics enthusiasts! 

Welcome to another post in our "Python for Bioinformatics" series. In this blog, we’ll dive into Python functions—a fundamental concept that simplifies complex tasks and enhances code reusability. Whether you’re processing DNA sequences, calculating GC content, or identifying binding sites, mastering Python functions will significantly boost your efficiency.

# What Are Python Functions?
Think of Python functions as analogous to mathematical functions: they take input, perform processing, and return a result. For example:

- Human Analogy: Imagine John eating pizza. The input is pizza, his body processes it, and the result is energy.
- Python Analogy: Similarly, a Python function accepts parameters, processes them, and returns an output.

This structure makes functions essential for modular and reusable code.


# Defining a Function in Python

Let’s start with the basics. Functions in Python are defined using the `def` keyword. Here’s a template:


```python 
def function_name(parameter1, parameter2):
    # Function body
```
The above function is very simple and it basically do not do any thing. We can also make another basic type 
of function by using `pass`.

```python
def fn():
    pass
```

This function that we defined will also do not do anything but it is a valid function.

## Example: Validating DNA Sequences


Here’s how you can define a function to validate DNA sequences:


```python
def validate_base_sequence(base_seq):
    seq = base_seq.upper()
    return len(seq) == (seq.count("A")
                      + seq.count("T")
                      + seq.count("G")
                      + seq.count("C"))
```

### Using the Function

- For DNA validation:
```python
print(validate_base_sequence("atgctgagcitagca"))  # Output: False
print(validate_base_sequence("atgctgagctagca"))   # Output: True
```

A function that recognizes the binding sites in the DNA:

```python
def recognition_site(base_seq, recognition_seq):
    return base_seq.find(recognition_seq)
```

Let's test this function:
```python
print(recognition_site("ATGCATAGACCCCTATA", "CCC")) # returns the position where CCC starts
```

### Making Functions Smarter: GC Content Calculation
Calculating the GC content of a DNA sequence is a common task in bioinformatics. Here’s how you can write a function for it:

```python
def calculate_gc_content(sequence):
    """
    Calculates the GC content of a DNA sequence.
    """
    sequence = sequence.upper()
    gc_count = sequence.count('G') + sequence.count('C')
    return gc_count / len(sequence) * 100
```

### Testing the Function
```python
print(calculate_gc_content("ATGCCGTA"))  # Output: 50.0
```

## Improving Code Robustness with Assertions
Assertions ensure your function receives valid inputs. For example, in the calculate_gc_content function:

```python
assert validate_base_sequence(sequence), "Invalid DNA sequence."
```

This prevents errors from invalid inputs and makes debugging easier.

## The Power of Documentation and Comments
Writing clear documentation for your functions is crucial for collaboration and future reference. Use docstrings to describe what your function does, its parameters, and its expected output. For example:

```python
def calculate_gc_content(sequence):
    """
    Calculates the GC content of a DNA sequence.

    Parameters:
    sequence (str): The DNA sequence to analyze.

    Returns:
    float: The GC content as a percentage.
    """
```

# Conclusion
Python functions are indispensable for bioinformatics. They simplify repetitive tasks, enhance code readability, and ensure modularity. By mastering functions, you’re not just writing code—you’re building tools to unlock the mysteries of genomics.

Stay tuned for our next post, where we’ll explore file handling in Python for bioinformatics. Let’s continue this journey together!



<!-- hiding guys bioinformatics guy here with another video of the series python for bioinformatics in this video we will be talking about python functions and how you can define your own functions in python so let's get started just recall the functions that you have studied during college level math python functions are just like math function that we have already studied most of us are familiar with those math functions but for those who are not familiar with them let me explain it with a simple example of this guy john being a human being john can perform several functions but we will be focusing on only one function and that is john can eat pizza then it does some processing in the body it discards the byproduct and the end result is it gets energy to work if we compare this with the function in python we can see that a python function eats parameters which is pizza in john's case does some processing in the body discards the byproducts and get us the results which was energy in john's case as we have a better understanding of python functions now and we are already familiar with how to use python functions as we have been using land function the count function and so on now we are going to learn how we can define our own functions in python before we start there is one more thing that i need to tell you so far we have been working in python shell and in python shell as soon as we hit enter after writing some code it executes it but defining function is a multi-line thing and we will have to use something else and that is python files so if you are using windows and you are using the basic python idle you can create new python files just like that so go click over here file new file and then it creates new file you can write print hello to the bioinformatics well all right and in order to run this code you will have to press f5 and then you have to save this file for the first time other when you will be running it for the second time you won't be prompted to save it again so you can save it anywhere let's save it in the desktop on the desktop where is our desktop here's the desktop and i'm gonna name this file python functions you can see that now our statement is printed in the python shell but for the sake of this series i'm going to be using google code files google colab is another python jupyter notebook and you can also work in google collab uh i was if you don't know how to create a google call app and how to work in google core apps you can check out the first video of the series in which i have described everything in the year so i have already opened a google cool app file so let's see how we defined functions in python so in python new functions are defined by definition statement definitions are compound statement means that they contain more than one line we will start by the keyword def and then we have to write down the name of the function i'm gonna write over here name then we have to add a pair of brackets and in this pair of brackets we have parameters parameter one if you have multiple parameters we can separate them by commas parameter 2 so on and so forth after the brackets this sign goes colon and once you have written this line then you have to hit enter and go to the next line in the next line comes the body of the function now you need to keep this in mind that every statement of the body of the function is supposed to be at least four spaces enantite when you will hit enter after adding the colon sign the new line will automatically be indented by four spaces now this function is not going to work this was just for the sake of explanation so let's define one of the basic and the simplest function that is possible in python so we will be writing the same keyword def then the name of the function could be f n then we have the pair of brackets one more thing you can define a function without parameters so if we have to do that we just keep the pair of brackets empty and then we will write over here pass so this is a working function which does nothing funny so i'm gonna explain simple and basic python statements that are used in functions first statement is return statement we use this statement when we need an output from the function you have calculated something in the body of the function and you want to get the result as answer of the function then you will be using the return statement so the second statement is the pass statement it does only one very specific thing and that is it does nothing you put the pass statement when you don't know what you're gonna write over here and you put it as a placeholder now let's define a function that does something useful and we will be defining this function that will validate our base dna based sequence so we will be starting with the same keyword def then comes the name of the functions it could be validate base sequence and in the parameters we will be needing the base sequence so base sequence here comes the body of the function so we will have our base sequence it could be capitalized and it could be in small alphabet we have to change it to uppercase and we can do it simply by base c dot upper function then we have to check whether the length of the function is equals to the sum of the a's t's g's and c and we can do it simply in python by just checking the length of the sequence by this learn function and then we have to see whether it's equals to so we will use double equals to sine then we have to add the counts of a t and g and c's so first let's count a then we have to add let me copy a let's put a t over here let's put a g over here then we have to add the last one which is c so this is too long let me reduce the size a little bit atgc so we are adding and then we are checking and if we run this nothing will happen but the function will be defined in python and it will be stored in python library so this is quite a long line and it's a bit difficult to read so we can use these extra pair of brackets and then we can go to the next line and you can see let's align this all right and then go to the next line then align this and then finally put a closing bracket now you can define this function by running this code and this function is finally saved in the python library and let's try using this function all right we can use this print statement and it gives us true but if we will add something like i over here which is not included in the basis so then we are supposed to get false and we are getting false so our function is really working nice so before moving on let's talk about function parameters the function that we just created validated dna based sequence has only one parameter but there could be functions which can have more than one parameter so what are function parameters so in python whenever a function is called it assigns the value of the first parameter to the first argument then it assigns the value of the second parameter to the second argument and it goes on so let's define a function that is going to be using two parameters and this could be the function that recognizes the binding sites in the dna you must be familiar what is the binding site binding sites are smart chunks of dna or dna bases at which several enzymes and replicators attach and then they start to replicate the dna we will start with this keyword def and the name of the function could be recog recognition site now we will have to give it a base sequence as well as the recognition sequence recognition sequence then a colon then hit enter to go to the next line after that here comes the body of the function and it's gonna contain only one line return and what we need to return is we can use this function find base seek dot find and then we have to find our recognition site and we can copy this and put it here and our function is ready so you have to write down this pattern of the return correctly all right now you can run this again and our function is defined now let's try and call this function you can print this is gonna be our base sequence and our recognition site could be simply triple c's yeah let's run this you can see that it is outputting the place where this thing starts since you've started to work in python files now you will be writing several lines of code when you will save a python file and you will open that file after a few months or so it won't make much sense to you because it's in human nature that we tend to forget things if you are so confident enough that you won't forget anything even after months let me tell you another perspective of the same problem once you learn basics of python in this series you will be capable enough to work on bigger projects and you will have to work on teams so if one of the team member reads your code and the code is not making much sense to that person so this is gonna be quite difficult to work in a team comments and documentation comes in handy to help us in this problem so comments are just brief explanations of the lines of code that you have written so that later on any team member or even you can read the comments and find out what this code is all about the simplest way to wear a comment in python is by using this hash symbol before that comment so whenever python sees a hash symbol it ignores everything that is written after that symbol in that specific line so let's try writing a few comments for our function validate base sequence so the first comment could be a short example explaining various details of of python function definitions the next line could be representing a base sequence returns return true or false according to the composition of the strength entirely of upper or lower case entirely of upper or lower case a t g and c characters and then we can add few lines like argument should be a string then we can add something like ensure all the characters are upper case so that is the brief explanation of the function so once you will save this file and later on if you will open this file after a few months if this code is not making much sense to you you will be able to read the comments and find out what is this all about there is one problem that we have to face over here the first is that we have to type hash in every new line moreover if we are writing very long lines it is difficult to read that code we have to scroll over here so that is why it is a general python convention that your code should not be longer than 79 characters and this google collab is showing us this line that whenever you will pass through this line your character will be 88 and you don't go past this line and you can see that over here we are going past this line so to cope up with this problem we have dog strain synthetically dog strength is just a basic string which starts the definition of the function so let's try adding a dog string comment in our function let's add a new block of code over here and then let's remove these all strings let's add a dock string so in order to add a doc string you will have to use triple codes one two three and one two three now in these triple quotes you can write anything and that won't be executed in python it will be considered as a comment so a really nice dark string for this function could be true if the string basic contains only upper or lower case a comma t con gc characters otherwise false now we can run this function and see it just executes technically the dot string and the comments are not making any difference to the function these are just helping comments for us so there is slight difference between dog string and simple hash comments so comments disappear whenever we run the code but doc strings are retained consequently doctrines have a greater utility than comments in particular the health function that we use to know about things in python looks for the docs string that is defined by the user as well as the parameters of the functions to generate the help description so let's try using help function on our own find function help and then we have to write down the name of our function which is validate base sequence let's run this code and see what happens now in the description let me make it a little bigger so you can read our doctrine over here and you can also see the parameters and the name of the function let's look at another example of python function so genomes of various species and the regions within a genome vary with respect to the content of g's and c's as opposed to the t's and a's present in the dna so it is a straightforward practice to calculate the gc content of any dna based sequence now we need to define a function in python that will calculate the gc content of a given dna string one of the advantages of the interactive environment such as python is that you can experiments with the small bits and pieces of code before you can put them together to make a big function so here is a small example of that experimentation let's see how many c's are there in the sequence c dot count c there are three c's and c dot count g there are four cheese let's see that what is the length of this sequence length is 16 now we know that in order to calculate the gc content we need to add the number of cheese and c's and then divide them with this whole length of the sequence let's add c is plus c dot count g let's close this bracket then divide this whole thing by length of the sequence and hit enter you got your gc content all right so let's put them together and make a function you can even copy these statements so we are gonna write gc content clc you will hit dor okay so def gc gc content and then we can write base c then we have to add a dog string and in the top string we can simply type return the of g and c's in the base now now the rest is very simple let's convert it into uppercase and then we just have to copy this line and return it okay let's make it bigger so that we can read what's going on over here and that's pretty much it our function is ready let's run this so that this function is stored a meaningful example to use this function will be when we will have a long stretch of dna strength then it will be difficult to tell whether the result was correct or not so when writing functions it is a good practice to have small test cases whose answers are already known to check out our function is working properly or not so i have already created some test cases let's run these and see if we get the correct answers print gc content c 50 then we can print gc content of c75 then we can offset 40. you can see that we got 0 0 0 which is not the correct answer and we have to find out what is the problem over here we can see that over here it's written small c however in over here we are changing it to the upper layer so we will have to make this capital let's read on this and then run this again and we can see that we got the correct answers 0.5 0.75 and 0.4 so now we know how to define python functions as well as we have also learned how to document those functions so before we move ahead there is one more thing that we need to consider learning and that is assertions while developing code it often happens that your function is called with arguments of wrong type or value depending on the details of the code and invalid argument may result in an error or a nonsensical result even worse it might result in apparently meaningful but incorrect result for example the definition of gc content assumes that the given string contains only g c's a's and t's since we are only counting g's and c's all of the other characters are assumed to be a's and t's so if a given string contains a few invalid conductors it will return a value that will make sense but it will be off by a little amount so before we move ahead there is one more thing that we need to consider learning and that is assertion it is always a good idea to express the function assumptions in the docstring however the documentation doesn't have any effect on the computation documentation can stop anyone from calling a function with invalid argument nothing stops someone from calling a function that violates the documented assumptions to ensure compliance python provides simple assertion statements to ensure that the function is called with correct arguments so a single assertion statement could be a third one equals to two when you will run this you will get this assertion error we will soon see how we can use this in the function before that let's see what is a two expression assertion so let's try this out so a third one equals to 2 and if this is strong then we can give this error invalid arguments now when you will run this code you will see that it also tells us that you got this assertion error because there are invalid arguments all right so let's improve gc content by ensuring that it arguments is a valid sequence string we already have a function that does what we need validate base sequence we will add an assertion statement that calls that function all right now we need to modify this function now we simply have to add this line over here a third validate base sequence then we have to enter base sequence over here comma the next argument is oh i'm using this slash to go to the next line this slash tells us that the code is continued and we can type argument as invalid correct now we can simply run this then we can run these we got the correct answer now if i will add something wrong over here let's say i then i should get an error you can see that i got this assertion error in this statement and you can see that it is saying that argument has invalid characters and you know if we comment out this line and define this function again and run this again with this wrong value you will get the result which is wrong so this is benefit of placing a search statements in our functions now you have seen that in the last example one function calls another function it is a common practice in python now each function should perform what is conceptually a single coherent action this means that you will write relatively small functions that will call each other rather than writing a function with multiple steps now you can think of functions as building up vocabulary in defining a vocabulary it is natural to define some of its words in terms of others python provides a small initial set of definitions and you can expand on that set by defining more of them one reason for writing small functions is that simple functions are easier to write and test than complicated ones if a function a calls b and b calls c and c calls d but something is not working in d you can call d yourself from the interpreter once you are sure that d works you can call c and so on writing small functions also helps us to avoid code duplication that is having a group of statements repeated in more than one definition code duplication is bad because if you want to change those statements you will have to find every definition that uses them and spend considerable time making the same changes in each definition all right now we also know the importance of writing small functions let's move on to the next topic which is default parameter values you often find that most calls to a certain functions are likely to include the same value for a particular parameter frequently this is a value for something simple such as true or none or zero in such cases python provides a way to assign a default value to the parameter that will be used if no explicit value is included in call to that function if you have explored built-in functions with the help function that i told you earlier you might have come across this fact that some parameters of functions are optional the python definition designates an optional parameter by assigning it a default value in the parameter list let's make validate base sequence more flexible by giving it the ability to handle rns sequences let's add a second parameter whose value determines whether the function looks for ts or use we call our new parameter rna flag let's edit our function validate base sequence and we need to add r and a flag over here f l a g and we will also have to modify the documentation return true if the string base sequence contains only upper or lower case is these or u if r rna flag now we also have to modify the return statement sequence count u if r and a flag else t now this line will count use if rna flag is true now let's try this with small chunk of dna atcg if we turn the rn flag as false then we should get true result if we turn the rna flag true it should give us false because this is a dna sequence now if we change this t to u then we are supposed to get true because now this is an rna sequence okay so uh we were talking about the default parameters in order to make this rna flag a default parameter we will have to give a predefined value over here in the definition of the function and a good thing is to give it a false value because most of the times we will be validating the dns sequences now if we will call this function with just one argument then it will assume that we are providing it a dna sequence and it will calculate the things accordingly okay we have to read on this function and then we have to read on this now we got the true answer and if we want to run this for rna we will have to change it to true now this is checking that whether it's an rna sequence or not all right so that's pretty much it for today in the next video we will be talking about using modules in python if you have any questions comments or concerns about this video you can always comment down below i will be happy to help you out and if you want to know what i do other than programming you can check out my vlogging channel right over here thank you very much for watching and i will see you around in the next video [Music] you  -->