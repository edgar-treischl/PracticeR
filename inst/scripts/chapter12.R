library(DBI)
library(dplyr, warn.conflicts = FALSE)
library(tibble)

con <- dbConnect(RSQLite::SQLite(), dbname = ":memory:")
dbWriteTable(con, "mtcars", mtcars)
mtcars_sql <- tbl(con, "mtcars")





#Example data
df <- tribble(
  ~ID, ~year, ~income,
  1,   2019, 2000,
  1,   2020, 2200,
  2,   2019, 1977,
  2,   2020, 1977,
  3,   2019, 3500,
  3,   2020, 3000
)

#Create a lag variable 
df |> 
  group_by(ID)|> 
  mutate(income_lag = lag(income))

## #Browse vignettes from a package
## browseVignettes("dplyr")

#Use lubridate to prepare time and date variables
library(lubridate)
x <- lakers$date[1]
x

#`ymd()` convert the integers to year, month, and day
dates <- ymd(x)
dates

#Extract the day of a month
mday(dates)

#Extract month
month(dates)

#Extract years
year(dates)

#An example data preparation step
mtcars |> 
  group_by(cyl) |> 
  summarise(mpg = mean(mpg, na.rm = TRUE)) |> 
  arrange(desc(mpg))

#save the data preparation steps
library(dbplyr)
summary <- mtcars_sql |> 
  group_by(cyl) |> 
  summarise(mpg = mean(mpg, na.rm = TRUE)) |> 
  arrange(desc(mpg))

#inspect the SQL query to manipulate data
summary |> show_query()

#The Titanic data
library(titanic)

#select variables
titanic_df <- titanic::titanic_train |> 
  dplyr::select(Survived, Sex, Age)

#inspect data
head(titanic_df)

#Minimal code to run a logistic regression
logit_model <- glm(Survived ~ Sex, family = binomial(link = 'logit'), 
                   data = titanic_df)

#print a summary
summary(logit_model)

#Inspect odds ratios
logit_model|>
  parameters::parameters(exponentiate = TRUE)

#Inspect marginal effects
library(margins)
summary(margins(logit_model))

## library(gapminder)
## library(ggrepel)
## 
## #Left Plot:
## gapminder %>% filter(year == "2007" & continent == "Europe") %>%
##   ggplot(aes(gdpPercap, lifeExp, label = country)) +
##   geom_point(color = "red")+
##   #geom_text vs. geom_text_repel
##   geom_text(size = 2) +
##   labs(title = "A: geom_text()")
## 
## #Right plot
## gapminder %>% filter(year == "2007" & continent == "Europe") %>%
##   ggplot(aes(gdpPercap, lifeExp, label = country)) +
##   geom_point(color = "red")+
##   coord_cartesian(clip = "off") +
##   #geom_text vs. geom_text_repel
##   geom_text_repel(size = 2) +
##   labs(title = "B: geom_text_repel()")
## 

library(gapminder)
library(ggrepel)

gapminder %>% filter(year == "2007" & continent == "Europe") %>% 
  ggplot(aes(gdpPercap, lifeExp, label = country)) +
  geom_point(color = "red")+
  geom_text(size = 2) + 
  labs(title = "A: geom_text()")

gapminder %>% filter(year == "2007" & continent == "Europe") %>% 
  ggplot(aes(gdpPercap, lifeExp, label = country)) +
  geom_point(color = "red")+
  coord_cartesian(clip = "off") +
  geom_text_repel(size = 2) + 
  labs(title = "B: geom_text_repel()")




#which CSS themes are available. For example:
names(xaringan:::list_css())[1:5]

## #Make sure that pagedown finds the file to convert
## pagedown::chrome_print("template.html")

## #Quarto website: <https://quarto.org/>
