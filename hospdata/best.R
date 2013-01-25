best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate

  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
  attack <- suppressWarnings(as.numeric(outcomedata[,11]))
  failure <- suppressWarnings(as.numeric(outcomedata[,17]))
  pneumonia <- suppressWarnings(as.numeric(outcomedata[,23]))

  validStates <- unique(outcomedata$State)
  validOutcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(state %in% validStates)) {
    stop("invalid state")
  }
  
  switch(outcome,
         "heart attack" = {i <- attack},
         "heart failure" = {i <- failure},
         "pneumonia" = {i <- pneumonia},
         stop("invalid outcome"))
  
  dataset <- data.frame(NoOfOutcomes = i,
                        hosp = outcomedata$Hospital.Name,
                        stateCode = outcomedata$State)
  
  dataset <- dataset[dataset$stateCode == state & !is.na(dataset$NoOfOutcomes), ]

  dataset <- dataset[with(dataset,order(NoOfOutcomes, hosp, stateCode)), ]
  
  as.character(dataset[1,2])
  
}