
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PracticeR

<!-- badges: start -->

<img src="man/figures/sticker.png" align="right" width="250/" alt="Practice R - Edgar Treischl"/>

<!-- badges: end -->

Practice R is a textbook for the social sciences and contains several
online tutorials based on the `learnr` package. The corresponding
package `PracticeR` gives access to the tutorials of the book and
provides further materials and templates to learn R.

## Installation

You can install a preview version of PracticeR from my github account:

``` r
# install.packages("devtools")
devtools::install_github("edgar-treischl/PracticeR")
```

## Example

The book is expected for 2022, at the moment there is only one `preview`
tutorial available. To load a specific tutorial, insert the
corresponding name in the `practice` function, which calls the `learnr`
package in the background and hands over the tutorial from Practice R.

``` r
library(PracticeR)
## basic example code
practice("preview")
```

If everything works, the tutorial will be opened in R Studio or your
browser:

![](man/figures/preview.png)
