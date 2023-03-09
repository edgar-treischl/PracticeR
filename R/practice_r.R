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



#' Operators
#'
#' @description Examine logical and relational operators
#'
#' @param operator Name of the operator
#'
#' @return Returns operators via the console
#' @export
#'


operators <- function(operator) {
  validExamples <- c("relational", "logical")
  validExamplesMsg <-
    paste0(
      "Please run `show_operators()` with a valid file name as an argument. Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(operator) || !nzchar(operator) ||
      !operator %in% validExamples) {
    cli::cli_abort(validExamplesMsg)
  }


  ro <- c("x <- 5", "y <- 10",
          "#Less than", "x < y",
          "#Greater than","x > y",
          "#Less than or equal to", "x <= y",
          "#Greater than or equal to", "x >= y",
          "#Equal to", "x == y",
          "#Not equal to", "x != y")

  lo <- c("x <- TRUE", "y <- FALSE",
          "#Elementwise logical AND", "x & y == TRUE",
          "#Elementwise logical OR", "x | y == TRUE",
          "#Elementwise OR", "xor(x, y)",
          "#Logical NOT", "!x",
          "#In operator", "1:3 %in% rep(1:2)")

  x <- switch(operator,
              relational   = ro,
              logical = lo
  )

  txt <- switch(operator,
                relational   = "Relational Operators",
                logical = "Logical Operators"
  )

  cli::cli_h1(txt)
  rstudioapi::sendToConsole(x)
}


