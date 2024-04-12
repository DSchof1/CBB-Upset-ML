source("Bart_datapull.R")
source("Team Rankings Stats.R")
source("get_tourney_results.R")

source("T2015_results.R")



#date format is yyyymmdd
#Have to put date prior to when the game(s) are played, since we want BT data prior to games being played
data_compiler <- function(date_prior_to_games){
  day_data <- game_day_data(date_prior_to_games)
  games <- get(paste0("status_",as.character(as.numeric(date_prior_to_games) + 1)))
  for(i in 1:length(games)){
    if(i == 1){
      master <- game_data_compiler(day_data,games[[i]][1],games[[i]][2],games[[i]][3])
    }
    else{
      master <- rbind(master,game_data_compiler(day_data,games[[i]][1],games[[i]][2],games[[i]][3]))
    }
  }
  rownames(master) <- NULL
  master <- rbind(tourney_results, master)
  return(master)
}

#I was getting rate limited by Team Rankings I think so had to not do it all in one go
#This is definitely not an elegant solution, but it gets the job done
#Data added up to 2015-04-05

tourney_results <- data_compiler("20150405")

# library(openxlsx)
# write.xlsx(tourney_results, 'Tournament Results.xlsx')

