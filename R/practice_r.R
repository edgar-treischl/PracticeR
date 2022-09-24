#' Show the Practice R Tutorials
#'
#' @description Practice R comes with several learnr tutorials; the
#' function is a convenient way to load them
#'
#' @param file Name of the tutorial
#'
#' @return Returns the tutorial
#' @export
#'

show_tutorial <- function(file) {
  validExamples <- list.files(system.file("tutorials", package = "PracticeR"))

  validExamplesMsg <-
    paste0(
      "Please run `show_tutorial()` with a valid file name as an argument. Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(file) || !nzchar(file) ||
      !file %in% validExamples) {
    cli::cli_abort(validExamplesMsg)
  }

  learnr::run_tutorial(file, package = "PracticeR")
}



