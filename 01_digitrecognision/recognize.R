
setwd("~/repos/mlearning/01_digitrecognision")
# setup:
library(class)

train <- NA
test <- NA
train_samples <- NA

load_data <- function() {
    # read data
    train <<- read.csv("data/train.csv", head=TRUE)
    test <<- read.csv("data/test.csv", head=TRUE)
    # labels of train samples
    cl <<- factor(train$label)
}

classify_image <- function(number) {
    train_samples <<- train
    train_samples$label <- NULL
    res <- knn(train_samples, test[number,], cl, k=10)
    print(res)
}

classify_set <- function(begin, end) {
  train_samples <<- train
  train_samples$label <- NULL
  res <- knn(train_samples, test[begin:end,], cl, k=5)
  print(res)
  res
}

show_image <- function(number) {
    library(lattice)
    print(number)
    levelplot(matrix(test[number,], nrow=28, ncol=28))
}

show_and_classify <- function(number) {
  show_image(number)
  classify_image(number)
}

calc_all <- function() {
#measure time:
load_data()
ptm <- proc.time()
tmp_res <- classify_set(1,10)
proc.time() - ptm

# process by chunks
res <- c()
for (i in seq(1, 42000, 100))
{
  tmp_res <- classify_set(i, i+99)
  res <- c(res, tmp_res)
  print(i)
}

}


# https://stat.ethz.ch/R-manual/R-devel/library/class/html/knn.html

