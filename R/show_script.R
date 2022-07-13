#' Shows all R script for each chapter of Practice R.
#'
#' @description The function scrapes the book script from Github
#' opens a new script and insert the code for you.
#'
#' @param file Name of script
#'
#' @return R script
#' @export
#'

show_script <- function(file) {
  author <- "edgar-treischl"
  repository <- "Scripts_PracticeR"
  branch <- "main"
  gitaddress1 <- "https://raw.githubusercontent.com/"

  x <- paste(gitaddress1, "/",
             author, "/",
             repository, "/",
             branch, "/",
             "R/",
             file , ".R", sep ="")
  #source_url(x)
  response <- httr::GET(x)
  text <- as.character(response)

  test <- text == "404: Not Found"

  if (test == TRUE) {
    print("Sorry, nothing there.")
  } else {
    tmp <- fs::dir_create(fs::file_temp())
    path <- paste(tmp,"/", file, "_script.R", sep = "")
    fs::file_create(path)
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::navigateToFile(path)

    while(rstudioapi::getSourceEditorContext()$id == id){
      next()
      Sys.sleep(0.1) # slow down the while loop to avoid over-processing
    }
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::insertText(text)
  }

}



#' Get script of Practice R.
#' @param file The chapter file name.
#' @return The script.
#' @export
#'

script <- function(file) {
  validExamples <- list.files(system.file("scripts", package = "PracticeR"))
  validExamples <- stringr::str_split_fixed(validExamples, n = 2, pattern = ".R")
  validExamples <- validExamples[,1]

  validExamplesMsg <-
    paste0(
      "Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(file) || !nzchar(file) ||
      !file %in% validExamples) {
    stop(
      'Please run `show_script()` with a valid file name as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }

  author <- "edgar-treischl"
  repository <- "Scripts_PracticeR"
  branch <- "main"
  gitaddress1 <- "https://raw.githubusercontent.com/"
  #file <- "chapter2"
  x <- paste(gitaddress1, "/",
             author, "/",
             repository, "/",
             branch, "/",
             "R/",
             file , ".R", sep ="")
  #source_url(x)
  response <- try(httr::GET(x), silent=TRUE)
  online <- class(response) == "try-error"


  #test <- text == "404: Not Found"
  if (online == TRUE) {
    print("There is internet connection, go online for the lastest version.")
    tmp <- fs::dir_create(fs::file_temp())
    #path <- paste(tmp,"/", file, "_script.R", sep = "")
    file_name <- paste0(file, ".R")
    path <- system.file("scripts", file_name, package = "PracticeR")
    fs::file_create(path)
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::navigateToFile(path)
    # while(rstudioapi::getSourceEditorContext()$id == id){
    #   next()
    #   Sys.sleep(0.1) # slow down the while loop to avoid over-processing
    # }
    # id <- rstudioapi::getSourceEditorContext()$id
    # rstudioapi::insertText(text)
  } else {
    text <- as.character(response)
    tmp <- fs::dir_create(fs::file_temp())
    path <- paste(tmp,"/", file, "_script.R", sep = "")
    fs::file_create(path)
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::navigateToFile(path)

    while(rstudioapi::getSourceEditorContext()$id == id){
      next()
      Sys.sleep(0.1) # slow down the while loop to avoid over-processing
    }
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::insertText(text)
  }
}


#' Copy the R code of Practice R chapter.
#'
#' @description The function get the book script from Github
#' opens a new script and insert the code in the script.
#'
#'
#' @return A tibble
#' @export
#'


copy_chapter <- function() {
  author <- "edgar-treischl"
  repository <- "Scripts_PracticeR"
  branch <- "main"
  gitlink2 <- "/git/trees/main?recursive=1"
  gitlink1 <- "https://api.github.com/repos/"
  gitsearch_name <- paste(gitlink1, author, "/", sep = "" )

  gitsearch <- paste(gitsearch_name, repository, gitlink2, sep = "" )

  response <- httr::GET(gitsearch)

  jsonRespParsed <- httr::content(response, as="parsed")
  modJson <- jsonRespParsed$tree

  df <- dplyr::bind_rows(modJson)

  chapters <- df$path
  query_results <- tidyr::as_tibble(stringr::str_subset(chapters,
                                                        "R\\/\\w+\\.R$"))


  result <- dplyr::select(query_results, chapters = value)
  result
}

#' Copy a Rmarkdown template.
#'
#' @description The function gets the book template from Github
#' and opens it as a new rmarkdown.
#'
#' @param file Name of script
#'
#' @return Rmd
#' @export
#'

copy_template <- function(file) {
  author <- "edgar-treischl"
  repository <- "Scripts_PracticeR"
  branch <- "main"
  gitaddress1 <- "https://raw.githubusercontent.com/"

  x <- paste(gitaddress1, "/",
             author, "/",
             repository, "/",
             branch, "/",
             "Rmd/",
             file , ".Rmd", sep ="")
  #source_url(x)
  response <- httr::GET(x)
  text <- as.character(response)

  test <- text == "404: Not Found"

  if (test == TRUE) {
    print("Sorry, nothing there.")
  } else {
    tmp <- fs::dir_create(fs::file_temp())
    path <- paste(tmp,"/", file, ".Rmd", sep = "")
    fs::file_create(path)
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::navigateToFile(path)

    while(rstudioapi::getSourceEditorContext()$id == id){
      next()
      Sys.sleep(0.1) # slow down the while loop to avoid over-processing
    }
    id <- rstudioapi::getSourceEditorContext()$id
    rstudioapi::insertText(text)
  }
}


utils::globalVariables(c("value"))





