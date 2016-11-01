calcBGdiffs <- function (l.BG) {
# calculate the time difference to breakfast, lunch and dinner
  # expect the values of one day!
  
  n <- length(l.BG$Event)
  
  l.DBG      <- rep(NA, n)
  l.DTime    <- rep(NA, n)
  l.Meal     <- rep(NA, n)
  l.Diff.set <- rep(FALSE, n)
  
  for(i in 1:length(l.BG$Event)){
    
    # before Breakfast (T2)
    if(l.BG$Event[i] == "T2"){
      l.BG.T2    = l.BG$BGLevel[i]
      l.Tstmp.T2 = l.BG$Tstmp[i]
    } 
    # before Lunch (T4)
    if(l.BG$Event[i] == "T4"){
      l.BG.T4    = l.BG$BGLevel[i]
      l.Tstmp.T4 = l.BG$Tstmp[i]
    }
    # before Dinner (T6)
    if(l.BG$Event[i] == "T6"){
      l.BG.T6    = l.BG$BGLevel[i]
      l.Tstmp.T6 = l.BG$Tstmp[i]
    }
    
    
    if(l.BG$Event[i] == "T3" | l.BG$Event[i] == "T2" ){
      if (exists(as.character(quote(l.BG.T2)))) {
        l.DBG[i]      <- l.BG$BGLevel[i]-l.BG.T2
        l.DTime[i]    <- difftime(l.BG$Tstmp[i], l.Tstmp.T2, units = "mins")
        l.Meal[i]     <- 1
        l.Diff.set[i] <- TRUE
      }
    }
    if(l.BG$Event[i] == "T5" | l.BG$Event[i] == "T4" ) {
      if (exists(as.character(quote(l.BG.T4)))) {
        l.DBG[i]      <- l.BG$BGLevel[i]-l.BG.T4
        l.DTime[i]    <- difftime(l.BG$Tstmp[i], l.Tstmp.T4, units = "mins")
        l.Meal[i]     <- 2
        l.Diff.set[i] <- TRUE
      }
    }
    if(l.BG$Event[i] == "T7" | l.BG$Event[i] == "T8" | l.BG$Event[i] == "T6" ) {
      if (exists(as.character(quote(l.BG.T6)))) {
        l.DBG[i]      <- l.BG$BGLevel[i]-l.BG.T6
        l.DTime[i]    <- difftime(l.BG$Tstmp[i], l.Tstmp.T6, units = "mins")
        l.Meal[i]     <- 3
        l.Diff.set[i] <- TRUE
      }
    }
#    print(paste(l.BG$Tstmp[i], " : ", l.DTime))
  }
#   l.Meal <- factor(l.Meal, levels = c(1,2,3), labels =  c("Breakfast", "Lunch", "Dinner"))
  l.BG$Delta.Minutes <- l.DTime
  l.BG$Delta.BG      <- l.DBG
  l.BG$Meal          <- l.Meal
  l.BG$Diff.set      <- l.Diff.set
  
  return(l.BG[l.BG$Diff.set,])
}