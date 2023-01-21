#' All links from the Practice R Book.
#'
#' @description The function copies the URL and
#' opens the link in the browser.
#'
#' @return Prints data frame
#' @export
#'

show_links <- function() {
  links_pr <- tidyr::tribble(
    ~title, ~shortcut, ~link,
    "R for Data Science", "r4ds", "https://r4ds.had.co.nz/",
    "Welcome to Text Mining with R", "textmining", "https://www.tidytextmining.com/",
    "bookdown: Authoring Books and ...", "bookdown", "https://bookdown.org/yihui/bookdown/",
    "Mastering Shiny", "master_shiny","https://mastering-shiny.org/",
    "dplyr website", "dplyr", "https://dplyr.tidyverse.org/",
    "Pro Git", "pro-git", "https://git-scm.com/book/en/v2",
    "R Graphics Cookbook", "r_graphics", "https://r-graphics.org/",
    "ggplot2: Elegant Graphics for Data Analysis", "ggplot2", "https://ggplot2-book.org/",
    "Fundamentals of Data Visualization", "fundamentals_dataviz", "https://clauswilke.com/dataviz/",
    "Data Visualization: A practical introduction", "dataviz" , "https://socviz.co/" ,
    "R Markdown Cookbook", "rmarkdown_cookbook", "https://bookdown.org/yihui/rmarkdown-cookbook/",
    "bookdown_website", "bookdown_website", "https://bookdown.org/",
    "ColorBrewer", "color_brewer", "https://colorbrewer2.org/",
    "TidyTuesday", "tidy_tuesday", "https://github.com/rfordatascience/tidytuesday",
    "R Packages", "r_packages", "https://r-pkgs.org/",
    "Hands-On Programming with R", "hands_on_R", "https://rstudio-education.github.io/hopr/",
    "ggplot2 extension", "ggplot2_ext", "https://exts.ggplot2.tidyverse.org/",
    "What They Forgot to Teach You About R", "forgot_teach", "https://rstats.wtf/",
    "Practice R Website", "pr_website", "https://edgar-treischl.github.io/PracticeR/",
    "Practice R Repository", "pr_github", "https://github.com/edgar-treischl/PracticeR/",
    "Penguins Repository", "penguins_report", "https://github.com/edgar-treischl/penguins_report.git",
    "Practice R Webscraping HTML", "webscraping", "https://edgar-treischl.github.io/PracticeR/articles/web_only/webscraping.html"
  )

  links_pr <- as.data.frame(links_pr)
  return(links_pr)
}


#' Shows the links from the Practice R Book.
#'
#' @description The function copies the URL and
#' opens the link in the browser.
#'
#' @param name URL name
#' @param browse Open browser
#' @return Prints URL
#' @export
#'

# show_link <- function(name, browse = TRUE) {
#
#   df <- tidyr::tribble(
#     ~title, ~shortcut, ~link,
#     "R for Data Science", "r4ds", "https://r4ds.had.co.nz/",
#     "Welcome to Text Mining with R", "textmining", "https://www.tidytextmining.com/",
#     "bookdown: Authoring Books and ...", "bookdown", "https://bookdown.org/yihui/bookdown/",
#     "Mastering Shiny", "master_shiny","https://mastering-shiny.org/",
#     "dplyr website", "dplyr", "https://dplyr.tidyverse.org/",
#     "Pro Git", "pro-git", "https://git-scm.com/book/en/v2",
#     "R Graphics Cookbook", "r_graphics", "https://r-graphics.org/",
#     "ggplot2: Elegant Graphics for Data Analysis", "ggplot2", "https://ggplot2-book.org/",
#     "Fundamentals of Data Visualization", "fundamentals_dataviz", "https://clauswilke.com/dataviz/",
#     "Data Visualization: A practical introduction", "dataviz" , "https://socviz.co/" ,
#     "R Markdown Cookbook", "rmarkdown_cookbook", "https://bookdown.org/yihui/rmarkdown-cookbook/",
#     "bookdown_website", "bookdown_website", "https://bookdown.org/",
#     "ColorBrewer", "color_brewer", "https://colorbrewer2.org/",
#     "TidyTuesday", "tidy_tuesday", "https://github.com/rfordatascience/tidytuesday",
#     "R Packages", "r_packages", "https://r-pkgs.org/",
#     "Hands-On Programming with R", "hands_on_R", "https://rstudio-education.github.io/hopr/",
#     "ggplot2 extension", "ggplot2_ext", "https://exts.ggplot2.tidyverse.org/",
#     "What They Forgot to Teach You About R", "forgot_teach", "https://rstats.wtf/",
#     "Practice R Website", "pr_website", "https://edgar-treischl.github.io/PracticeR/",
#     "Practice R Repository", "pr_github", "https://github.com/edgar-treischl/PracticeR/",
#     "Penguins Repository", "penguins_report", "https://github.com/edgar-treischl/penguins_report.git",
#     "Practice R Webscraping HTML", "webscraping", "https://edgar-treischl.github.io/PracticeR/articles/web_only/webscraping.html"
#   )
#
#   #df <- df |> dplyr::arrange(title)
#   df <- df[order(df$title),]
#
#
#   if (name == "all") {
#     x <- as.data.frame(df)
#     print(x)
#   }
#
#   if (name != "all") {
#     validExamples <- df$shortcut
#
#     validExamplesMsg <-
#       paste0(
#         "Valid examples are: '",
#         paste(validExamples, collapse = "', '"),
#         "'")
#
#     # if an invalid example is given, throw an error
#     if (missing(name) || !nzchar(name) ||
#         !name %in% validExamples) {
#       cli::cli_abort(validExamplesMsg)
#     }
#
#
#     df <- subset(df, name == shortcut)
#
#     if (browse == FALSE) {
#       url <- df$link
#       return(url)
#       #x <- paste("Go to:", url)
#       #cat(crayon::green(cli::symbol$pointer), x)
#     }
#     else {
#       url <- df$link
#       x <- paste("Go to:", url)
#       cat(crayon::green(cli::symbol$tick), x)
#       utils::browseURL(url)
#     }
#
#   }
#
# }

show_link <- function(name, browse = TRUE) {

  df <- show_links()
  #df <- df |> dplyr::arrange(title)
  df <- df[order(df$title),]

  validExamples <- stringr::str_sort(df$shortcut)

  validExamplesMsg <-
    paste0(
      "Insert a key word. Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(name) || !nzchar(name) ||
      !name %in% validExamples) {
    cli::cli_abort(validExamplesMsg)
  }


  if (name != "all" & name != missing(name)) {

    df <- subset(df, name == shortcut)

    if (browse == FALSE) {
      url <- df$link
      return(url)
      #x <- paste("Go to:", url)
      #cat(crayon::green(cli::symbol$pointer), x)
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
