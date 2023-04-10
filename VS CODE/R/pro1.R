# even_odd <- function() {
#   a <- readline(prompt = "Enter A Number : ")
#   a <- as.numeric(a)
#   if (a %% 2 == 0) {
#     print("it is even")
#     } else {
#     print("it is odd")
#   }
# }



# b <- readline(prompt = "Enter A Number : ")
# b <- as.numeric(b)
# even_odd()

a<-"D"
a
a<-as.integer(a)
a<- 1:9

b<- rep("a",9)

c<-data.frame(a,b)
View(USArrests)
View(starwars)
install.packages("tidyverse")

library(tidyverse)
update.packages("tidyverse")
