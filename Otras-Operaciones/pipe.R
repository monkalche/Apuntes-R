#--------- 
#   pipe
#---------

install.packages("magrittr")
library(magrittr)

##---- ejemplo 1
obj <- c(12,14,23,13,26,34,23,36,49,
         22,14,23)
obj %>% matrix(nrow=4,ncol=3) %>%
          -12 %>% max

##---- ejemplo 2
obj %>% sort %T>% sum  -> a
a
# Sin el T
obj %>% sort %T>% sum


##---- ejemplo 3
obj1 <- c(16,18,26,16,30,44,34,48,56,36,23,37)
### ======  Crear data frame  ======
tb <- data.frame("a"=obj,"b"=obj1)
tb %$% cor(a,b)


##---- ejemplo 4
tb %<>% cor %>% round(digits = 3)
tb
