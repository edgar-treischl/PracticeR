#' Shows R Scripts of the Practice R book.
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
  validExamples <- list.files(system.file("scripts", package = "PracticeR"))
  validExamples <- stringr::str_split_fixed(validExamples, n = 2, pattern = ".R")
  validExamples <- validExamples[,1]
  validExamples <- stringr::str_sort(validExamples)


  validExamplesMsg <-
    paste0(
      "Please run `show_script()` with a valid file name as an argument. Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(file) || !nzchar(file) ||
      !file %in% validExamples) {
    cli::cli_abort(validExamplesMsg)
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



#utils::globalVariables(c("value"))





