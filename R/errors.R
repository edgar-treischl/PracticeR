#' Catch the errors of an R script.
#'
#' @description Runs a R script in a new environment and catches errors and warnings.
#' @param script The R script
#' @return A message

catch_errors <- function(script) {
  tryCatch({
    source(script, echo = FALSE, local = new.env())
    message(paste("The file", script, "runs smoothly."))
  },
  error = function(cond){
    message(paste("The file", script, "is NOT running."))
    message(cond)
  },
  warning = function(w){
    message(paste("The file", script, "has warnings, but no errors."))
    message(w)
  }
  )}

