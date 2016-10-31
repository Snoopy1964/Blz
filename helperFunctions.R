calcBGdiffs <- function (l.BG) {
  l.DBG   = c()
  l.DTime = c()

  for(i in 1:length(l.BG$Event)){
    if(l.BG$Event[i] == "T2"){
      l.BG.T2    = l.BG$BGLevel[i]
      l.Tstmp.T2 = l.BG$Tstmp[i]
    } 
    if(l.BG$Event[i] == "T4"){
      l.BG.T4    = l.BG$BGLevel[i]
      l.Tstmp.T4 = l.BG$Tstmp[i]
    }
    if(l.BG$Event[i] == "T6"){
      l.BG.T6    = l.BG$BGLevel[i]
      l.Tstmp.T6 = l.BG$Tstmp[i]
    }
    if(l.BG$Event[i] == "T2" | l.BG$Event[i] == "T3" | l.BG$Event[i] == "T4" ){
      l.DBG   = c(l.DBG, l.BG$BGLevel[i]-l.BG.T2)
      l.DTime = c(l.DTime, l.BG$Tstmp[i]-l.Tstmp.T2)
    }
    if(l.BG$Event[i] == "T5" | l.BG$Event[i] == "T6" ) {
      l.DBG   = c(l.DBG, l.BG$BGLevel[i]-l.BG.T4)
      l.DTime = c(l.DTime, l.BG$Tstmp[i]-l.Tstmp.T4)
    }
    if(l.BG$Event[i] == "T7" | l.BG$Event[i] == "T8" ) {
      l.DBG   = c(l.DBG, l.BG$BGLevel[i]-l.BG.T6)
      l.DTime = c(l.DTime, l.BG$Tstmp[i]-l.Tstmp.T6)
    }
    
  }
  return(cbind(Delta.BG=l.DBG,Delta.Minutes=l.DTime*60))
}