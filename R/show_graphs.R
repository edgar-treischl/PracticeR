#' show_linetypes Shows line types from base R

#' @return loads the corresponding learnr tutorial
#' @export
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

#' show_shapetypes Shows shape types from base R

#' @return loads the corresponding learnr tutorial
#' @export
#'

show_shapetypes <- function() {
  shapes <- data.frame(
    shape = c(0:19, 22, 21, 24, 23, 20),
    x = 0:24 %/% 5,
    y = -(0:24 %% 5)
  )

  ggplot2::ggplot(shapes, ggplot2::aes(x, y)) +
    ggplot2::geom_point(ggplot2::aes(shape = shape), size = 4, fill = "grey") +
    ggplot2::geom_text(ggplot2::aes(label = shape), hjust = 0, nudge_x = 0.15) +
    ggplot2::scale_shape_identity() +
    ggplot2::expand_limits(x = 4.1) +
    ggplot2::theme_void()

}

utils::globalVariables(c("x", "y", "shape"))

