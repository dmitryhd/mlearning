
# setup:
install.packages("RWeka", dependencies = TRUE)
library(RWeka)
# read data
train <- read.csv("data/train.csv", head=TRUE)
test <- read.csv("data/test.csv", head=TRUE)

# https://stat.ethz.ch/R-manual/R-devel/library/class/html/knn.html

