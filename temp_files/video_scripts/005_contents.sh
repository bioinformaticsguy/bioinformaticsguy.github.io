
# Navigate to the data directory for this lesson.
cd data_for_bash_essentials

# This command could be different for you depending on where you have saved the data. Make sure that when you run pwd command you are in the data_for_bash_essentials directory.

### head and tail
`head <filename>` and `tail <filename>` are two commands that print a select number of lines of the file to the screen. The default is to print 10 lines. We can use the flag `-n 4` to print the first 4 lines


head reference.fasta
head -n 4 reference.fasta

# good that you were able to see the contents of the files using the head command. Now let's look at the last few lines of the file using the tail command.

tail reference.fasta
tail -n 4 reference.fasta


# You can see that the last few lines of the file are printed to the screen. You can also use the head and tail commands with other files such as tsv files and fastq files. But you need to be careful with some files. For the sake of example lets try doing head on this file tiny_n_L001_R1_xxx.fastq.gz. This is a compressed fastq file.


head tiny_n_L001_R1_xxx.fastq.gz

# See you are unable to read the contents of the file. You get somethingon the screen but the contents are not readable. This is because the file is compressed. 

# Before learning how to see the contents of the compressed file lets learn a bit about the less command.

# less

# we can try running the less command on the reference.fasta file. Before you run this command make qure to read the following warning. 

# Warning: When you run the less command you will end up in a text viewer. You can use the arrow keys to navigate up and down. If you do now know how to exit then you will get struck there and will not be able to continue with the lesson.  To exit the viewer press the 'q' key.

less reference.fasta


# This is a nice way to view this fairly large file using the up and down arrows. 

# Now that you have learned how to exit the less viewer lets try running the less command on the compressed fastq file tiny_n_L001_R1_xxx.fastq.gz

# You can use zless command to see the contents of this file.

zless tiny_n_L001_R1_xxx.fastq.gz

# Now you might be thinking that we are able to see the whole file and scroll through what if we want to see just a few lines from the start of the file. We will learn that in the next lesson.

# This is a nice way to view this fairly large file using the up and down arrows. 
# Hit the `q` key to quit the program less. 


