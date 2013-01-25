corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ## Get IDs of monitors with above threshold no of observations
  id <- complete(directory)[complete(directory)$nobs > threshold,1]  
  
  if (length(id) == 0)
    {
      numeric(0)
    }
  
  else
    {
      ## Gone the cool sapply route here instead of a for loop     
      ncorr <- sapply(id, function(id) {
        cor(getmonitor(id, directory)$sulfate, getmonitor(id, directory)$nitrate, use = "pairwise.complete.obs")
      })      
    }
    
}