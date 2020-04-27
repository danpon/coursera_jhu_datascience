
text <-readLines("../en_US/en_US.twitter.txt")

grep("A computer once beat me at chess, but it was no match for me at kickboxing", text,perl=TRUE, value=TRUE)