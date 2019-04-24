#Exploratory Data Analysis - Week 2 Notes

#Lattice Plotting system in R

#xyplot: main scatterplot function
#bwplot: box and whiskers plot
#histogram
#stripplot: boxplot with actual points
#dotplot: plot dots on "violin" strings
#splom: scatterplot matrix
#levelplot/countour plot: plotting image data

install.packages("lattice")
library(lattice)
library(datasets)

#simple scatterplot

xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))

xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
xyplot(Ozone ~ Wind, data = airquality)

#lattice panel functions

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - F * x + rnorm(100, sd = .5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))

#custom panel function

xyplot(y ~ x | f, panel = function(x,y, ...) {
  panel.xyplot(x,y,...)
  panel.abline(h = median(y), lty = 2)
})

#regression function

xyplot(y ~ x | f, panel = function(x,y,...){
  panel.xyplot(x,y,...)
  panel.lmline(x,y,col = 2)
}
  )

#ggplot2

install.packages("ggplot2")
library(ggplot2)

str(mpg)

qplot(displ, hwy, data = mpg)

#modifying aesthetics

qplot(displ, hwy, data = mpg, color = drv)

#adding a geom

qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

#histogram

qplot(hwy, data = mpg, fill = drv)

#facets

qplot(displ, hwy, data = mpg, facets = .~drv)

qplot(hwy, data = mpg, facets = drv~., binwidth = 2)

#basic components of a ggplot2 plot

#dataframe
#aesthetic mappings
#geoms (points)
#facets: conditional plots
#stats: statistical transformations like binning, quantiles, smoothing
#scales: what scale an aesthetic map uses
#coordinate system

#note about axis limits

testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat(50,2) <- 100
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x=x, y=y))

g + geom_line() + ylim(-3,3)

g+ geom_line() + coord_cartesian(ylim = c(-3,3))














