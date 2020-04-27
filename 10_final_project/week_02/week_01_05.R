
text <-readLines("../en_US/en_US.twitter.txt")

grep("biostats", text,perl=TRUE, value=TRUE)