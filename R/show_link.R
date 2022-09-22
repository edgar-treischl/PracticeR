#' Shows Links from the Practice R Book.
#'
#' @description The function copies the URL and
#' opens the link in the browser.
#'
#' @param name URL name
#' @param browse Open browser
#' @return Prints URL
#' @export
#'

show_link <- function(name, browse = TRUE) {
  df <- tidyr::tribble(
    ~title, ~shortcut, ~link,
    "R for Data Science", "r4ds", "https://r4ds.had.co.nz/",
    "Welcome to Text Mining with R", "textmining", "https://www.tidytextmining.com/",
    "Fundamentals of Data Visualization", "dataviz" , "https://clauswilke.com/dataviz/",
    "bookdown: Authoring Books and ...", "bookdown", "https://bookdown.org/yihui/bookdown/",
    "Mastering Shiny", "master_shiny","https://mastering-shiny.org/",
    "Practice R Website", "pr_website", "https://edgar-treischl.github.io/PracticeR/",
    "Practice R Webscraping HTML", "webscraping", "https://edgar-treischl.github.io/PracticeR/articles/web_only/webscraping.html"
  )

  if (name == "all") {
    print(df)
  }

  if (name != "all") {
    validExamples <- df$shortcut

    validExamplesMsg <-
      paste0(
        "Valid examples are: '",
        paste(validExamples, collapse = "', '"),
        "'")

    # if an invalid example is given, throw an error
    if (missing(name) || !nzchar(name) ||
        !name %in% validExamples) {
      cli::cli_abort(validExamplesMsg)
    }


    df <- subset(df, name == shortcut)

    if (browse == FALSE) {
      url <- df$link
      x <- paste("Go to:", url)
      cat(crayon::green(cli::symbol$pointer), x)
    }
    else {
      url <- df$link
      x <- paste("Go to:", url)
      cat(crayon::green(cli::symbol$tick), x)
      utils::browseURL(url)
    }

  }

}

utils::globalVariables(c("shortcut"))
