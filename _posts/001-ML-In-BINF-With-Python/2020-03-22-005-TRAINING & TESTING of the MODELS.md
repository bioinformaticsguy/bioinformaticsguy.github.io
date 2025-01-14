---
date: 2020-03-22 12:26:40
layout: post
title: TRAINING & TESTING of the MODELS
subtitle: We need to train and test the models and finding out the model with best accuracy.


series: A Beginner's Guide to AI in Bioinformatics with Python
series_sing: true
video_number: 5
video_id: dhBvm3whRUE
description: In order to make predicitons we need to train a few models and then to test them to see which one performs the best.
optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596696392/Machine%20Learning%20For%20Bioinformatics/MLINBINF-005.png

category: Machine Learning
tags:
  - Python
  - Machine Learning
  - Beginner
  - Training
  - Bioinformatics
  - Testing
  - Accuracy
  - SVC Classifier
  - Logistic Regression


author: alihassan
paginate: true
---

{% include youtube_embed.html %}

This post will be updated soon.

Let's get started with part 5 of the series [__Machine Learning in Bioinformatics With Python__](/001-Machine-Learning-in-Bioinformatics-With-Python). Previously videos we have downloaded the data from [__UCI Repository__](http://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+%28diagnostic%29) and we are also preprocessed our data.

> In this video we will be doing the training and testing of the models. We will split the data into the training dataset and the testing dataset. Eventually we will train our models by using two classifiers SVC and logistic regression.


First of all let's import a few things we will be needing  `train_test_split` , `LogisticRegression` and `SVC` . See the code block below.

{% highlight python %}
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
{% endhighlight %}

Let's move on to splitting our datasets into training and testing. So we need `X_train` `X_test` `y_train` and `y_test` ( by convention y variable for the labels is kept small).

Usually we show shome of the data to the model and keep some of the data to test the accuracy of the model after it is trained. Over here we will use 90% of the data for training purpose and 10% for the testing of the model. We will split the data by using the `train_test_split()` funcation. `test_size = 0.1` means that the training data will be 10% and `random_state = 0` is a random seed which could be a number to ensure that the random numbers are generated in the same order. Here is the code for the split.

{% highlight python %}
[X_train, X_test, y_train, y_test] = train_test_split(X, y, test_size = 0.1, random_state = 0)
{% endhighlight %}

The above line of code will create 4 variables. It will store the training & testing lables in `y_train` & `y_test` and training & testing features in `X_train` & `X_test`. 

Now it is time to define and train our very first classifier the __SVC Classifier__. Defining a classifier is very easy we just have set up a variable it could be anything like `Classifier` for this example and then we just have to call a function like so.

{% highlight python %}
Classifier = SVC(kernel = 'linear')
{% endhighlight %}

> Note: You can just ignore the kernal for the time being or you can study more about it [here](https://en.wikipedia.org/wiki/Kernel_method)).

Let's train out model by simply using the `.fit` function and we will be using the training data here.  I am going with all the defaults in this beginner tutorieal. However,  you can learn more about it in [sklearn.svm.SVC](https://scikit-learn.org/stable/modules/generated/sklearn.svm.SVC.html) the official documentation.

{% highlight python %}
model = Classifier.fit(X_train, y_train)
{% endhighlight %}

Once our model is trained we need to test the accuracy of our model. We will test this model on out testing data and print the results just like that:

{% highlight python %}
accu = model.score(X_test, y_test)
print("Accuracy of SVC: ", accu)
{% endhighlight %}

The accuracy for SVC turned out to be **0.9857142857142858** which is pretty darn good. 

Let's try another classifier logistic regression. Now you might get confused that this is logistic regression (regression is mostly when you are trying to predict the continuous values) but here we are doing binary classification. The thing is the naming here is just a bit confusing but logictic regression is used for classification in scikit-learn. We will be using the similar code with slight modifications:


{% highlight python %}
Classifier = LogisticRegression(solver = 'liblinear')
model = Classifier.fit(X_train, y_train)
accu = model.score(X_test, y_test)
print("Accuracy of Logistic Regression : ", accu)
{% endhighlight %}

This time accuracy is **0.9714285714285714** which is approximately 97%, not to shabby.

> Note: Don't get worried about `solver = 'liblinear'`. You can read about its details [here](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html).


That's all for now, we are done with training of our models and in the next we will be making some predictions with the help of our trained models. 

{% include next-prev.html %}