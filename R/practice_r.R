#' Load PracticeR tutorials
#'
#' @param x insert name of the tutorial
#'
#' @return loads the corresponding learnr tutorial
#' @export
#'

practice <- function(x) {
  learnr::run_tutorial(x, package = "PracticeR")
}



