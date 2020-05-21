#-----------------
#           For
#----------------

obj <- sample(40:95, size = 10) ,?
# es recomendable crear un fichero script
for (i in obj){
    print(i)
}


dt <- data.frame("x"=c(sample(1:15,size = 5)), "y"=c(sample(2:25,size = 5)),"z" = sample(30:65,size = 5),
        row.names =c("a","b","c","d","e") )

## a) columna
for (i in 1:ncol(dt) ){ 
    for (j in 1:nrow(dt) ){ # nrow(dt) = dim(dt)[1]
        print(dt[j,i])
    }
}

## b) fila
for(i in 1:nrow(dt) ){ # 1:nrow(dt) = seq_len(dim(dt)[1]) # son equivalentes
    for(j in 1:ncol(dt) ){ # ncol(dt) = dim(dt)[2]
        print(dt[i,j])
    }
}

## c) nombres de filas
for (i in rownames(dt) ){ 
    print(i)
}

## d) ambos
for (i in dt){
    print(lb)
}


#-----------------
#           While
#----------------

a = 1

while(a < 8){
    print( paste("hola", a, sep = "->") )
    a = a+1
}


#-----------------
#           Repeat
#----------------

re = 0

repeat{
    re = re + 1
    if (re == 10){
        break 1
    }else{
        print("hola")
    }
}


