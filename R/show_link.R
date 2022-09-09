#' Shows Links from the Practice R Book.
#'
#' @description The function copies the URL and
#' opens the link in the browser.
#'
#' @param url URL name
#' @param browse Open browser
#' @return Prints URL
#' @export
#'

show_link <- function(url, browse = TRUE) {
  validExamples <- c("r4ds", "pr_website", "master_shiny", "webscraping")

  validExamplesMsg <-
    paste0(
      "Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(url) || !nzchar(url) ||
      !url %in% validExamples) {
    stop(
      'Please run `view_link()` with a valid url name as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }

  adress <- switch(url,
                   r4ds = "https://r4ds.had.co.nz/",
                   master_shiny = "https://mastering-shiny.org/index.html",
                   webscraping = "https://edgar-treischl.github.io/PracticeR/articles/web_only/webscraping.html",
                   pr_website = "https://edgar-treischl.github.io/PracticeR/"
  )
  if (browse == FALSE) {
    url <- adress
    x <- paste("Go to:", adress)
    cat(crayon::green(cli::symbol$tick), x)
  }
  else {
    url <- adress
    x <- paste("Go to:", adress)
    cat(crayon::green(cli::symbol$tick), x)
    utils::browseURL(url)
  }

}

