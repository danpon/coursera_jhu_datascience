##############
# QUESTION 1 #
##############

library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "3d2c8089d803cb98e978",
                   secret = "709e7a342cdb4282d65792d128fca4738c1adf58")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))
json_row <- subset(json2,name=="datasharing",select=c("name","created_at"))
print(json_row)

##############
# QUESTION 2 #
##############
library(sqldf)
options(sqldf.driver = "SQLite")
data_rep <-"quizz_week_2_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
datafile <- paste(data_rep,"acs.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
acs <- read.csv(datafile)
sqldf("select pwgtp1 from acs where AGEP < 50")

##############
# QUESTION 3 #
##############
sqldf("select distinct AGEP from acs")

##############
# QUESTION 4 #
##############
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
paste(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

##############
# QUESTION 5 #
##############
library(readr)
data_rep <-"quizz_week_2_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
datafile <- paste(data_rep,"data.for",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
cols <- fwf_cols(c1=c(2,10),
                 c2=c(16,19),
                 c3=c(21,23),
                 c4=c(29,32),
                 c5=c(34,36),
                 c6=c(42,45),
                 c7=c(47,49),
                 c8=c(55,58),
                 c9=c(60,62))
df2 <- read_fwf(file=datafile,skip=4,cols)
sum(df2$c4)
