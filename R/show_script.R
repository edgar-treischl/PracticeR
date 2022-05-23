#' Shows the R script for each chapter of Practice R.
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


#' show_chapters
#' @description fetches the book script from Github
#' opens a new script and insert the code in the script
#'
#'
#' @return A tibble
#' @export
#'


show_chapters <- function() {
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
#' @description The function scrapes the book template from Github
#' and opens the template as a new rmarkdown.
#'
#' @param file Name of script
#'
#' @return Rmd
#' @export
#'

template <- function(file) {
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





