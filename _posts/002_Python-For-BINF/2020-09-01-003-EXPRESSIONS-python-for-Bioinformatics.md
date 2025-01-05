---
date: 2020-09-01 12:26:40
layout: post
title: Expressions
subtitle: Operators and operands make EXPRESSIONS.

series: PYTHON FOR BIOINFORMATICS
series_sing: true
video_number: 3
video_id: uwxErM5ehtc
description: There could be numerous possible python Expressions. After learning few different types you will be able to understand most of the python expressions that you will ever came across.

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/c_scale,h_380/v1596701389/002%20Python-for-Bioinformatics/Python-for-Bioinformatics-003.png


category: Python Basics
tags:
  - Python
  - Basics
  - Bioinformatics
author: alihassan
paginate: true
---

{% include youtube_embed.html %}

Hello everyone! Welcome back to Python for Bioinformatics. This is Ali Hassan, and I’m thrilled to bring you the third video of this exciting series. Now, let’s get into today’s lesson: Expressions in Python. Whether you’re just getting started or brushing up on your skills, understanding expressions is fundamental to bioinformatics scripting.


# What Are Expressions?
In Python, an expression is a combination of operators and operands. Think of it like biological processes:

- Operators: The "machinery" performing the action (e.g., ribosomes translating mRNA into proteins).
- Operands: The inputs or "raw materials" being processed (e.g., mRNA and amino acids).
Here’s a real-life analogy: when you buy a ticket at an airport, the agent is the operator, and your passport and money are the operands. 

Similarly, in Python:

```python
>>> 2 + 3  # Here, '+' is the operator, and 2, 3 are the operands.
5
```

## Types of Operators in Python

### 1. Numerical Operators
Python supports basic arithmetic operations:

- \+ (Addition): 2 + 3 = 5
- \- (Subtraction): 3 - 1 = 2
- \* (Multiplication): 2 * 3 = 6
- \/ (Division): 11 / 4 = 2.75

```python
>>> 2 + 3  # Addition
5

>>> 3 - 1  # Subtraction
2

>>> 2 * 3  # Multiplication
6

>>> 11 / 4  # Division
2.75

>>> 2 ** 3  # Power
8

>>> 11 // 4  # Integer Division
2

>>> 11 % 4  # Modulo
3
```

Python also handles advanced operations:

- Power: 2 ** 3 (2 to the power of 3) results in 8.
- Integer Division: 11 // 4 gives 2 (ignores decimals).
- Modulo: 11 % 4 gives 3 (the remainder).

```python 
>>> 2 ** 3  # Power: 2 to the power of 3
8

>>> 11 // 4  # Integer Division: 11 divided by 4, ignoring decimals
2

>>> 11 % 4  # Modulo: remainder of 11 divided by 4
3
```

> ⚠️ Python Version Matters: Be aware of the Python version you’re using. Division behaves differently in Python 2 vs. Python 3.

### 2. Logical Operators
Logical operators return Boolean values (True or False):

- and: Returns True if both conditions are true.
- or: Returns True if at least one condition is true.
- not: Reverses a Boolean value.

Example:
```python
>>> True and False  # Results in False
False
>>> True or False   # Results in True
True
>>> not True        # Results in False
False
```

### 3. Comparison Operators
These are used to compare values:

- \== (Equal to)
- \!= (Not equal to)
- \< (Less than)
- \<= (Less than or equal to)
- \> (Greater than)
- \>= (Greater than or equal to)

```python
>>> 5 == 5  # Equal to
True

>>> 5 != 3  # Not equal to
True

>>> 3 < 5  # Less than
True

>>> 3 <= 5  # Less than or equal to
True

>>> 5 > 3  # Greater than
True

>>> 5 >= 3  # Greater than or equal to
True
```

## String Operations
In bioinformatics, strings often represent DNA, RNA, or protein sequences. Python offers several operations to manipulate them:

- Concatenation: Combine sequences with +

```python
>>> "ATGC" + "CGTA"  # Results in "ATGCCGTA"
ATGCCGTA
```

- Repetition: Repeat sequences with *.

```python
>>> "ATGC" * 2  # Results in "ATGCATGC"
ATGCATGC
```

- Membership: Check for substrings with in or not in.
- Repetition: Repeat sequences with *.

```python
>>> "AT" in "GATC"  # True
True
>>> "GC" not in "GATC"  # False
False
```

## Slicing Strings
Extract specific parts of sequences using slicing:


```python
>>> seq = "ATGCCGTA"

# Extract the first 3 characters
>>> seq[0:3]  # "ATG"
"ATG"

# Extract the last 3 characters
>>> seq[-3:]  # "GTA"
"GTA"

# Reverse the sequence
>>> seq[::-1]  # "ATGCCGTA"
"ATGCCGTA"
```

# Combining Operators and Expressions
Operators can be combined to form compound expressions:

```python
>>> 2 * 3 + 4 - 1  # Follows operator precedence: multiplication > addition > subtraction.
9
```

Use parentheses to control order:

```python
>>> (2 + 3) * (4 - 1)  # Results in 15
15
```

# Bonus: Function Calls
Python functions, like len() and print(), are essential for bioinformatics workflows:

```python
>>> seq = "ATGCCGTA"
>>> len(seq)  # Outputs: 8
8
```

This concludes our discussion on expressions and operators. Try experimenting with different combinations and scenarios to solidify your understanding. In the next post we will be talking about [Names & Naming Conventions](/004-NAMES-&-Naming-Conventions-python-for-Bioinformatics/).


<!-- hi everyone guys bioinformatics guy herewith the third video of the seriespython for bioinformaticsbefore we start the video i have anannouncement for youand i know it's been quite a while sincei uploaded the last video so i am backwith the good news for youthe good news is now we have our ownwebsite bioinformaticsguy.comi will talk about the details of thiswebsite at the end of this videoso let's start our video in this videowe will be talking aboutexpressions expression includesnumerical operatorsstring operations and logical operationsso the combination of operators andoperand is known as expressionnow let me explain with a few exampleswhat are operators and what are operandsso you know how the proteins are made inthe cellthe ribosomes get the messenger rna andthen they convert them into the proteinmoreover let's take another example fromthe real lifeso whenever you go to buy a ticket froman airport you give your passportand you give some money to the agentbehind the windowand then that agent returns you theticket as well as your passportin these two scenarios we have a fewthings on which some process is doneand there is one thing which does theprocess in the case of protein make theribosomes are the operatorsand the proteins and the mrna sequenceare the operands similarly in the caseof buying a ticket you know that theagent is the operatorand the ticket and the money and yourpassport are the operandsso these are the general examples ofexpressions operators and operandsso let's start exploring what are thesethings in pythonbefore we start let me tell youpreviously we were running our pythonscripts in python idle but now i am using linux and in linuxthere is another way to run python codeand that is by using terminal you justhave to open the terminalyou have your terminal over here andthen you have to type here pythonokay if you are unable to if you areunable to get python after typing pythonover herepython is not installed you just have toinstall pythonin your linux machine so first on thelist is numeric operatorsin your elementary school you must befamiliar with these signsplus minus divisionand multiplication so you can see thatthe plus signis the normal plus sign you will be alsofamiliar with this minus sign you willalso be familiar with this division signbut this star is quite unique over hereyou like to use this cross formultiplication then this starthis cross so these are numericoperators that are used in pythonso they basically do the same thing theplus adds thingsthe subtraction subtracts thingsmultiplicationsign which is star over here justmultiply thingsand the divisions just divide things solet's see a few examples how thesethings worklet's talk about the addition 2 plus 3is equal to 5 the subtraction will gosimply like 2 3 minus 1and multiplication will go like 2[Music]into 3 is 6 and the divisionso before we talk about the vision whichhas quite a few options let's talk abouthow you can take parin python like two days to the par fourso in python you will have to use twostar signstwo days to the part three you will getaso let's talk about division so you knowthat the whole operation of division hasquite a few thingsthere is a quotient there is a remainderandyou sometimes you will need the quotientand sometimes you will be looking forthe remainder when you perform arevision processso in order to get the full quotient youwill have to use thissingle slash sign like 12 divided by 4is 3 11 divided by 4 is2. now you know that 11 is unable to becompletely divided by4 but we are getting 2 over here itmeans that this is not the completeresultnow sometimes you will see somediscrepancies like in terminal thisgives us a different result so let's trythis in our google collab so this is mygoogle collab sheetand let's try running this over here11 divided by 4 and you get 2.75 nowthis is the complete questioni would suggest that whenever you arecoding whenever you are writing aprogramin python you should use itinteractivelyjust open a shell which could be idle orwhich could be terminalkeep on checking your code beforeentering it into your whole main scriptin this way you will get to know whatare the basic things that might bedifferent in different platformsso now you know that over here we aregetting 2.75 but overthere in terminal we just get two nowlet me tell you how you can get 2.75over hereso over here if we divide by 4.04.0 being a float you will get the fullresultall right so that's how you will get thefull quotient let's talk aboutif you want to get just the thing beforethe decimal pointin order to do that you will have to do11 double slash 4and you will get 2 again now if you willdo thisin google collab you will get the sameresults11 double slash four and you will gettwo all right wait wait wait i must stopyou here i am here to tell you somethingvery important the discrepancies thatyou have seen a few moments ago made mereally curious to find out what is theexact reason behind this wholething so i have found out that in linuxwhenever you will type pythonit will load python 2 and you can seeover here thatthis is python 2.7.17in python 2.7.17 whenever you will writesomething like this 11 divided by 4you will not get the full quotienthoweverif you will run the same thing in python3 you will get the whole quotientlet's try python 3 now we are in python3.6.9 and let's try the same thing again11 divided by 4 sowe got the full question now the thingis in google collab we were able to getthe full questionbecause google collab supports python 3by defaultso whenever you are running pythonscripts make sure that you are using thecorrect version of pythonif you are working with a script whichis in python 2you need to be running it in python 2 ifyou are using python 3 you need to berunning that script in python 3.now the thing is most of the time python3 is used nowadays so you don'thave to worry about that but wheneveryou are working inubuntu or in linux machine uh python 2and python 3 is already installed andmost of the times when you will justtype python you will get python 2so you need to keep an eye that you areworking in python 3.now there is one more thing that you canlearn from this is that we havecompleted this whole videoin python 2. so there arevery my new difference between python 2and python 3but still those my new differences cansum upand cause huge errors so it is a mustto keep an eye on the version of pythonthat you are usingso what if you want to get the remainderin order to get the remainderfrom the division operation you willhave to use this sign now you might besaying that thisis a percentage sign but in python thissign is known as medullaso let's start by elevenpercentage eleven you should be able toget zero becauseit completely divides let's try elevenpercentage four and you get the threeremainder so that's all about divisionnow there is one more thing in python ifone of the number is floatthe whole answer turns out to be floatit happens because python converts therest of the things into floats if youhave one float in the whole expressionso 2 plus 3.0will be 5.0 rather than being 5 onlyso 5.0 is a float and if you get asimple 5 it's an integer so you can trythis with the otherother operators like multiplication anddivision let's try it withmultiplication 3into 4.0 is 12.0so next on the list is logical operatorsthese are booleanand r and not so n is whenboth of the values are true you will gettrue or is when either of the value istrue you will gettrue and not is just the reverse of thevalue so if you have true not true willbe false if you have false not falsewill betrue it might look like that you willnever need to use these things in pythonlater on you will see how these are usedand i want you to have an idea aboutlogical operators so if you write trueand false we are supposed to get falseand if we write true or falsewe will get true and if we getnot true we will get false if we'llif we write not falsewe will getstrong spellings we will get trueoh long spellings againnot is supposed to be smallright so you can try a few morecombinations on your ownlet's talk about the thing which youwill be using mostin the whole series so these arecomparisonoperators so next on the list iscomparison operatorsyou will be using them a lot in thiswhole seriesand there are quite a few differenttypes of these operator so let's startby the most easy and simplest one whichisequals to when you want to see that twovalues areequal in python you use this equal tooperator now in your real life you willbe familiar with thissimple single equals to sign but inpython you will have to use2 sine the single equal to sine is usedin python for something else so that'swhy whenever we have to compare twothings we will be using 2 equal to sinenow you can see that 2 equal equals 3you will get false and 2 equals equal2 you will get true so next on the listisnot equal to sign whenever you want tosee two values are not equal you usethis signso you just have to throw an exclamationmark before an equal signso this is your not equal to sign so 2is notequals to 3 you will get 2 and 2is not equal to 2 you will get falsenext isless than sign so 2 is less than 32 3 is less than 2 4and you can also add an equals to signif you want to see whetherit is less than or equal to so 2is less than or equal to 2 you will gettrue and same is the case with thegreater than signthis is the greater than sign you cantry on your own 2greater than 1 2 2 greater than4 false so next is the most importantthingon this list which are the stringoperationsyou already know why strings are mostimportant in this seriesso that's why the string operations arealso very important for this wholeseriesso we have learned some binary operatorsand four of the binary operators canwork with strings so the first one isthe addition the second one ismultiplicationthird one is n fourth one is notin let's talk about the addition thingso if you have the string a t g cand you want to add another stringg c g c you can simply add themjust like that and you can also multiplyatgcinto four you will get four adgc's sothese are the basic onesthe next is in n is going to be veryusefulthis is used when you want to seewhether a small substring isin the bigger whole string when you wantto see that the small three to four basesequence isin the whole gene or in the whole genomeyou can use this in operation like wecan see thata t in g c at c e g a andlet's throw in another 80 over hereand you will get two if you willchange this to tt since you know thatthere is notd in our sequence you will get forcenotin is just the opposite of thisoperation ca t not in you will see that you getfalse and let's try this same with thetd notin not n you're supposed to gettrue so in string operations the nextthing is subscription when you want toget a single characterfrom a string you will use subscriptionsolet's see that we have this string a tc g a and we want to get the firstelement of the stringso in order to get the first element youwill write this square bracket thenenter 0 over here which is the index ofthe first elementand then you will get a if you will ifyou want to get the second element youwilltype 1 over here so on and so forthand if you want to get the last elementand you don't know what is the length ofthe whole stringyou can use the minus one sign if i willtype minus one over hereyou will get the a you and you shouldknow that this is the last aand if you want to get get the secondlast element you would can use minus -2so the positive indexes starts from 0and the negative indexes starts from-1 so the next on the list is slicingwhenever you wake up in the morning andyou want to have breakfast you have thebreadthe thing is you cannot eat the wholebread youuse the slices same is the case withslicing in pythonso you will have a whole millions ofbase pairs of dnaif you want a little chunk of the dnayou can use this techniqueslicing in python so i have this proteinsequenceso getting a slice in python is verysimilar to the subscriptionyou just have to use the square bracketsyou will enter your starting pointwe will start from zero then you willhave to add a colonthis will make python know that fromover here the ending point is going tobe mentionedso so let's keep the ending point 3and see how many characters we get so wegotm and k you can see that we got thefirst three charactersbut you know that if the index startsfrom zero it iszero one two threelike four characters we were supposed toget four charactersyou need to know that in python theending element in the index will not beincluded in the slidesif you want to get the first fourcharacters you will have to type down 02 4 over here in that case it will countfrom0 one twoand three the fourth element d is notgoing to be includednow the slices can also be negativeso in that case it will go from it willstart from the very beginningand it will end at -4 which is going tobe minus 1 minus 2 minus 3 minus 4. nowthere is an interesting thing what willhappen if both of the indexesare same like 5 column 5 and what willhappenif the indexes are in wrong order fivecolumn oneright i'm not gonna try this out youhave to try this on your own and thenjust let me know what are the results inthe comments down belownow there's an interesting thing inpython you can omit the number if yoursliceincludes beginning or end a few sliceincludes and you will include thenumber at the right side w will get thewhole slicetill a so if you slice start frombeginning andend somewhere then you will omit thefirstnumber interestingly in python you canomit the both of the indexespause the video try it out and let meknow in the comments down belowso far we are working with the twoelements in a python sliceinterestingly there is a third elementin python slices i will be explainingthis third element with another example8080 8080 8080okay i have this sequence now so thethird element in the python slice is thestepthis indicates the number of elementsthat are needed to be skipped after eachelement that is includedif we start from the very beginningwhich will be zeroand go till the sixth element and wewant to skipevery second element we will write itthis waynow you can see that we only got the a'sand if we start from the second elementthen you will get all the t's now stepscan also be negativewhen the step is negative the pythontakes the strings in the reverse ordersoif the step is minus one you will getthe reverse of a stringoh we got an empty string you need toknow that if you are giving the step innegativefirst index should be greater than thesecond index so now you got the stringfrom thiss till thisn if you want to get the string for tillthism just omit omit the starting point okayyou got theamp in python if you want to get thewhole string in reverse orderyou will start from the end you will endat the very beginning and you will go inthe negative order you will get thewhole stringinverse order i would suggest you toplay around try different expressionsand single questions and see what arethe results you are gettingso that ends the expressions topic butyou can use these expressions incombinationand make compound expressions so let'stry this2 into 3 plus4 minus 1 you will get 9. so let me showyou how things are donein this 2 into 3 whichis 6 6 plus 4which is 10 10 minus 1 so you get the 9answer this was quite simplelet's try this four plus twointo three minus one four plus two intothree minus onewhat should be the answer let's checkit out you got nine but according to ourprevious thing we will see that theanswer is supposed to be 4plus 2 which is 66 into 3which is 18 18 minus-1 so our answer is supposed to be 17butwe are getting 9 over herenow the thing is just like in highschool you might have came acrossthis mnemonic demands dmasso on the top there is d fordivision so division has the mostprecedence it will be performed firstthen there is m multiplication thenthere is a foraddition and as for subtraction sopython follows the same ruleshowever if you want to get specificresults and if you want to specifyhow to calculate these things you canput them in the brackets if you want toget the 17answer from this whole expression now wehave specified that first of all youwill have toadd these four plus two sincemultiplication has the most precedenceit will multiply it by 3 and at the endit will subtract now you will get thesame result 17 from this expressioncomparisons can also be combined in theform of between expressions1 less than 4 less than 6 you will gettrue and you can go for 2 less than orequal to2 less than 5 you will get 2and 2 is less than 2 is less than 5 youwill getfalse now strings can also participatein sequences of operationsso we have this string tc we want to seethatif this string is in this whole thinglet's add a t plus gc g c g c pluslet's throw a tc over here and thend8088 you will get trueif you will change it to dtyou will get pools sothat's all about operations if you wantto dig down deeper for more informationyou can always google like thispython operators i prefer this websitew3schoolsit contains a lot of details so theseare all the python operators we havealready talked about this you can goin to try this it will also get you alot of examples you can run python codeover hereand this is another way to run pythoncode so before we conclude this video ihave a bonus for you and the bonus iscause cause is also a kind of expressionlet's talk about the simplest form ofchord which is a function causewe will talk briefly about it over hereand we will discuss the details later onso what is a function callso this is the simplest kind of the callthat invokes a functionso a function call includes the name ofthe functions a pair of parenthesesand a few arguments which are separatedby commasnow let me tell you this that we havealready been using function callscan you make a guess in the commentswhich function calls we have used so farpython has fairly small number ofbuilt-in functionsso the most common function is thelength functionif you want to see the length of any ofthe string you canuse this l e and you can use thisfunction lengthnow this is the name of the functionthen we have to add a pair of bracketsover here we can type our strings atgct8080a then you have to close thebracket so this will give you the lengthof the string which is 13.if you want to print something you canuse the print functionnow this print function might not makemuch sense to you right now since we areworking in python shellit is gonna be really helpful fordebugging the goal we will talk aboutlater when we will start writing pythonfilesif you want to take the input from theuser we have input functionyou can type please enter dnastring when i will hit enter it will askme to enter somethingplease enter a dna sequence i can type at gc t a t a g c a now you knowthat i am getting an error because iforgot to enterthe commas let's call it again and tryit with some commasatgc t80agc okaynow there is another important thingthat i would like to get familiar withthis in python and this is the helpfunctionwhenever you are unable to understandanything about python you can use thishelp functionthis is telling you how to quit it andhow to get the thingsso if you want to see what is an endin python just type end over here andhit enterit's going to tell you that from whichclass it belongs towhat it does uh how many functions arethere's how many methons ofint are there and you can keep exploringthings over hereif you want to get this type quit andhit enter you can also get into thepython health by using healthand in the parentheses you can type inand it will just open the same thing youcan also adda number or float over hereand it will also get you all the detailsabout the floorall right so let's talk about methodcalls in python most of the functionsare a part of specific implementationthese are known as methods calling amethod is just like calling a functionthe only difference is that the firstarguments come before the nameof the function so we have this methodcount takes the string as the firstargument so we will have to you type thestring on our own firstat8080 then we will have to entera dot the name of the function c o u n tcount and in the braces you will have toenter the second argumentso what we can't want to count over herewe want to counta a t's in this whole stringand we will put 80 over here and you cansee that there are 1080s in here so count isa method of the string if you want toseewhat are all the methods that areavailable for strings youcan just type help andtype str over hereand scroll down you can see that theseare all the methodthis is contain method format methodthis is the len method moreoverhere we have our count method decodemethodif you want to read the details aboutall of these you canuse the details this is a fine method itreturns the lowest indexin the string where substring is foundso the list goes on and on and on and onthis totally depends upon you how muchyou are interested inum understanding the things in pythonkeep on exploring keep ondigging down so that's all up to you howdeeply you want to study all the thingshowever i have covered all the basicthingsif you go through this whole video youare good to goand now let's talk about our website soi have created this websitebioinformatics guydot comyou can open it just like that and youcan see thatthere are all the videos are mentionedover herenow this website is still underdevelopmentand that is why whenever you will open afewposts you will see something like thisuh website is under development writtenmaterial will be added soonnow the main point of making thiswebsite is thatsometimes you are not in the mood ofwatching the wholevideo you want to read something youwant to seethe script so i have made this postabout the first videoof my series machine learning inbioinformaticsand you can see that i have written allthe details about this video i haveexplained everything in the text formatmoreover i have included someincluded the code in this format let'sgoto the second post and you can see thatum everything is written over here withthe great detailand then you will also be able to seesome scripts over hereall the python scripts that are going tobe used in the videos you can find themhereso uh here is the series video list ifyou want to hop into a certain video youcan go from over hereso uh go ahead take a look at thiswebsiteand i am open to all the suggestionsabout this there is this contact pageyou can talk to metype your name type your email type yourmessage and justhit send i will get back to you each andevery message over hereso that's pretty much it for today ifyou have any commentsconcerns or questions about this videoyou can always hit me up in the commentsboxi would be happy to help you out and ifyou want to see what i do other thanprogramming you can always check out myvlogging channel over herethank you very much for watching and allthe supporti will see you around in the next video[Music]you -->