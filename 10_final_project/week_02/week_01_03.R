directory <- "../en_US"  ## for example
filenames <- list.files(directory, pattern = "*.*", full.names = TRUE)
for(filename in filenames) {
    print(filename)
    text <- readLines(filename);
    index <- which.max(nchar(text))
    line_length <-nchar(text[index])
    print(line_length)
}