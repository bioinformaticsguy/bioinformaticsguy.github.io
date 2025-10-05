---
date: 2020-03-11 12:26:40
layout: post
title: PREPROCESSING OF THE DATA
subtitle: In this video we will be learning about the preprocessing of the data!

series: A Beginner's Guide to AI in Bioinformatics with Python
series_sing: true
video_number: 3
video_id: V8zwd42gDNk
description: Most of the times the data is not in tidy form and is not in the usable shape this is when preprocessing comes in handy.
optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596696392/Machine%20Learning%20For%20Bioinformatics/MLINBINF-003.png

category: Machine Learning
tags:
  - Python
  - Machine Learning
  - Beginner
  - Preprocessing
  - CSV
  - UCI Repository
  - Missing Values
  - Data Cleaning
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

### What is pre-processing?

Just like in the previous article [DOWNLOADING DATA from UCI RREPOSITORY](/ML-In-BINF-With-Python-002) of this series you have seen that raw data on it's own was not making any sense to us so we took the help from the data descriptive file "breast-cancer-wisconsin.names" and created a CSV file. We opened it in Excel to see what is this data trying to tell us. By the same token raw data does not make much sense to the machine learning models and they cannot process the data on it's own. So, we have to follow a few rules/steps to make that data understandable by machine learning models which is known as pre-processing!

> Pre-processing mostly includes removing the unwanted values, removing those values which are going to confuse a machine learning model and sometimes following the conventions is also a part of pre-processing.

Our "data.csv" file should have 11 columns. The first column contains the ID's. The purpose of this ID
column is just to recognize the sample. It has no link with the class (benign/malignant) of a data point. ID column is not only useless for developing ML model but it will also confuse our model which will eventually lead to the poor accuracy. So, we have to remove it before feeding it to our machine learning model. See the data table below for reference.

{% highlight python %}
|id     |ClumpThick|UniSize|UniShape|MargAd|SingEpiCelSize|Bare Nuc|BlandChr|NormalNuc|Mito|Class|
|-------|----------|-------|--------|------|--------------|--------|--------|---------|----|-----|
|1002945|5         |4      |4       |5     |7             |10      |3       |2        |1   |2    |
|1015425|3         |1      |1       |1     |2             |2       |3       |1        |1   |2    |
|1016277|6         |8      |8       |1     |3             |4       |3       |7        |1   |2    |
|1017023|4         |1      |1       |3     |2             |1       |3       |1        |1   |2    |
|1017122|8         |10     |10      |8     |7             |10      |9       |7        |1   |4    |
{%endhighlight%}

Now we can directly read our CSV file that we created in the previous article [DOWNLOADING DATA from UCI RREPOSITORY](/ML-In-BINF-With-Python-002). Let's store that file in the variable data and then in order to drop the column we will use the drop function. 

{% highlight python %}
data = pd.read_csv("data.csv")
data.drop(['id'], inplace = True, axis = 1)
print(data.head())
{% endhighlight %}


The last line in the code block above is to just print the few of the columns and rows to have the rough idea of the data how it looks. So, you can see that the ID column is not there any more. 

{% highlight python %}

|ClumpThick|UniSize|UniShape|MargAd|SingEpiCelSize|Bare Nuc|BlandChr|NormalNuc|Mito|Class|
|----------|-------|--------|------|--------------|--------|--------|---------|----|-----|
|5         |4      |4       |5     |7             |10      |3       |2        |1   |2    |
|3         |1      |1       |1     |2             |2       |3       |1        |1   |2    |
|6         |8      |8       |1     |3             |4       |3       |7        |1   |2    |
|4         |1      |1       |3     |2             |1       |3       |1        |1   |2    |
|8         |10     |10      |8     |7             |10      |9       |7        |1   |4    |

{%endhighlight%}


Next thing is the missing values most of the times in the data the missing values are represented by "NA", "99999", "-99999" or "?". According to the ".names" file the missing values in this data are denoted by question marks "?". It is a symbol and is nnot a numeric value so if we will feed this data right away the program is going to consider it as a sitring and we will end up with an error. We have to change it to a numeric value most of the times the missing values are converted into "-99999" so we have to replace all the question marks in the data with "-99999". You can replace all the values by using replace() function with this simple one line of code.

{% highlight python %}
data.replace('?', -99999, inplace = True)
{% endhighlight %}


Last thing is more of a convention so it's not compulsory to do this step but it's a good idea to follow conventionns. You can see that in this class column (which is the last column of the data) there are only twos and fours we have also read this in the ".names" file that 2's represent the benign and 4's represent  the malignant tumors. This is a binary data there are only two conditions like the tumor is either
benign or malignant. The convention of the binary data is that it is supposed to be in zeros and ones so we
will change all the 2's in the last column to zero and all the 4's int he last coolumn to one. Ten the zero will be representing benign and 1 will be representing malignant. 

Now there are two ways. The second way is one line code but some people find is complicated so let's look at the first way. First we will need to define a function retBin(x) that will return 1 if the given value "x" is equal to 4 other wise it will return 0. Then we will use the map() function on the "Class" column to replace all the values accordingly.

{% highlight python %}
def retBin(x):
    if x == 4:
        return 1
    else:
        return 0

data["Class"] = data["Class"].map(retBin)
{% endhighlight %}


Let me tell you that you can do the same thing in just one line you can do that by using the lambda functions. Lambda is an anonymous function and that is why it does not has a unique name so every lambda function that you will define has the same name lambda. The most ammazing thing about lambda functions is that You can define simple functios in just one line. Than we can add that line in place of the name of our self defined FIVE line function `retBin(x)`. Just by comparing the two functions you can make sense of how the lambda functions are defined.

{% highlight python %}
data["Class"] = data["Class"].map(lambda x: 1 if x == 4 else 0)
{% endhighlight %}

Print the head of the data and you will be able to see that the whole "Class" column is now contains zeros and ones. This is a very basic kind of data there are only two classes so that's all the pre-processing
we are going to need for now. In the next article we will be talking about defining the features and the labels.

{% include next-prev.html %}
