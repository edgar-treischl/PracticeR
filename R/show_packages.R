#' Returns the names of used R Packages in Practice R
#'
#' @description The show_packages returns a character vector with
#' package names used in Practice R
#' @param file Name of script file
#' @param insert If TRUE the libraries will be insert in an R Script
#' @return A character vector
#' @export
#'
#'

show_packages <- function(file, insert = TRUE) {

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

  if (insert == FALSE) {
    package_name
  } else {
    txt <- paste0("library(", package_name, ")")
    rstudioapi::insertText(txt)
  }

}


#' Returns All Packages Names used in Practice R
#'
#' @description The returns a character vector with
#' all package names used in Practice R
#' @return A character vector
#' @export
#'
#'

show_packages_all <- function() {
  list <- c('chapter02', 'chapter03', 'chapter04', 'chapter05',
            'chapter06', 'chapter07', 'chapter08', 'chapter09', 'chapter10',
            'chapter11', 'chapter12')

  p_list <- purrr::map(list, PracticeR::show_packages, insert = FALSE) |>
    purrr::flatten_chr()


  p_list <- stringi::stri_unique(p_list)

  p_list <- stringr::str_sort(p_list)
  p_list
}






