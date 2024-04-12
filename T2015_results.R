#I'm considering any seed differential of ≥4 as an upset

Bart2015_dates <- c("20150318","20150319","20150320","20150321","20150325","20150326","20150327","20150328","20150403","20150405")


status_20150319 <- list(c("Kentucky","Hampton",FALSE), c("Villanova","Lafayette",FALSE),
                        c("Arizona","Texas Southern",FALSE),c("Notre Dame","Northeastern",FALSE),
                        c("Iowa St.","UAB",TRUE), c("North Carolina","Harvard",FALSE),
                        c("Baylor","Georgia St.",TRUE), c("SMU","UCLA",TRUE), c("Utah","Stephen F. Austin",FALSE),
                        c("Arkansas","Wofford",FALSE), c("Georgetown","Eastern Washington",FALSE),
                        c("Butler","Texas",FALSE), c("VCU","Ohio St.",FALSE), c("Xavier","Mississippi",FALSE),
                        c("Cincinnati","Purdue",FALSE), c("North Carolina St.","LSU",FALSE))

status_20150320 <- list(c("Wisconsin","Coastal Carolina",FALSE), c("Duke","Robert Morris",FALSE),
                        c("Virginia","Belmont",FALSE), c("Gonzaga","North Dakota St.",FALSE),
                        c("Kansas","New Mexico St.",FALSE), c("Northern Iowa","Wyoming",FALSE),
                        c("Maryland","Valparaiso",FALSE), c("Oklahoma","Albany",FALSE),
                        c("Wichita St.","Indiana",FALSE), c("Louisville","UC Irvine",FALSE),
                        c("West Virginia","Buffalo",FALSE), c("Michigan St.","Georgia",FALSE),
                        c("Oregon","Oklahoma St.",FALSE), c("Iowa","Davidson",FALSE),
                        c("San Diego St.","St. John's",FALSE), c("Providence","Dayton",TRUE))

status_20150321 <- list(c("Kentucky","Cincinnati",FALSE), c("Villanova","North Carolina St.",TRUE),
                        c("Arizona","Ohio St.",FALSE), c("Notre Dame","Butler",FALSE),
                        c("North Carolina","Arkansas",FALSE), c("Georgetown","Utah",FALSE),
                        c("UCLA","UAB",FALSE), c("Xavier","Georgia St.",FALSE))

status_20150322 <- list(c("Wisconsin","Oregon",FALSE), c("Duke","San Diego St.",FALSE),
                        c("Virginia","Michigan St.",TRUE), c("Gonzaga","Iowa",FALSE),
                        c("Kansas","Wichita St.",TRUE), c("Louisville","Northern Iowa",FALSE),
                        c("Maryland","West Virginia",FALSE), c("Oklahoma","Dayton",FALSE))

status_20150326 <- list(c("Kentucky","West Virginia",FALSE), c("Wisconsin","North Carolina",FALSE),
                        c("Arizona","Xavier",FALSE), c("Notre Dame","Wichita St.",FALSE))

status_20150327 <- list(c("Duke","Utah",FALSE), c("Gonzaga","UCLA",FALSE),
                        c("Oklahoma","Michigan St.",TRUE), c("Louisville","North Carolina St.", FALSE))

status_20150328 <- list(c("Kentucky","Notre Dame",FALSE), c("Wisconsin","Arizona",FALSE))

status_20150329 <- list(c("Duke","Gonzaga",FALSE), c("Louisville","Michigan St.", FALSE))

status_20150404 <- list(c("Kentucky","Wisconsin",FALSE), c("Duke","Michigan St.",FALSE))

status_20150406 <- list(c("Duke","Wisconsin",FALSE))

full_2015 <- c("status_20150319","status_20150320","status_20150321","status_20150322","status_20150326",
               "status_20150327","status_20150328","status_20150329","status_20150404","status_20150406")
