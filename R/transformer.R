#' Transform a Numerical Input.
#'
#' @description The function transforms a numerical variable according to the
#' ladder of powers and displays them with histograms.
#' @param x Variable to transform
#' @param method Transformation method
#' @return Graph
#'

transformer <- function(x, method=NULL) {
  name <- deparse(substitute(x))
  name <- stringr::str_extract(name, "[$](.)+")
  name <- stringr::str_replace(name, "[$]", "")

  if (is.numeric(x) == FALSE) {
    rlang::abort("Input must be numerical.")
    }


  order <- c("cubic", "square", "identity", "sqrt",
             "log", "1/sqrt",
             "inverse", "1/square", "1/cubic")

  if (is.null(method) == FALSE) {
    df <- tibble::tibble(var = x)

    df <- dplyr::mutate(df,
                        identity = .data$var,
                        cubic = identity^3,
                        square = identity^2,
                        sqrt = sqrt(identity),
                        log = log(identity),
                        `1/sqrt` = 1 / .data$sqrt,
                        inverse = 1 / .data$identity,
                        `1/square` = 1 / .data$square,
                        `1/cubic` = 1 / .data$cubic
    )



    df <- dplyr::select(df, -.data$var)


    df <- tidyr::pivot_longer(df,
                              cols = 1:9, names_to = "transform",
                              values_to = "y"
    )

    df <- dplyr::filter(df, !is.na(.data$y))

    df <- dplyr::mutate(df, transform = factor(.data$transform,
                                               levels = order
    ))

    df <- dplyr::arrange(df, .data$transform, .data$y)

    df <- dplyr::group_by(df, .data$transform)

    df <- dplyr::mutate(df,
                        grid = seq(min(.data$y),
                                   max(.data$y),
                                   length = dplyr::n()
                        ),
                        density = dnorm(
                          .data$grid,
                          mean(.data$y),
                          sd(.data$y)
                        )
    )



    df <- dplyr::filter(df, .data$transform == method)

    ggplot2::ggplot(df, ggplot2::aes(y)) +
      ggplot2::geom_histogram(ggplot2::aes(y = ..density..), bins = 20) +
      ggplot2::geom_line(ggplot2::aes(grid, density), col = "red")+
      ggplot2::labs(
        title = paste0(method, "(", name, ")"),
        x = name,
        y = "Density"
      ) +
      ggplot2::theme_minimal(base_size = 12)

  } else {
    df <- tibble::tibble(var = x)

    df <- dplyr::mutate(df,
                        identity = .data$var,
                        cubic = identity^3,
                        square = identity^2,
                        sqrt = sqrt(identity),
                        log = log(identity),
                        `1/sqrt` = 1 / .data$sqrt,
                        inverse = 1 / .data$identity,
                        `1/square` = 1 / .data$square,
                        `1/cubic` = 1 / .data$cubic
    )



    df <- dplyr::select(df, -.data$var)


    df <- tidyr::pivot_longer(df,
                              cols = 1:9, names_to = "transform",
                              values_to = "y"
    )

    df <- dplyr::filter(df, !is.na(.data$y))

    df <- dplyr::mutate(df, transform = factor(.data$transform,
                                               levels = order
    ))

    df <- dplyr::arrange(df, .data$transform, .data$y)

    df <- dplyr::group_by(df, .data$transform)

    df <- dplyr::mutate(df,
                        grid = seq(min(.data$y),
                                   max(.data$y),
                                   length = dplyr::n()
                        ),
                        density = dnorm(
                          .data$grid,
                          mean(.data$y),
                          sd(.data$y)
                        )
    )



    ggplot2::ggplot(df, ggplot2::aes(y)) +
      ggplot2::geom_histogram(ggplot2::aes(y = ..density..), bins = 20) +
      ggplot2::geom_line(ggplot2::aes(grid, density), col = "red")+
      ggplot2::facet_wrap(~ .data$transform, scales = "free")+
      ggplot2::labs(title = paste(name, "transformed"),
                    x = "Transformation",
                    y = "Density") +
      ggplot2::theme_minimal(base_size = 12)
  }

}

utils::globalVariables(c(".data", "..density.."))
