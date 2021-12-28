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


#' Shows all PracticeR tutorials
#'
#'
#'
#' @return shows all PracticeR tutorials
#' @export
#'
#' @examples practice_list()

practice_list <- function() {
  list.dirs(path = "inst/tutorials", full.names = FALSE, recursive = FALSE)
}





