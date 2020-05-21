# funcion simple
Clase <- function(a){
      tmp = log(a)/2
      return(tmp)
  }
#-------------
Clase() # error de argumento

Clase(a = 5)
Clase(a = 0)

#---- funcion probar suerte
suerte <- function(valor, intentos){
    tmp = sample(1:10,size = intentos, replace = F)
    for (i in seq_along(tmp)){
      if (tmp[i] == valor ){
        return(print(" --> valor encontrado") )
      }
    }
    return(print("intentelo nuevamente"))
  }
#-------------------------------------->
#
suerte(valor = 2, intentos = 4)
suerte(valor = 6, intentos = 4)

#-----------------------------
#      errores
#-----------------------------
suerte <- function(valor, intentos,){
#--------------------------------
#--------------------------------



#----> multiconvertidor
convert <- function(dt, tipo="factor"){
    if (! is.null(dt)){
        switch(tipo,
            "vector"= {
                return(as.vector(dt))
            },
            "factor"= {
                return(as.factor(dt))
            },
            "list"= {
                return(as.list(dt))
            },
            "matrix"= {
                return(as.matrix(dt))
            },
            "raw"= {
                return(as.raw(dt))
            },
            "data.frame"= {
                return(as.data.frame(dt))
            },
            print("tipo no existe")
          
           )
    
    }else{
        warning("Verifique si no esta vacio")
    }
  }