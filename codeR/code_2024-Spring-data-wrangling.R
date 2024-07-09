library(tidyverse)
?mpg
str(mpg)
filter(mpg, cty > 27)
filter(mpg, cty > 27, hwy > 30)
filter(mpg, cty > 27, hwy > 30)
filter(mpg, cty > 27 | hwy > 30)
filter(mpg, manufacturer == "honda")
filter(mpg, manufacturer == "honda", manufacturer == "toyota")
filter(mpg, manufacturer == "honda"| manufacturer == "toyota")
filter(mpg, manufacturer %in% c("honda","toyota"))
select(mpg, manufacturer)
select(mpg, manufacturer, model)
select(mpg, 1,3,4)
select(mpg, 1:4)
select(mpg, -manufacturer)
select(mpg, -manufacturer, -model)
select(mpg, starts_with("m"))
select(filter(mpg, cty > 25), manufacturer, model)
mpg %>% filter(cty > 25) %>% select(manufacturer, model)
select(filter(iris, Petal.Length > 3.0, Petal.Width > 1.0), Sepal.Length, Sepal.Width)
filter(iris, Petal.Length > 3.0, Petal.Width > 1.0) %>% select(Sepal.Length, Sepal.Width)
iris %>% filter(Petal.Length > 3.0, Petal.Width > 1.0) %>% select(Sepal.Length, Sepal.Width)
iris  %>% select(Sepal.Length, Sepal.Width)%>% filter(Petal.Length > 3.0, Petal.Width > 1.0)

# arrange
mpg %>% arrange(manufacturer)
mpg %>% arrange(cty)
mpg %>% arrange(-cty)
mpg %>% arrange(desc(cty))
mpg %>% arrange(cty, manufacturer)
mpg %>% select(cty, manufacturer) %>% arrange(cty)
mpg  %>% arrange(cty)%>% select(cty, manufacturer)
mpg %>% select(cty, manufacturer, hwy) %>% arrange(cty)

# mutate
mpg %>% mutate((cty+hwy)/2) %>% View()
mpg %>% mutate(mileage = (cty+hwy)/2) %>% View()

# summarise
mpg %>% summarise(mean(cty))
mpg %>% mean(cty)
mpg %>% summarise(mean(cty))
mpg %>% summarise(mean(cty), min(cty), max(cty))
mpg %>% summarise(meanCty=mean(cty), minCty = min(cty), maxCty = max(cty))

# group_by + summarise
mpg %>% View()
mpg %>% group_by(manufacturer) %>% View()
mpg %>% group_by(manufacturer) %>% summarise(mean(cty)) %>% View()
mpg %>% View()
mpg %>% group_by(manufacturer) %>% summarise(mean(cty)) %>% View()
mpg %>% group_by(year) %>% summarise(mean(cty)) %>% View()
mpg %>% View()
mpg %>% arrange(year) %>% View()
mpg %>% arrange(year) %>% summarise(mean(cty))
mpg %>% group_by(year, manufacturer) %>% summarise(mean(cty)) %>% View()
library(nycflights13)
flights

# slice, top_n

mpg %>% View()
mpg %>% slice(1:5)
mpg %>% slice(seq(1,5))
mpg %>% slice(seq(1,5, by=2))
mpg %>% max(cty)
mpg %>% summarise(max(cty))
mpg %>% arrange(-cty) %>% slice(1)
mpg %>% arrange(-cty) %>% slice(1:2)
mpg %>% top_n(n=2, wt=cty)
mpg %>% group_by(manufacturer) %>% summarise(meanCty=mean(cty)) %>% top_n(wt=meanCty, n=3)
mpg %>% group_by(manufacturer) %>% summarise(meanCty=mean(cty)) %>% top_n(wt=meanCty, n=-3)
mpg %>% group_by(manufacturer) %>% summarise(meanCty=mean(cty)) %>% top_n(wt=-meanCty, n=3)

# joins
band_members
band_instruments
band_members %>% inner_join(band_instruments)
band_members %>% left_join(band_instruments)
band_members %>% right_join(band_instruments)
band_members %>% full_join(band_instruments)
band_members
band_instruments2
band_members %>% inner_join(band_instruments2)
band_members
band_instruments2
band_members %>% inner_join(band_instruments2, by=c(name="artist"))
band_members_4rows
band_instruments_4rows
band_members_4rows %>% semi_join(band_instruments_4rows)
band_members_4rows
band_instruments_4rows
band_members_4rows %>% anti_join(band_instruments_4rows)
band_members %>% inner_join(band_instruments2, by=c(name="artist"))

# pivot_longer
library(tidyverse)
relig_income
relig_income %>% pivot_longer(cols=-religion, names_to= "income", values_to= "freq")
View(relig_income)
relig_income %>% pivot_longer(cols=2:11, names_to= "income", values_to= "freq")
table4a
table4a %>% pivot_longer(cols= -country , names_to="Years" , values_to= "Frequency")
table4a %>% pivot_longer(cols= c(`1999`,`2000`) , names_to="Years" , values_to= "Frequency")
table4a %>% pivot_longer(cols= 2:3 , names_to="Years" , values_to= "Frequency")
table4a %>% pivot_longer(cols= c(2,3) , names_to="Years" , values_to= "Frequency")
table4a %>% pivot_longer(cols= -1 , names_to="Years" , values_to= "Frequency")
grades %>% pivot_longer(cols =3:6, names_to = "Courses", values_to = "GPA", values_drop_na = TRUE)

grades <- tibble(
  CWID=c(1234567, 2356902, 5005667),
  NAME=c("Mary", "Lee", "Elena"),
  CPSC120=c(3,4,NA), 
  CPSC121=c(3.3,3,2), 
  CPSC131=c(3,4,3.7), 
  MATH338=c(3,NA,3.3)
)

grades %>% pivot_longer(cols = c(-CWID, -NAME), names_to = "Courses", values_to = "GPA", values_drop_na = TRUE)
grades %>% pivot_longer(cols = -(1:2), names_to = "Course", values_to = "Grade", values_drop_na = TRUE)
grades %>% pivot_longer(cols = c(CPSC120, CPSC121,CPSC131,MATH338), names_to = "Course", values_to = "Grade", values_drop_na = TRUE)

# pivot_wider() and separate()
table2
table2 %>% pivot_wider(names_from = type, values_from = count)
table3
table3 %>% separate(col=rate, into=c("cases", "population"))
