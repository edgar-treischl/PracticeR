#' Returns Packages used in Practice R
#'
#' @description The show_packages returns a character vector with
#' package names used in Practice R
#' @param file Name of script
#' @return A character vector
#' @export
#'
#'

show_packages <- function(file) {

  validExamples <- list.files(system.file("scripts", package = "PracticeR"))
  validExamples <- stringr::str_split_fixed(validExamples, n = 2, pattern = ".R")
  validExamples <- validExamples[,1]
  validExamples <- stringr::str_sort(validExamples)


  validExamplesMsg <-
    paste0(
      "Please run `show_packages()` with a valid file name as an argument. Valid examples are: ",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(file) || !nzchar(file) ||
      !file %in% validExamples) {
    cli::cli_abort(validExamplesMsg)
  }

  path <- system.file("scripts/", package = "PracticeR")
  filepath <- paste0(path, file, ".R")

  file <- readr::read_delim(filepath,
                            delim = "\n", escape_double = FALSE,
                            col_names = "text", comment = "#",
                            trim_ws = TRUE, show_col_types = FALSE)


  text <- file$text
  text <- stringr::str_extract(text, "library\\(\\w+")
  text <- text[!is.na(text)]
  text <- stringr::str_extract(text, "\\(\\w+")
  text <- stringr::str_extract(text, "\\w+")

  points <- file$text
  points <- stringr::str_extract(points, "\\w+\\::\\w+")
  points <- points[!is.na(points)]
  points <- stringr::str_extract(points, "\\w+")


  package_name <- c(text, points)
  package_name <- stringi::stri_unique(package_name)
  package_name <- stringr::str_sort(package_name)
  package_name

}







