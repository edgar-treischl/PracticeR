#' Shows the Line Types in R
#'
#' @description The show_plot returns a graph that shows
#' the line types in R
#' @return A ggplot2 object
#' @export
#'
#'


show_linetypes <- function() {

  lt <- c("blank", "solid", "dashed", "dotted", "dotdash", "longdash", "twodash")
  lt_names <- c("0 Blank", "1 Solid ", "2 Dashed", "3 Dotted", "4 Dotdash", "5 Longdash", "6 Twodash")

  d <- data.frame(lt, lt_names)

  ggplot2::ggplot() +
    ggplot2::scale_x_continuous(name = "", limits = c(0, 1), breaks = NULL) +
    ggplot2::scale_linetype_identity() +
    ggplot2::geom_segment(data = d,
                          mapping = ggplot2::aes(x = 0, xend = 1,
                                                 y = lt_names,
                                                 yend = lt_names,
                                                 linetype = lt)) +
    ggplot2::labs(y = "")+
    ggplot2::theme_minimal()

}

#' Shows the Shape Types in R
#'
#' @description The show_shapetypes function returns a graph that shows
#' the shape type of base R
#' @return A ggplot2 object
#' @export
#'
#'
show_shapetypes <- function() {
  df <- data.frame(
    shape = c(0:24),
    x = rep(0:-4, each = 5),
    y = rep(0:4, times = 5)
  )

  ggplot2::ggplot(df, ggplot2::aes(y, x)) +
    ggplot2::geom_point(ggplot2::aes(shape = shape), size = 3, fill = "#C51717") +
    ggplot2::geom_text(ggplot2::aes(label = shape), vjust = -1.25,
                       size = 3.5, fontface = "bold") +
    ggplot2::scale_shape_identity()+
    ggplot2::expand_limits(y = .45)+
    ggplot2::theme_minimal()+
    ggplot2::theme(axis.text = ggplot2::element_blank(),
                   axis.title =  ggplot2::element_blank())

}

# show_plot <- function(x) {
#   p <- switch(x,
#               linetypes = linetypes_plot(),
#               shapetypes  = shapetypes_plot()
#   )
#   p
#
# }
#
#

utils::globalVariables(c("x", "y", "shape"))

