getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Go into chosen directory, will always be in RStudio working path
  setwd(paste("~/tech/cfda/", directory, "/", sep = ""))

  ## Read in CSVs of specified monitor IDs, with appropriate 0 padding
  monitordata <- read.csv(paste(formatC(id, width=3, flag = "0"), "csv", sep="."))
  
  ## Go back out to R working dir
  setwd("..")
  
  if (summarize == TRUE)
    {
      print(summary(monitordata))
    }

  monitordata
  
}