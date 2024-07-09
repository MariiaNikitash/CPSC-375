library(tidyverse)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length))
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2, intercept = 3)
lm(data=iris, formula=Petal.Length~Petal.Width)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2.230, intercept = 1.084, color="red")
m <- lm(data=iris, formula=Petal.Length~Petal.Width)
summary(m)
coef(m)
coef(m)[1]
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = coef(m)[2], intercept = coef(m)[1], color="red")
m <- lm(data=iris, formula=Sepal.Length~Sepal.Width)
summary(m)
residuals(m)
iris %>% mutate(resid=residuals(m)) %>% View()
iris <- iris %>% mutate(resid=residuals(m))
ggplot(data=iris) + geom_histogram(mapping = aes(x=resid))
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=resid))
rstandard(m)
iris %>% mutate(rstd=rstandard(m)) %>% View()
iris %>% mutate(rstd=rstandard(m)) %>% filter(abs(rstd) > 2) %>% View()
irisOutliers <- iris %>% mutate(rstd=rstandard(m)) %>% filter(abs(rstd) > 2)
ggplot(data=iris) + 
  geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) +
  geom_abline(slope = coef(m)[2], intercept = coef(m)[1], color="red") + 
  geom_point(data=irisOutliers, mapping = aes(x=Petal.Width, y=Petal.Length), color="red")

# Thursday (3/14):
library(tidyverse)
m <- lm(data=iris, formula = Petal.Length~Petal.Width)
summary(m)
data.frame(Petal.Witdh=c(0.5, 2.5, 10))
predx <- data.frame(Petal.Witdh=c(0.5, 2.5, 10))
predict(m, predx)
coef(m)
1.083558 +  2.229940*0.5
ggplot(data=iris) + 
  geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) +
  geom_abline(slope = coeffs[2], intercept = coeffs[1], color="red")
predict(m, predx, interval = "prediction")
predict(m, predx, interval = "confidence")

m1 <- lm(data=iris, formula = Petal.Length~Petal.Width)
summary(m1)
m2 <- lm(data=iris, formula = Petal.Length~Petal.Width+Sepal.Width)
summary(m2)
m3 <- lm(data=iris, formula = Petal.Length~Petal.Width+Sepal.Width+Sepal.Length)
summary(m3)
runif(10)
rm(iris)
iris <- iris %>% mutate(nonsense=runif(150))
View(iris)
m4 <- lm(data=iris, formula = Petal.Length~Petal.Width+Sepal.Width+Sepal.Length+nonsense)
summary(m4)
m5 <- lm(data=iris, formula = Petal.Length~Petal.Width+Species)
summary(m5)
summary(m3)
library(modelr)
iris <- iris %>% add_predictions(m5)
ggplot(data=iris) + 
  geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) +
  geom_line(aes(x=Petal.Width, y=pred, color=Species))
