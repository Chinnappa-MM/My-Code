even_odd <- function(a)
{
    if(a%%2==0){
        print("it is even")
    } else {
        print("it is odd")
    }
}

a <- readline(promt = "Enter a number : ")
a <- as.numeric(a)
even_odd(a)
