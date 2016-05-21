# all United States DEA coordinates

# Bind individual state CSVs into one dataframe -------------------------------

DIR <- "data"
stateFiles <- list.files(path=DIR, pattern=".csv", 
                         all.files=TRUE, full.names=TRUE, recursive=TRUE)

states <- data.frame()

for (i in 1:length(stateFiles)) {
  log <- read.csv(stateFiles[i], header=TRUE)
  states <- rbind(states,log)
}

write.table(states, file = "00-UnitedStates.csv", sep = ",", row.names = FALSE)