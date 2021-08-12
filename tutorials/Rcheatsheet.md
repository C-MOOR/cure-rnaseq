## R cheat sheet

Here is a reminder of some basic R commands, for your convenience:

* `head(df)` prints the first few rows of the dataframe named `df`
* `tail(df)` prints the last few rows of the dataframe named `df`
* `summary(df)` prints some summary statistics for each column of the dataframe named `df`, such as min, mean, median, and max for numeric columns
* `log(v)`, `log(v, 10)` if `v` is a vector of numbers, these will return a vector containining the natural log or log10 of the items in `v`
* `plot(x,y)` plots the vector `x` against the vector `y`. Usually this will be a scatterplot, but R will try to guess a sensible plot if you give it data that doesn't fit in a scatter plot

You can "filter" a dataframe (pick out only some of the rows and columns).  Some examples:

* `df$c` finds the column named `c` from at dataframe named `df` (keeps all rows)
* `filter(df, c>5)` finds all rows where the value in column `c` is greater than 5 (keeps all columns)
* `filter(df, c==5)` finds all rows where the value in column `c` is exactly equal to 5 (keeps all columns)
* `filter(df, c>5 & d<=10)` finds all rows where the value in column `c` is greater than 5 **and** the value in column `d` is less than or equal to 10 (keeps all columns)
* `filter(df, c=="some_name")` finds all rows where the value in column `c` is exactly "some_name"
* `filter(df, str_detect(c, "name"))` finds all rows where the value in column `c` contains "name" (things like "some_name", "other_name", as well as "name")

You can usually combine commands any way you like, using parentheses.  As long as the output of the inner command is appropriate input for the outer command, things will probably work fine.  Some examples:

* `sum(df$c)` finds the sum of the the column named `c` in the dataframe named `df`
* `plot(df$c, df$d)` plots columns of the dataframe named `df`, putting the column named `c` on the x axis and the column named `d` on the y axis

Here are commands for plotting basic histograms in R:

* `hist(v)` is a specialized version of plot, which will generate a histogram of the items in the vector `v`
* `hist(v, breaks=10)` makes a histogram with 10 bars
* `hist(v, breaks=c(5,10,15) )` makes a histogram that splits the data into bins at the points listed in the command.  For this example, the first bar would contain values from 0 to 5; the second bar would contain values from 5 to 10; and the third bar would contain values from 10 to 15.
* `hist(log(v))` plots a histogram of the natural log of the values in the vector named `v`
* `hist(log(v + 0.1))` plots a histogram of the natural log of the values in the vector named `v` + 0.1.  This is useful for plotting data that contains values of zero.

## RStudio Cheatsheets

- [Base R](http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf)
- [Data Visualization](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf) with [ggplot2](https://ggplot2.tidyverse.org)
- [Data Transformation](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf) with [dplyr](https://dplyr.tidyverse.org)
- [R Markdown](https://github.com/rstudio/cheatsheets/raw/master/rmarkdown-2.0.pdf)
- [RStudio IDE](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf)

... plus strings, factors, importing data, and more at [RStudio Cheatsheets](https://www.rstudio.com/resources/cheatsheets/)
