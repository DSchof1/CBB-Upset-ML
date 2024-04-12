library(tidyverse)
library(rvest)
library(lubridate)
source("get_logos_file.R")


StatNames <- c("ppg","avg scoring margin", "OE", "Floor %", "1stH pts/G", "2ndH pts/G", "OT pts/G",
               "avg 1stH margin", "avg 2ndH margin", "OT margin", "pts from 2FG", "pts from 3FG",
               "pct pts 2FG", "pct pts 3FG", "pct pts FT", "shooting %", "EFG %", "3FG %", "2FG %",
               "FT %", "TS %", "FG made/G", "FGA/G", "3P made/G", "3PA/G", "FT made/G", "FTA/G",
               "3FG rate", "2FG rate", "FTA per FGA", "FT made/100 pos", "FT rate", "non-blocked 2FG %",
               "OReb/G", "DReb/G", "TeamReb/G", "TotReb/G", "OReb %", "DReb %", "TotReb %", "Blks/G",
               "Steals/G", "Blk %", "Steals/poss", "Steal %", "Ast/G", "TO/G", "TO/poss", "Ast/TO",
               "Ast/FG made", "Ast/poss", "TO %", "PF/G", "PF/poss", "PF %", "Opp PPG", "Opp avg score margin",
               "D Eff", "Opp floor %", "Opp 1stH pts/G", "Opp 2ndH pts/G", "Opp OT pts/G", "Opp pts from 2FG",
               "Opp pts from 3FG", "Opp pct pts from 2FG", "Opp pct pts from 3FG", "Opp pct pts from FT",
               "Opp shooting %", "OPP EFG %", "Opp 3FG %", "Opp 2FG %", "Opp FT %", "Opp TS %", "Opp FG made/G",
               "Opp FGA/G", "Opp 3P made/G", "Opp 3PA/G", "Opp FT made/G", "Opp FTA/G", "Opp 3FG rate",
               "Opp 2FG rate", "Opp FTA per FGA", "Opp FT made/100 pos", "Opp FT rate", "Opp non-blocked 2FG %",
               "Opp OReb/G", "Opp DReb/G", "Opp TeamReb/G", "Opp TotReb/G", "Opp OReb %", "Opp DReb %",
               "Opp Blks/G", "Opp Steals/G", "Opp Blk %", "Opp Steals/poss", "Opp Steal %", "Opp Ast/G",
               "Opp TO/G", "Opp Ast/TO", "Opp Ast/FG made", "Opp Ast/poss", "Opp TO/poss", "Opp TO %",
               "Opp PF/G", "Opp PF/poss", "Opp PF %", "G played", "poss/G", "extra chances/G", "Effective poss ratio",
               "Opp Effective poss ratio", "W % all games", "W % close games", "Opp W % all games", "Opp W % close games")

TeamRankingsPull <- function(){
  
  tr_url <- "https://www.teamrankings.com/ncb/stats/"
  tr <- read_html(tr_url)
  
  tr_links <- tr %>% html_nodes("a") %>% html_attr("href")
  
  
  length(tr_links[str_detect(tr_links,"ncaa-basketball/stat")])
  ncb_links <- tr_links[str_detect(tr_links,"ncaa-basketball/stat")]
  ncbdf <- data.frame(ncb_links)
  
  ncbdf <- ncbdf %>% mutate(StatNames)
  ncbdf <- ncbdf %>% mutate(url = paste0('https://www.teamrankings.com', ncb_links))
  
  return(ncbdf)
}

TeamRankingIndex <- TeamRankingsPull()

#Make sure date is in the format yyyymmdd
TeamRankingsStatPull <- function(StatToPull,date_to_pull){
  date_to_pull <- as.character(ymd(date_to_pull))
  RowIndex <- which(TeamRankingIndex$StatNames == StatToPull)
  PulledRow <- subset(TeamRankingIndex[RowIndex,])
  theurl <- paste0(PulledRow$url,"?date=",date_to_pull)
  
  page <- read_html(theurl)
  tables <- html_table(page)
  StatDataset <- do.call(rbind, tables)
  StatDataset[StatDataset == "--" ] <- NA
  StatDataset <- StatDataset[complete.cases(StatDataset[3]),]
  
  
  StatDataset[c(3:8)] <- lapply(StatDataset[c(3:8)], function(x) as.numeric(gsub("%", "", x)))
  
  
  StatDataset[] <- lapply(StatDataset, function(x) {
    inds <- match(x, Logos$TeamRankingsName)
    ifelse(is.na(inds),x, Logos$TEAM[inds]) 
  })
  
  
  StatDataset <- StatDataset[ , !(names(StatDataset) %in% c("Rank"))]
  
  names(StatDataset)[2] <- StatToPull
  
  StatDataset <- StatDataset[c(1,2)]
  
  return(StatDataset)
}


add_stat <- function(bart_dataset, stat_dataset){
  
  joined_set <- merge(bart_dataset, stat_dataset, by.x = "TEAM", by.y = "Team", sort = FALSE)
  
  return(joined_set)
  
}

#Usage
#add_stat(BartData, TeamRankingsStatPull("ppg", "20150318"))



team_rankings_stats_to_add <- c("avg scoring margin", "Floor %", "pct pts 2FG", "pct pts 3FG", "pct pts FT", "EFG %", "3FG %", "2FG %",
                                "FT %", "TS %", "FGA/G", "FTA/G", "OReb %", "DReb %", "TotReb %", "Blk %", "Steal %", "Ast/TO",
                                "Ast/FG made", "TO %", "PF %", "Opp avg score margin", "Opp floor %", "Opp pct pts from 2FG",
                                "Opp pct pts from 3FG", "Opp pct pts from FT", "OPP EFG %", "Opp 3FG %", "Opp 2FG %", "Opp FT %",
                                "Opp TS %", "Opp FGA/G", "Opp FTA/G", "Opp OReb %", "Opp DReb %", "Opp Blk %", "Opp Steal %",
                                "Opp Ast/TO", "Opp Ast/FG made", "Opp TO %", "Opp PF %", "extra chances/G", "Effective poss ratio",
                                "Opp Effective poss ratio", "W % close games", "Opp W % close games")


#use date format yyyymmdd
#Adds team_rankings_stats_to_add to any BT dataset
game_day_data <- function(date_of_games){
  game_date_data <- bart_historic_data(date_of_games)
  for(stat in team_rankings_stats_to_add){
    game_date_data <- add_stat(game_date_data, TeamRankingsStatPull(stat, date_of_games))
  }
  return(game_date_data)
}

#usage
#GD20150319 <- game_day_data("20150318")

game_data_compiler <- function(df, favourite, underdog, upset){
  fav_df <- df[df$TEAM == favourite,]
  colnames(fav_df) <- paste("fav", colnames(fav_df), sep = '_')
  dog_df <- df[df$TEAM == underdog,]
  colnames(dog_df) <- paste("dog", colnames(dog_df), sep = '_')
  
  output <- cbind(fav_df,dog_df, UPSET = upset)
  
  return(output)
}







