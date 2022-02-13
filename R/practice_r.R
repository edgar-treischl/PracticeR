#' practice
#'
#' @description Practice R - An interactive textbook for
#' for the social sciences has several learnr tutorials; the
#' practice function is a convient way to load them
#'
#' @param name name of the tutorial
#'
#' @return loads the tutorial
#' @export
#'

practice <- function(name) {
  learnr::run_tutorial(name, package = "PracticeR")
}



