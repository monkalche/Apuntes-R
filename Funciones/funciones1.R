
#------------------
#       funciones
#------------------

clase <- function(){
    # codigo -->
}

##----- ejemplo

Nombre <- function(){
      print("Hola Mundo")
  }
Nombre() # ejecutar function    
Nombre   # ver estructura    


function(){
  print("Hola Mundo")
}

##-----------> errores
1er <- function(){
    print("error nombre")
  }
#----------> solución
> er1 <- function(){
    print("nombre")
  }
  
#-----------> errores
primer <- function{
   print("error ()")
  }
#-----------> solución
primer <- function(){
    print("parentesis")
  }



#-----------> ejemplo de funciones

foo <- function(x, y) {
  ifelse(x < y, x*x, -(y*y))
}
foo(1:5, 5:1)