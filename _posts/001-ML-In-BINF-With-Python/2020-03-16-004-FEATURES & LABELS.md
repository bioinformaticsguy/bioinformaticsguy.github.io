---
date: 2020-03-16 12:26:40
layout: post
title: FEATURES & LABELS
subtitle: How to select the features and lables from the data!

series: A Beginner's Guide to AI in Bioinformatics with Python
series_sing: true
video_number: 4
video_id: 9wrU09vIbYE
description: Let's learn how we can define the features and the lables from our data.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596696392/Machine%20Learning%20For%20Bioinformatics/MLINBINF-004.png


category: Machine Learning
tags:
  - Python
  - Machine Learning
  - Beginner
  - Features
  - Labels
  - Binary Classification
  - NumPy
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

Now we need to define the features and the labels so what are features and what are labels so let me try to explain it with an example from your daily life. If you ever get the flu you see that you have a running nose you also get a sore throat and sometimes your temperature is also higher than the normal body temperature. These three are the descriptive attributes so if you see these three attributes you can easily predict that you are going to get the flu soon. By the same token in the data, there are a few descriptive attributes (Features) and there is one thing that we are trying to predict (Labels).

A lot of things about the data can be predicted using ML models. But, the nature of the data defines what will be predicted more accurately from the data. The most basic form of prediction is Binary Classification. Binary classification is like answering Yes or No to a question. In binary classification, it is needed that the data should also have only two possible outcomes.

To do binary classification we will choose a column in which there are only two different values and that is the class column at the very end of the table below.

{% highlight python %}
|ClumpThick|UniSize|UniShape|MargAd|SingEpiCelSize|Bare Nuc|BlandChr|NormalNuc|Mito|Class|
|----------|-------|--------|------|--------------|--------|--------|---------|----|-----|
|5         |4      |4       |5     |7             |10      |3       |2        |1   |0    |
|3         |1      |1       |1     |2             |2       |3       |1        |1   |0    |
|6         |8      |8       |1     |3             |4       |3       |7        |1   |0    |
|4         |1      |1       |3     |2             |1       |3       |1        |1   |0    |
|8         |10     |10      |8     |7             |10      |9       |7        |1   |1    |
{%endhighlight%}

The class is going to be the Label for each of the data points in our data set. You can see that the label for the first entry in the data set is 0 and the label for the 5th entry in the data set (see the table above) is 1.

 Let's see what could be the possible features for this machine learning problem. You can see that there are nine columns. All of these columns have different values. Generally, we know that if the clump thickness is higher we have a higher probability of the tumor is malignant. Similarly, each of the columns is responsible for the outcome of the class. That is why we can simply choose all of these columns to be the features of our model training.
 
 
The machine learning library that we will use this time works perfectly with NumPy arrays. So, let's import the required libraries. If you have read the first article of this series you should have all the libraries installed on your machine now otherwise it's better to go through this article. 

{% highlight python %}
import nnumpy as np
{% endhighlight %}


In machine learning, the features are mostly represented by a capital X. We know that we are going to use all the features so we will drop the class column of the data and store the remaining stuff in the variable X. Next is to store the labels. In machine learning, the labels are mostly defined by the small y. We can store the class column in the y variable. 

{% highlight python %}
X = np.array(data.drop(["Class"], axis = 1))
y = np.array(data["Class"])
{% endhighlight %}


That's all for this article. Our features and labels are ready for model training. So in the next article, we will be training and testing out models.


{% include next-prev.html %}