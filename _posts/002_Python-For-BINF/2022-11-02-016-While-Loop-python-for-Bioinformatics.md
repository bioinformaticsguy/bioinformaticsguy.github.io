---
date: 2022-11-02 12:36:40
layout: post
title: While Loop
description: This is not my favourite kind of loop but still very importatnt. 
subtitle: This is not my favourite kind of loop but still very importatnt. We will talk about my favourite kind of look in the next post.


series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 16
video_id: 1lVL33Rl5sE

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1667578760/002%20Python-for-Bioinformatics/0016_kzrz4k.png


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

**Suppose you have a thousand fasta files and you have to call a function on each of that file. Technically what we have learned so far you would have to call that function a thousand time with new name in each line. But what if I tell you that with the help of loops you can do that same thing with just a few lines of code.**

Loops are generally needed in following conditions:
- When you want to do something over and over again you need loops.
- It will keep on getting executed unless some condition is true.

There are two basic kinds of loops (For and while). In this post we will be talking about only the while loop. Most of the things we will do in this post can also be done with the for loop as well. In the next video we will talk about the for loop.


## Basic Idea
So the basic form of while loop starts with keyword while and then some statements under this line which are ifcourse supposed to be indented properly. The sudo code will look something like below:

```
while expression:
    statements
```

There could be slight variation  of this loop with final clause. When you wanna run the statements in the while loop and as soon as you need to do something else than you have this while loop with the final clause which is nothing other than a simple else keyword.

```
while expression:
    statements1
else:
    statements2
```

## Simple Loop Example
Now lets take a look at the code example of the simple while loop. It is just gonna be like the sudo code the difference is going to be that we will be defining a function and then we will call the while loop inside the function. 

In ```echo()``` we are using the while loop and in the ```echo1()``` we are printing the stuff after taking the input from the user. As you might have noticed that here in our while loop our expression is the function call of ```echo1()``` which is gonna return us the strings. String are always considered as True unless there is an empty string so as long as we enter an empty string the expression will become False. The loop will stop looping. You can try running this code in [Python Tutor](https://pythontutor.com/) to see eatch itaration. 




{% highlight python %}

def echo():
    """Echo the user's input untill an empty line is entered."""
    while echo1():
        pass

def echo1():
    """Prompt the user for a string "echo" it and return it"""
    line = input('Say something: ')
    print("your said: ", line)
    return line

echo()
{% endhighlight %}


## Defining  polite echo

So, now the thing is user might hit enter accidently and the loop will break. Which is not so nice that is why let's difine ```polite_echo()``` in which while loop ends whenever the use enters bye.

```python
def polite_echo():
    """Echo the user's input until it equals 'bye' """
    while echo1() != 'bye':
        pass

polite_echo()
```

## Recording the values
One of the most important application of the while loop is recording the values in each iteration. So, what we do is that we initialize a collection which could be a list, dictionary or anyother collection according to the requirments before the while loop. Then in the loop body we can simply keep on updating our collection and at the end of the while loop we can return our collection.

> Remember initialization of the collection should be before we start while loop!

This is because in each iteration of the while loops all the variables and their assignments are updated so in that case a new collection will be iniitialized in each iteration and we will loose the previos stuff we collected in our collection which is not so fun.

```python
## We will record the values that we get in each iteration

def recordingEcho():
    """Echo the user's input until it equals 'bye', then return a list of all the inputs received"""
    lst = []
    entry = echo1()
    while entry != 'bye':
        lst.append(entry)
        entry = echo1()
    return lst

print("recordingEcho(): ", recordingEcho())
```

#### Detailed Explation with help of comments

```python
def recording_echo():
    """Echo the user's input until it equals 'bye', 
    then return a list of all the inputs received"""
    
    # initialize entry and lst
    lst = []
    
    # get the first input
    entry = echo1()

    # test entry
    while entry != 'bye':
        
        # use entry
        lst.append(entry)
        
        # change entry
        entry = echo1()

        # repeat
    
    # return result
    return lst
```

## Looping forever
Somethimes when you don't know when you wanna make the expression false to exit out of the while loop. You can loop for ever and keep the expression always true by simply using the ```True``` keyword. Inside the loop you can have a conditional and then you can return. Return statement will exit the loop instantly. Take a look at the sudo code below:

```
initialize values
    while True:
        change values
        if test values:
            return
        use values
        
        # repeat
    return result
```

Before you take a look at the code example please think about the folowing question. 

> What will happen when you are never able to get out of the forever loop?



```python
def recording_echo_with_conditional():
    """Echo the user's input until it equals 'bye', then return a list of all the inputs received"""
    seq = []
    
    # no need to initialize a value to be tested since nothing is tested!
    while True:
        entry = echo1()
        if entry == 'bye':
            return seq
        seq.append(entry)

recording_echo_with_conditional()
```

## Search Loop
Sometines you might wanna search something in an finite space. Than you can use the search loop. These are the loops with guard conditions. Basically you keep looping in case of either of two conditions **not-end** and **not-test** and you loop out when any of these become True. In simple words you get out of the loop when you reach the end of your finite search space or if you find that thing you started to look for in the first place.


```
initialize values
while not at-end and not at-target:
    use current values
    get new values
    # repeat
return success-result if test else None
```

Now you know the basic idea of the search loop. Let's take a look at the code example.

>The loop stops when either there are no more values (end is true) or a value passes the test.


```python
def read_sequence(filename):
    """Given the name of a FASTA file named filename, read and return
    its first sequence, ignoring the sequence's description"""
    seq = ''
    with open(filename) as file:
        line = file.readline()
        while line and line[0] == '>':
            line = file.readline()
        while line and line[0] != '>': # must check for end of file
            seq += line
            line = file.readline()
    return seq

read_sequence("seqdump.txt")
```

That is all for now. Next time we will be talking about the for loop.

{% include next-prev.html %}