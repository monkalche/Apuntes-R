#----------------------------------------
#           Creando Objetos
#----------------------------------------
variable <- c(1,2,3) #simbolo 1
variable = c(1,2,3) #simbolo 2
assign("variable",c(1,2,3)) # otra forma

## Nombres invalidos
%datos <- c(1,2,3)
datos% <- c(1,2,3)
98datos <- c(1,2,3)
_datos <- c(1,2,3)

## tipos de datos (elementos)
a <- c(FALSE,2,3,5.2)
b <- c("es string")
class(a)
typeof(a)
length(a)
attributes(a)
mode(a)

## Clases de objetos
vector(mode="complex", length=10) #modo vista
 

### Factor
etiqueta <- c("Nada Satisfecho","Poco Satisfecho","Satisfecho","Muy Satisfecho")
db <- c(3, 4, 2, 1, 4, 2, 3, 4, 2, 1, 4 ,2,
        1, 4, 1, 1, 1, 4, 1, 4, 1, 1, 1, 4,
        1, 3, 1, 1, 3, 4, 4, 3, 4, 3, 4, 1)
liker <- factor(x = db ,levels = c(1:4),labels = etiqueta )
#- ver objeto
liker
summary(liker) #--> cantidad
prop.table(summary.factor(liker)) #--> proporcion


### Matrix
mt <- matrix(data= 1:16, nrow = 4, ncol = 4)
mt

mt <- matrix( data = 1:16, nrow = 9, ncol = 2) #--> genera advertencia
mt # observa la repetición

#### matrix -- byrow
mt <- matrix(data = 1:9, nrow = 3, ncol = 3, byrow = F)
mt # ver
mt <- matrix(data = 1:9, nrow = 3, ncol = 3, byrow = T)
mt # ver

#### cambiar nombres 
mt <- matrix(c(1:6),nrow=3,ncol=2)

#       forma 1
dimnames(mt) <- list(c("f1","f2","f3"), c("c1","c2") )
mt

#       forma 2
rownames(mt) <- c("f1","f2","f3") # por filas
colnames(mt) <- c("c1","c2")   # por columnas
mt


## Data.Frame
x1 = c(letters[1:8]); x2 <- c(1:8)
x3 <- factor(x = c(4,2,4,1,2,1,4,4), levels = c(1:4), labels = c("Nada Satisfecho","Poco Satisfecho","Satisfecho","Muy Satisfecho") )
b <- matrix(data = c(1:16),nrow = 8,ncol = 2)

### usar objeto como nombre de filas  
tb <- data.frame("lb"= x1, "a" = x2, "b" = x3, "c"= b,
        row.names = 1 ) #--> x1
View(tb) #-- ver 

tb <- data.frame("lb"= x1, "a" = x2, "b" = x3, "c"= b,
        row.names = 5) # --> b
View(tb)


## List

x1 = c(letters[1:8])
x2 <- c(1:8)
# factor
x3 <- factor(x = c(4,2,4,1,2,1,4,4), levels = c(1:4),labels = c("Nada Satisfecho","Poco Satisfecho", "Satisfecho", "Muy Satisfecho") )
# data.frame
tb <- data.frame("lb"= x1, "a" = x2)
# matrix
mt <- matrix(data= 1:9, nrow=3, ncol= 3, byrow=T)

lista <- list(x2,x3,tb, mt, summary(x3)) # crea la lista 
lista # ver

#---- ver por objeto
#   [[1]] -> x2
#   [[2]] -> x3
#   [[3]] -> tb
#   [[4]] -> summary(x3)
lista[[1]] 


## Ordenar elementos de un Objeto
datos <- c(5,6,3,4,1)
ordenado <- sort(datos) # sort 
ordenado


### funciones que generan Valores Aleatorios
v1 <- c(1:5)
v1

v2 <- seq(1,10,2)
v2

v3 <- rep(letters[2],5)
v3

tmp <- c(4,2)
v4 <- sequence(tmp)
v4

v5 <- runif(6,1,5)
v5

v6 <- sample(1:20,5,replace = T)
v6



#----------------------------------------
#           Editando Objetos
#----------------------------------------

##  OBJETOS de 1 dimensión

datos <- c(5,4,7,8,12,3)
datos[1] # seleccion de elementos

datos[c(1,3)] = c(3,5) # modificando por índice
datos

datos[c(2,4,5)] = c(22,24,14)
datos

##  OBJETOS de 2 dimensiones

mat <- matrix(data= c(1,0,0,
                      0,1,0,
                      0,0,1), ncol = 3 )

mat[1,1]
mat[2,2]#fila 2 y columna 2
mat[3,3]

### -- modificando por índice
mat[1,1] <- 4
mat[2,2] <- 3
mat[3,3] <- 5
mat

###  -- modificar un data.frame
cl <- c(2,2,2,2)
fl <- c(1,1,12)
#------------------
tb <- data.frame("x"= sample(20:60, 4, replace = F), "y"= round(runif(4,min = 10,max = 20),2) ) 

#### agregar por columna
tb <- cbind(tb,cl)
tb

#### agregar por fila
tb <- rbind(tb,fl)
tb

### ver atributos del data.frame
attributes(tb) # usar attributes(tb)$names para ver nombres


#-----------------
# usar libreria para data.table
#-----------------
install.packages("data.table") # instalar
library(data.table)  # importar 

###  crear data
cl <- rep(2,15)
fl <- c(1,1,"nada")
f <- factor(x = sample(1:4,15,replace=T), levels = c(1:4), labels = c("nada","poco","medio","alto") )
tb <- data.frame("x"= sample(20:60,15,replace = F),"y"= runif(15,min = 10,max = 20), "f"= f )
tb <- cbind(tb,cl)
tb <- rbind(tb,fl)

#### convertir a data.table
tabla <- as.data.table(tb)

##### Extraer elementos por filas
tabla[1:4,]
tabla[y<11,] # restringir elementos
tabla[x%like%29] # restringir usando like
tabla[y%between%c(11,12)] # restringir elementos entre (a y b)
 
##### Extraer elementos por columnas
tabla[, c(1,3)] # mediante índice
tabla[, .(x,f)] # mediante objeto

setorder(x = tabla,x,y ) # ordenar por ascendente(+) y descendente(-) 
tabla



#----------------------------------------
#           Eliminando Objetos
#----------------------------------------

### elimina el objeto variable
rm(variable)
variable # verificar existencia

rm(a, b, c, mat, df) # eliminar en grupo

### elimina un elemento del objeto
a <- c(1:4)
a <- a[-3] #[-n]
a
a <- a[ -c(1,2)]#-c()
a


### eliminar columnas y filas de un data.frame
dt = data.frame("h1" = c(runif(5,40,64)),"h2" = c(sample(2:25,size = 5)) )
dt[-c(1,4),] # eliminar n = -1, -4
dt <- dt[-c(1,4),] # almacenar en dt
dt

dt$h1 <- NULL
dt




### eliminar en su totalidad los objetos creados
rm(list = ls() ) 
