#-----------------------------------------------------------
# Preprocessing of data
# - load raw data from Data/Blutzuckerwerte.csv
# - convert Date + Time into TimeStamp
# - separate blood glucose (BG), blood pressure and weight into 
#   different data.frames
# - create delta values for different events
#
#----------------------------------------------------------

BGRaw <- read.csv2("Data/BlutzuckerWerte2016.csv", sep=";", stringsAsFactors=FALSE)
# 
# convert raw data
#
BGRaw$Time  <- ifelse(BGRaw$Time == "", "00:00", BGRaw$Time)
BGRaw$Tstmp <- as.POSIXct(paste(BGRaw$Date,BGRaw$Time), format="%d.%m.%Y %H:%M")
BGRaw$Date  <- as.Date(BGRaw$Date, format="%d.%m.%Y")
BGRaw$Event <- as.factor(BGRaw$Event)
#
# select BGLevel data only
#
# BG.all <- BGRaw[!is.na(BGRaw$BGLevel),c("Date", "Time", "BGLevel", "Event", "Tstmp")]
BG.all <- BGRaw[BGRaw$Event %in% c("T1", "T2", "T3", "T4", "T5", "T6", "T7", "T8"),c("Date", "Time", "BGLevel", "Event", "Tstmp")]
BG.all$Event <- factor(BG.all$Event)
#
# sample for testing purposes
#
BG.tmp <- BG.all#[BG.all$Tstmp >= "2016-09-01 00:00:00",]
#BG.tmp <- BG.all[1:100,]

#BG <- aggregate(x=BG.tmp, by=list(BG.tmp$Date), FUN="summarize")

#
# split data by day
#                
BG.list <- split(BG.tmp, BG.tmp$Date)
BG.list <- lapply(BG.list, FUN = calcBGdiffs)

BG <- rbindlist(BG.list)




