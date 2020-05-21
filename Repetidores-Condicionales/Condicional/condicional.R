#---------------
#       If
#---------------

## Modo Reducido

a = c(runif(5,40,64))
ifelse(a>45,"si","no")

### Comprobar pares
a = round(runif(5,2,10),0) 
b = c(2,4,6,8)
c = c(1,3,5,7)

ifelse(a%%2==0,b,c)

### Usando libreria
install.packages("dplyr")

require(dplyr)
a = c(10,5,9,5,NA) # n=5
b = c(2,4,6,8,10) # n=5 --> numeric
c = c(1,3,5,7,9) # n=5 --> numeric
dplyr::if_else(a%%2==0,b,c,missing=11)


## Modo Completo

objeto <- sample(1:8,size=1)

if (objeto < 8){
    # si es TRUE
    print("trozo de código a")
}else{
    # si es FALSE
    print("trozo de código b")
}

### Ejemplo

a = sample(2:20,5, replace=F)
b = sample(2:20,5, replace=T)

for (i in a){
    for (j in b){
        if ((j == i) & (j%%2 == 0)){ 1
            lb = "es par e igual a j"
            print(paste(j,lb,sep=" -> "))
        }
    }
}



#---------------
#       Switch
#---------------


marca <- readline("ingrese marca > ") # permite escribir en consola
switch(marca,
    "ayc"=print(paste("disponible, marca",marca,sep=" -> ")),
    "sold"=print(paste("disponible, marca",marca,sep=" -> ")),
    "lilo"=print(paste("disponible, marca",marca,sep=" -> ")),
    "mrc"=print(paste("disponible, marca",marca,sep=" -> ")),
    print("no disponible")  # este es el default
)



#---------------
#       which
#---------------

## which(x, arr.ind, useNames)

a <- c(2,5,4,2,4)
which(a==2)

mat <- matrix(data = c(
                    4, 5, 0,
                    5, 8, 0,
                    3, 6, 1), nrow = 3, ncol = 3, byrow = TRUE)
rownames(mat) = c("c1","c2","c3")
colnames(mat) = c("f1","f2","f3")

which(mat<2,useNames = T,arr.ind = T)











