#-----------------------------------------------------------
# Preprocessing of data
# - load raw data from Data/Blutzuckerwerte.csv
# - convert Date + Time into TimeStamp
# - separate blood glucose (BG), blood pressure and weight into 
#   different data.frames
# - create delta values for different events
#
#----------------------------------------------------------

BGRaw <- read.csv2("./Data/BlutzuckerWerte2016-02-07.csv", sep=";", stringsAsFactors=FALSE)
# 
BGRaw$Time  <- ifelse(BGRaw$Time == "", "00:00", BGRaw$Time)
BGRaw$Tstmp <- as.POSIXct(paste(BGRaw$Date,BGRaw$Time), format="%d.%m.%Y %H:%M")

BG       <- BGRaw[!is.na(BGRaw$BGLevel),c("Date", "Time", "BGLevel", "Event", "Tstmp")]
BG$Event <- as.factor(BG$Event)


