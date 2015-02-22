# ggplot learning script
# ramakanth Reddy Pallavali --Rpallavali@email.arizona.edu
# February 22 2015
install.packages("ggplot2",dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

#built in Dataset
head(iris)
#reshape and plyr are the swiss army knife of R

# load the libraries every time you run the script

library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")


myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))

summary(myplot)

#----------------------
# option1
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
myplot + geom_point()


#or

# option2
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point()

myplot

#----------------------

# ggplot is  MUCH BETTER THAN qplot


# remove the data and x and y labels 
#which it will take it by default and can set the color
myplot <- ggplot( iris, aes(Sepal.Length, Sepal.Width, color = Species))+
  geom_point(size = 6)

myplot

myplot <- ggplot( iris, aes(Sepal.Length, Sepal.Width, color = Species))+
  geom_point(aes(shape = Species), size = 4)

myplot

###########Different data set -- Diamond dataset
dim(diamonds) #-- diamensions of diamond dataset which gives rows and columns
dim(diamonds)[1] #-- [1] gives no of rows

sample[1: dim(diamonds)[1],1000] # gives 1000 samples 

diamonds[sample[1: dim(diamonds)[1],1000],  ] # , says that these are the rows

d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
d2
# d2 will become the source for the diamond plot
diamondplot <- ggplot( d2, aes(carat,price, color = color)) + geom_point(size = 4)
diamondplot


# stats

#statistcal information 

library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()


#

# lattice points

#facet grid

ggplot( iris, aes(Sepal.Length, Sepal.Width, color = Species))+
  geom_point(size = 3) +
  facet_grid(Species ~ .)


ggplot( iris, aes(Sepal.Length, Sepal.Width, color = Species))+
  geom_point(size = 3) +
  facet_grid( . ~ Species)

#facet_wrap wraps all the graphs in a single graph

ggplot( iris, aes(Sepal.Length, Sepal.Width, color = Species))+
  geom_point(size = 3) +
  facet_wrap( ~ Species)

# RcolorBrewer palette
library("reshape2")

df  <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")

#manual color scale

# to pick colors 
# go to website  I want hue



