agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  ## Read "homicides.txt" data file
  ## Extract ages of victims; ignore records where no age is
  ## given
  ## Return integer containing count of homicides for that age
  
  if (is.null(age)) {
    stop("Age cannot be NULL")
  }
  
  homicides <- readLines("homicides.txt")
  
  pattern <- paste0(age, " years old</dd>")
  
  length(grep(pattern, homicides, ignore.case = TRUE))
  
}