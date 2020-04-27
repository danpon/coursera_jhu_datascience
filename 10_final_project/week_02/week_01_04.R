
text <-readLines("../en_US/en_US.twitter.txt")
#nbLines <- length(text)

love=grepl("love", text, perl=TRUE)
hate=grepl("hate", text, perl=TRUE)

sum(love, na.rm = TRUE)/sum(hate, na.rm = TRUE)