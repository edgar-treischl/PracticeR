#' Shows the linetypes and shapestypes in R
#'
#' @description The show_plot returns a graph that shows
#' the line types and shape type of base R
#' @param x Plot name
#' @return A ggplot2 object
#' @export
#'

show_plot <- function(x) {
  p <- switch(x,
              linetypes = linetypes_plot(),
              shapetypes  = shapetypes_plot()
  )
  p

}


utils::globalVariables(c("x", "y", "shape"))

