2+5
log(10)
exp(2)
help(exp)
?exp
a <- 20
a
c(10,20,30)
a <- c(10,20,30)
a
a[1]
a[2]
log(10)
log(a)
a*2
c(1,2,3,4,5)
c(1,2,3,4,5)
1:5
seq(1,5)
?seq
1:10
1:20
1:20
a <- c(10, 20, 30, 40, 50)
a
a[1]
a[3]
a[1:3]
mean(c(1,2,5))
a <- c(1:100)
a <- 1:100
a
m=sum(a)/length(a)
m=mean(a)
m
mean(a)
course <- list("CPSC", 375, FALSE)
course
course[]
course[1]
course[2]
course <- list(dept="CPSC", number=375, required=FALSE)
course
list[1]
course[1]
course$dept
course["dept"]
data.frame(localisation = c(“proximal",“distal“, “proximal”), tumorsize = c(6.3,8.0, 10.0), progress=c(FALSE,TRUE,FALSE))
data.frame(localisation = c("proximal","distal", "proximal"), tumorsize = c(6.3,8.0, 10.0), progress=c(FALSE,TRUE,FALSE))
df <- data.frame(localisation = c("proximal","distal", "proximal"), tumorsize = c(6.3,8.0, 10.0), progress=c(FALSE,TRUE,FALSE))
df
df[2,2]
df[2,"tumorsize"]
df[2,2]
df[2,2]
df
df[2,]
df[2]
df[, 3]
df$progress
df
df[ , 3]
# first 2 rows, 3rd column
df[ seq(2,3), 3]
df[ seq(1,2), 3]
df[ 1:2, 3]

c(10, 20, 30, 40, 45, 56, 74, 23, 200)
mydata <- c(10, 20, 30, 40, 45, 56, 74, 23, 200)
mydata[3]
mydata[3:5]
mydata[c(3,5)]
mydata > 50
mydata[mydata > 50]
mydata[c(6,7,9)]
which(mydata > 50)
iris
View(iris)
str(iris)
iris["Sepal.Length"]
iris[, "Sepal.Length"]
iris[, 1]
mean(iris[,1])
mean(iris[,"Sepal.Length"])
iris[which(iris[,1]> 7.6),]
iris[which(iris[,1]> 7.6),]
iris$Sepal.Length > 7.6
iris[iris$Sepal.Length > 7.6, ]
which(iris[,1] > 7.6)
which(iris$Sepal.Length > 7.6)
which(iris[,"Sepal.Length"] > 7.6)
