#' show_script returs book scripts
#'
#' @param file insert name of script
#'
#' @return loads the corresponding learnr tutorial
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



