# load some package for a nice visualization

if(Sys.getenv("COMPUTERNAME") == "PAPABAER") {
  .libPaths(c("C:/Users/ralf/Documents/R/win-library/3.1", "C:/Program Files/R/R-3.1.2/library"))
  working.directory <- "C:/Users/ralf/Dropbox/R-projects/Ralf"
  data.directory    <- working.directory
} else {
  .libPaths(c("C:/Users/D026190/Documents/R/win-library/3.1", "C:/Program Files/R/R-3.1.1/library"))
  working.directory <- "C:/Users/D026190/Dropbox/R-projects/DataStreamGeneration"
  data.directory    <- "C:/Users/D026190/Downloads/SAP/SiemensBT"
}
library("car")
library("sm")
library("mclust")
library("RJDBC")
library("ggplot2")
library("gplots")
library("gridExtra")
library("TTR")
library("xlsx")
library("shiny")
startApp <- function(app){
  runApp(appDir=file.path(getwd(),app), launch.browser=FALSE)
}
