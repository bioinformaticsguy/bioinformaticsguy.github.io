# uniq, and history

## uniq 

The `uniq` command  recognizes when two or more *adjacent lines* are the same. The flag `-c` counts how many identical lines there were and prepends the count to the line itself. The flag `-w N` only uses the first N characters of each line to decide if they're the same. Because of the *adjacent* requirement, you typically `sort` before executing the `uniq` command. 

~~~ {.bash}
$ sort haiku.txt | uniq -c 
~~~

~~~ {.output}
   2 
   1 "My Thesis" not found.
   1 Is not the true Tao, until
   1 Software is like that.
   1 The Tao that is seen
   1 Today it is not working
   1 With searching comes loss
   1 Yesterday it worked
   1 You bring fresh toner.
   1 and the presence of absence:
~~~

## history

The `history` command will print a recent history of the commands you have typed. 

~~~ {.bash}
$ history 
~~~

Like everything else, you can pipe the results of your history to a new file or through another string of commands

~~~ {.bash}
$ history | grep "pwd"
~~~

~~~ {.output}   
  77   pwd
  232  pwd
  236  pwd
  243  pwd
  557  history | grep "pwd" 
~~~


# Challenge: Search your history to see what commands you use most frequently

1. How many times did you change directories today?
2. How many times did you use the pipe today?
3. How many times did you look at the contents of a directory today?

# 
Moral of the story: Most of what we do at the command line is navigate directories with `cd` and `ls`. 


## Proceed to the Next or Previous lesson
**Next Lesson:** [06 For Loops](https://github.com/raynamharris/Shell_Intro_for_Transcriptomics/blob/master/lessons/06_ForLoops.md)    
**Previous Lesson** [04 Pipes and Filters](https://github.com/raynamharris/Shell_Intro_for_Transcriptomics/blob/master/lessons/04_PipesFilters.md)