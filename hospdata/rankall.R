rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name


  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
  attack <- suppressWarnings(as.numeric(outcomedata[,11]))
  failure <- suppressWarnings(as.numeric(outcomedata[,17]))
  pneumonia <- suppressWarnings(as.numeric(outcomedata[,23]))

  validOutcomes <- c("heart attack", "heart failure", "pneumonia")
  
  switch(outcome,
         "heart attack" = {i <- attack},
         "heart failure" = {i <- failure},
         "pneumonia" = {i <- pneumonia},
         stop("invalid outcome"))
  
  dataset <- data.frame(hospital = outcomedata$Hospital.Name,
                        state = outcomedata$State,
                        NoOfOutcomes = i
                        )
  
  dataset <- dataset[!is.na(dataset$NoOfOutcomes), ]
  
  dataset <- dataset[with(dataset,order(state, NoOfOutcomes, hospital)), ]

  
  ordered <- by(dataset, dataset$state, function(x) x[order(x$NoOfOutcomes),],
                 simplify = FALSE)

  
  if (!is.numeric(num)) {
      switch(num,
             "best" = {ranked <- lapply(ordered, function(x) {x[1,]} )},
             "worst" = {ranked <- lapply(ordered, function(x) {x[nrow(x),]})},
             stop("invalid rank"))
  } else {
      ranked <- lapply(ordered, function(x) {x[num,]} )
  }  
    
  df <- do.call("rbind", ranked)
  
  df$stateCode <- row.names(df)
  df[,c("hospital", "state")]
  
}

