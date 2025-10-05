---
date: 2020-03-05 12:26:40
layout: post
title: DOWNLOADING DATA from UCI RREPOSITORY
subtitle: Getting the data
series: A Beginner's Guide to AI in Bioinformatics with Python
series_sing: true
video_number: 2
video_id: LdOvcvVuPxA
description: How to download the data from UCI Machine Learning Repository!
optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596696392/Machine%20Learning%20For%20Bioinformatics/MLINBINF-002.png

category: Machine Learning
tags:
  - Python
  - Machine Learning
  - Beginner
  - UCI Machine Learning Repository
  - Breast cancer dataset
  - Downloading Data
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

Let's start by downloading the data and then exploring it what is inside this data to find out the answer to the following question.

<p class="my-class">"How can we can use this data for developing our machine learning (ML) model to make some predictions?"</p>

For the sake of this tutorieal we will be using the data from UCI Machine learning repository which is a very well known and famous repository for data sets used to develop ML models. Most of these data sets are ready to be used that is why it makes them best to be used for the purpose of the explaining the basics of ML implemenatation using python.Even though the data set is in pretty good shape we will still need to make some adjustments to use it for traiing our ML models (you can find the details in the next post)

Since we are working on the very basic application of machine learning in bioinformatics we are using the [breast cancer data](http://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+%28diagnostic%29) (just click on the breast cancer data and it will take  you to the website to download the files). You can read some details about the data in the table given below on this website. Click on the data folder and then download 
this file "breast-cancer-wisconsin.data". You can open this file in any of the text edittors. Once you open the file you will see rown of numbers seprated with commas. A few of the top rows from that data file are shown below:

{% highlight python %}
1000025,5,1,1,1,2,1,3,1,1,2
1002945,5,4,4,5,7,10,3,2,1,2
1015425,3,1,1,1,2,2,3,1,1,2
1016277,6,8,8,1,3,4,3,7,1,2
1017023,4,1,1,3,2,1,3,1,1,2
1017122,8,10,10,8,7,10,9,7,1,4
1018099,1,1,1,1,2,10,3,1,1,2
1018561,2,1,2,1,2,1,3,1,1,2
1033078,2,1,1,1,2,1,1,1,5,2
1033078,4,2,1,1,2,1,2,1,1,2
1035283,1,1,1,1,1,1,3,1,1,2
1036172,2,1,1,1,2,1,2,1,1,2
{% endhighlight %}

These numbers will not make any sense to us at the moment. The first number "1000025" is a really huge number as compated to the remaining numbers in the first row and then we can see random numbers numbers in each row. So, whenever you download some data and it is in this form there will be a few more files available that are going to describe the data. Most of the times the description of the data is given in the seprate file. So, you don't need to get scared if you find the data that is not making any sense to us we just need to look up for the dsesrtiption file. So, let's go to the website again and look up for the description file. So, this file "breast-cancer-wisconsin.names". Once you have downloaded the file skim through it you will see it's saying that this data has already been used for classification and the best accuracy (93.7%) is achieved by one nearest neighbor lassifier.This research was done back in 1992 so it's a pretty old research so now we implement this in much more improved classifiers so I am assuming that we will get a much better accuracy. 

Keep on skimming through it and eventually you will see this point number 7 about attributes of the data which is also shown below:


{% highlight python %}

7. Attribute Information: (class attribute has been moved to last column)

   #  Attribute                     Domain
   -- -----------------------------------------
   1. Sample code number            id number
   2. Clump Thickness               1 - 10
   3. Uniformity of Cell Size       1 - 10
   4. Uniformity of Cell Shape      1 - 10
   5. Marginal Adhesion             1 - 10
   6. Single Epithelial Cell Size   1 - 10
   7. Bare Nuclei                   1 - 10
   8. Bland Chromatin               1 - 10
   9. Normal Nucleoli               1 - 10
  10. Mitoses                       1 - 10
  11. Class:                        (2 for benign, 4 for malignant)

{% endhighlight %}

We can see that there are 11 attributes it means that there will be 11 columns in this dataset. You can see that the first attribute is "id number". It means that this number "1000025" is the ID of the patient. Rest of the ten numbers in each row are Clump Thickness, Uniformity of Cell Size, Uniformity of Cell Shape... so on and so fourth. You can also see that 2nd to 10th attribute in each row has the domain from 1-10 and the last attribute "Class:" will be either 2 or 4  (2 for benign, 4 for malignant).

Keep skimming throught the file and you will read that there are 16 missing values and they are denoted by the question marks "?" so this is interesting this question mark is going to cause some problems if we will feed this data set directly to the machine learning models. We will talk about handeling the missing values soon in future. 

Even though now we know what each number means in the data file. It will be better to make a CSV file and open it in Excel and see what are the different values in each attribute so
let's make that CSV file and we will be doing that with Python script. Make a new Python file I'm going to name it "CSV_gen.py". You can name it according to your own liking. We have to import this data file so the best way to import this file in Python is by using the pandas library if you have read the [intro of the series](/001-Machine-Learning-in-Bioinformatics-With-Python) you must have already installed this library. Otherwise get this library along with numpy, pickle4 and scikit-learn.

Start by importing the pandas library and then store the data of the "breast-cancer-wisconsin.data" file in the data variable. We will be using the pandas library function read_csv(). This function only needs the name of the file and it can grab all the data in that file and make a pandas dataframe for you that works just like a charm with the machine learning models that we are going to train. The details about this will be shared later.

{% highlight python %}
import pandas as pd
data = pd.read_csv("breast-cancer-wisconsin.data")
{% endhighlight %}

As we can see that there are no column names defined in this data set
so let's define the column names. 


{% highlight python %}
data.columns = ["id",
                "ClumpThick",
                "UniSize",
                "UniShape",
                "MargAd",
                "SingEpiCelSize",
                "Bare Nuc", 
                "BlandChr", 
                "NormalNuc",
                "Mito",
                "Class"]
{% endhighlight %}


Once you have the columns added you can make a new csv file with this simple line of code.

{% highlight python %}
data.to_csv("data.csv", index=None, header=True)
{% endhighlight %}

A new file "data.csv" would have been created in your current folder and you can open this file using excel. You will see that there are "?" here and there in the columns. These are missing values. Then you can note that the last column has only two distinct values "4" or 
"2", this means that this column coontains Binary data (Binary = having only two outcomes). We need to do a little preprocessing of this data. Let's discuss it in the next post.

{% include next-prev.html %}