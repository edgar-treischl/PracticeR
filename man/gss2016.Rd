% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{gss2016}
\alias{gss2016}
\title{General Social Survey Data, 2016}
\format{
A data frame with 2538 rows and 26 variables.
}
\source{
National Opinion Research Center, http://gss.norc.org.
}
\usage{
gss2016
}
\description{
The General Social Survey 2016, adopted by Healy (2019) <ISBN 978-0691181622>.
See http://gss.norc.org/Get-Documentation for full
documentation of the variables.
}
\details{
\itemize{
\item year. gss year for this respondent.
\item id. respondent id number.
\item ballot. ballot used for interview.
\item age. age of respondent.
\item childs. number of children.
\item sibs. number of brothers and sisters.
\item degree. Rs highest degree.
\item race. race of respondent.
\item sex. respondent's sex.
\item region. region of interview.
\item income16. total family income.
\item relig. rs religious preference.
\item marital. marital status.
\item padeg. fathers highest degree.
\item madeg. mothers highest degree.
\item partyid. political party affiliation.
\item polviews. think of self as liberal or conservative.
\item happy. general happiness.
\item partners. how many sex partners r had in last year.
\item grass. should marijuana be made legal.
\item zodiac. respondents astrological sign.
\item pres12. raw variable for whether the Respondent voted for
Obama. Recoded to obama in this dataset.
\item wtssall. weight variable.
\item income_rc. Recoded income variable.
\item agegrp. Age variable recoded into age categories
\item ageq. Age recoded into quartiles.
\item siblings. Top-coded sibs variable.
\item kids. Top-coded childs variable.
\item bigregion. Region variable (Census divisions) recoded to four Census regions.
\item religion. relig variable recoded to six categories.
\item partners_rc. partners variable recoded to five categories.
\item obama. Respondent says the voted for Obama in 2012. 1 = yes;
0 = all other non-design options (Romney, other candidate, did not
vote, refused, etc.)
}
}
\keyword{datasets}
