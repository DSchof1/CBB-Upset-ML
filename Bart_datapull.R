library(jsonlite)

#Barttorvik time machine data goes back to 2015


bart_historic_data <- function(formatted_date){
  date_url <- paste0("https://barttorvik.com/timemachine/team_results/",formatted_date,"_team_results.json.gz")
  dat <- readBin(date_url, "raw", 1e07)
  res <- parse_gzjson_raw(dat)
  output_dataset <- as.data.frame(res)
  names(output_dataset) <- c("rank","TEAM","conf","record","ADJOE","oe Rank","ADJDE",
                   "de Rank","BARTHAG",	"Bartrank",	"proj. W",	"Proj. L",	"Pro Con W",
                   "Pro Con L",	"Con Rec.",	"sos",	"ncsos",	"consos",	"Proj. SOS",
                   "Proj. Noncon SOS",	"Proj. Con SOS",	"elite SOS",	"elite noncon SOS",
                   "Opp OE",	"Opp DE",	"Opp Proj. OE",	"Opp Proj DE",	"Con Adj OE",	"Con Adj DE",
                   "Qual O",	"Qual D",	"Qual Barthag",	"Qual Games",	"FUN",	"ConPF",	"ConPA",
                   "ConPoss",	"ConOE",	"ConDE",	"ConSOSRemain",	"Conf Win%",	"WAB",
                   "WAB Rk",	"Fun Rk", "ADJ_T")
  
  output_dataset[,"rank"] <- as.numeric(output_dataset[,"rank"])
  output_dataset[,"conf"] <- as.factor(output_dataset[,"conf"])
  output_dataset[,5:14] <- as.numeric(as.matrix(output_dataset[,5:14]))
  output_dataset[,16:45] <- as.numeric(as.matrix(output_dataset[,16:45]))
  
  if("Arkansas Little Rock" %in% output_dataset$TEAM){
    output_dataset[output_dataset$TEAM == "Arkansas Little Rock",][,"TEAM"] <- "Little Rock"
  }
  
  output_dataset <- output_dataset[,c("TEAM","ADJOE","ADJDE","sos","ncsos","consos","Opp OE","Opp DE","ADJ_T")]
  
  return(output_dataset)
}

#Usage
#bart_historic_data("20150318")






