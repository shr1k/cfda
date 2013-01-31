count <- function(cause = NULL) {
  ## Check that "cause" is non-NULL; else throw error
  ## Check that specific "cause" is allowed; else throw error
  ## Read "homicides.txt" data file
  ## Extract causes of death
  ## Return integer containing count of homicides for that cause
  
  validCauses <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  
  if (is.null(cause)) {
    stop("Cause cannot be NULL")
  }
  
  if (!(cause %in% validCauses)) {
    stop("invalid cause")
  }
  
  homicides <- readLines("homicides.txt")
  pattern <- paste0("<dd>Cause: ", cause, "</dd>")
  
  length(grep(pattern, homicides, ignore.case = TRUE))
  
}