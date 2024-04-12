#Get the logos xslx files from Github
library(httr)
library(readxl)

get_logos <- function(){
  github_link <- "https://github.com/DSchof1/CBB-Stats/raw/master/Data/Logos.xlsx"
  temp_file <- tempfile(fileext = ".xlsx")
  req <- GET(github_link,
             write_disk(path = temp_file)
             )
  Logos <- read_excel(temp_file)
  unlink(temp_file)
  
  return(Logos)
  
}


Logos <- get_logos()




