summary(iris)
View(airquality)
is.na(c(1,2,3,NA,5))
c(1,"a")
c(1,TRUE)
as.numeric(TRUE)
as.numeric(c(TRUE, FALSE))
#get the NAs in airquality$Ozone
is.na(airquality$Ozone)
#get the number of NAs in airquality$Ozone
sum(is.na(airquality$Ozone))

# from February 8:
library(ggplot2)
c(36, 42, 100, 28, 17, 12, 9, 4, 1)
x <- c(36, 42, 100, 28, 17, 12, 9, 4, 1)
x
sort(x)
median(x)
quantile(x)
36-9
IQR(x)
36 + 1.5*IQR(x)
9 - 1.5*IQR(x)
data.frame(num=x)
mydata <- data.frame(num=x)
ggplot(data=mydata) + geom_boxplot(mapping = aes(y=num))
ggplot(data=airquality) + geom_boxplot(mapping = aes(x=Ozone))
sort(airquality$Ozone)
ggplot(data=iris) + geom_boxplot(mapping=aes(y=Sepal.Width, x=Species))
str(iris)
class(iris$Species)
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class, fill=drv))
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class, fill=drv), position = "dodge")
str(airquality)
help("airquality")
airquality
ncol(airquality)
