library(class)
View(iris)
sample(1:10, 3)
sample(1:10, 3)
sample(1:150, 100)
trainindex <- sample(1:150, 100)
trainfeatures <- iris[trainindex, 1:4]
trainlabels <- iris[trainindex, 5]
testfeatures <- iris[-trainindex, 1:4]
testlabels <- iris[-trainindex, 5]
predicted <- knn(train = trainfeatures, test = testfeatures, cl=trainlabels, k=1)
data.frame(testlabels, predicted) %>% View()
table(testlabels, predicted)
x <- c(16, 100, 37, 50)
(x - min(x)) / (max(x) - min(x))
x <- c(1000, 100000, 50000)
(x - min(x)) / (max(x) - min(x))
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
normalize(x)
normalize(c(10, 20, 40))
iris %>% mutate(Sepal.Length.norm=normalize(Sepal.Length)) %>% View()
