complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## Initialise vector of number of observations
  nobs <- rep(0, length(id))
  
  ## Loop through required monitor IDs and get no of observations for each.
  for (i in 1:length(id))
  {
    currDataset <- getmonitor(id[i], directory)
    nobs[i] <- sum(complete.cases(currDataset))
  }

# Could've avoided the for loop and used sapply instead, but let's stick with one for now.
#   nobs <- sapply(id, function(id) {
#     sum(complete.cases(getmonitor(id, directory)))
#   })
#   
  
  data.frame(id, nobs)
}