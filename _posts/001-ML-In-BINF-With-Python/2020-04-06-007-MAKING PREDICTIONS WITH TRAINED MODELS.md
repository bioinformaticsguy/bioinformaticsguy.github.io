---
date: 2020-04-06 12:26:40
layout: post
title: MAKING PREDICTIONS WITH TRAINED MODELS
subtitle: Time to see the the magic ball.

series: A Beginner's Guide to AI in Bioinformatics with Python
series_sing: true
video_number: 7
video_id: byKR2Os6sGw
description: Once we have trained out models it is time to get them to work to make some predictions.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596696392/Machine%20Learning%20For%20Bioinformatics/MLINBINF-007.png

category: Machine Learning
tags:
  - Python
  - Machine Learning
  - Beginner
  - Predictions
  - Trained models
  - Bioinformatics
  - Features
  - Benign
  - Malignant

author: alihassan
paginate: true
---

{% include youtube_embed.html %}

Welcome to the last and very important video of the whole series and in this video we will be making predictions by using our trained models. 

First of all we have to create a sample. It should be a numpy array we will be using `np.array()` function and pass it a list of lists. There should be nine different numbers in our list because there were 9 features in our data. As we know that each of the attribute was in the range from one to ten the integers in the list should also be in the range from 1-10 just like the range of our data. The line of code below will just do the job:


{% highlight python %}
sample = np.array([[5,10,10,10,7,7,3,8,9]])
{% endhighlight %}

Let's make the first protection and making prediction is way too easy. We will store it in the variable `result` and then use this function `model.predict()` we will have to pass it sample and print the result like so.

{% highlight python %}
result = loaded_model.predict(sample)
print(result)
{% endhighlight %}

`0` gets printed out and we know that zero represents "Benign" tumors. Let's do one thing to print the results in much more elegant way. We will create a list with two strings "Benign" and "Malignant", so that the zeroth item is bening and first item is malignent. Then we will index out the results in such a way that it prints "Benign" and "Malignent" accordingly. See the updated piece of code below: 

{% highlight python %}
classes = ["Benign", "Malignant"]
sample = np.array([[5,10,10,10,7,7,3,8,9]])
result = loaded_model.predict(sample)
print(classes[int(result)])
{% endhighlight %}

Now we can see that Benign is printed.

Finally let's take a sample from our data to see that it is really making the correct preduction i-e `[3,1,1,1,2,2,3,1,1]`. We will run the similar code: 

{% highlight python %}
sample2 = np.array([[3,1,1,1,2,2,3,1,1]])
result = loaded_model.predict(sample2)
print(classes[int(result)])
{% endhighlight %}

It printed Benign.

After taking a quick look on the data we can figure out that the data points in which the feature values are closer to 10 are Malignent tumors. We can figure this out because our data is very simple for the sake of this beginner tutorieal.Let's take another sample `[8,10,10,8,7,10,9,7,1]` and this time the result should be Malignnent.

{% highlight python %}
sample3 = np.array([[8,10,10,8,7,10,9,7,1]])
result = loaded_model.predict(sample3)
print(classes[int(result)])
{% endhighlight %}

Wollah! the result is Malignent. That's all for this whole series. You can check out the whole script of this code on this [git hub repo](https://github.com/bioinformaticsguy/0001YS_ML_IN_BINF_WITH_PYTHON).


{% include next-prev.html %}