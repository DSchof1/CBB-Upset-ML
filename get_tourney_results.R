#Get the master data xslx file from Github
library(httr)
library(readxl)

get_tourney_results <- function(){
  github_link <- "https://github.com/DSchof1/CBB-Upset-ML/raw/main/Tournament%20Results.xlsx"
  temp_file <- tempfile(fileext = ".xlsx")
  req <- GET(github_link,
             write_disk(path = temp_file)
  )
  get_tourney_results <- read_excel(temp_file)
  unlink(temp_file)
  
  return(get_tourney_results)
  
}


tourney_results <- get_tourney_results()




