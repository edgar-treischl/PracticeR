#' Load the Practice R Tutorials
#'
#' @description Practice R comes with several learnr tutorials; the
#' practice function is a convenient way to load them
#'
#' @param name Name of the tutorial
#'
#' @return Returns the tutorial in the viewer pane
#' @export
#'

practice <- function(name) {
  learnr::run_tutorial(name, package = "PracticeR")
}



