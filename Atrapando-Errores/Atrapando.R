
#--------------------------
#           TRY
#--------------------------

mat <- c(1,4,2,6,4)
try(mat + "a", silent = FALSE)

try(mat + "a", silent=TRUE)


#---------------------------
#       TRYCATCH
#---------------------------

tryCatch(
    expr = {
        # Operaciones...
        # aquí...
    },
    error = function(e){
        # si hay error
        # ejecutar aquí
    },
    warning = function(w){
        # si hay alarmas
        # ejecutar aquí
    },
    finally = {
        # (Opcional)
        # se ejecutará como final
    }
)


## ejemplo

matrices <- function(matriz_1,matriz_2){
    tryCatch(
        expr = {
            matriz_1 % * % matriz_2
        },
        error = function(e){
            message('--- error de dimensión ---\n')
            print(e)
        },
        warning = function(w){
            message('------------ alarma ------\n')
            print(w)
        },
        finally = {
            message('----- final -----------------')
        }
    )
}
###===========================
a <- matrix(data = c(2,3,6,3,8,7),nrow = 3,ncol = 3)
b <- matrix(data = c(2,3,6,3,8,7,4,6),nrow = 2,ncol = 4)
###--------------
matrices(matriz_1 = a,matriz_2 = b)












