texto <- "texto en minúscula"

estado <- c("enojado", "feliz", "enojado", "molesto",
              "enojado", "enojado", "feliz", "mo@esto",
              "feliz",  "molesto", "feliz", "fe@iz")

correos <- c("mrr@gmail.com","12asa@hotmail.com",
               "5ftds@hotmail.com","H23@gmail.com",
               "qqw2@gmx.com","we222@gmx.com")
							
lb <- paste0("Es malo estar aqui y bien.
¿Usted es el malo?.
Muchos lo dicen aqui y estoy bien ...")

## ejemplo 1
casefold(texto,upper = T)  # igual a -> toupper(texto)
casefold(texto,upper = F)  # igual a -> tolower(texto)


## ejemplo 2
grepl(pattern = "@gmx",ignore.case = T,x = correos)

gsub(pattern = "@gmx",replacement = "@hotmail",x = correos,
     ignore.case = T)

chartr(old = "t",new = "T",x = texto) # cambia un carácter


## ejemplo 3
substr(x = texto,start = 10,stop = 18)
chartr(old = "m",new = "M",x = texto)
#----
grep(pattern = "@gmail",x = correos)
correos[grep(pattern = "@gmail",x = correos)]


## ejemplo 4
strsplit(x = estado,split = "e", fixed = T)


## ejemplo 5
regexpr(pattern = "minús",ignore.case = T,text = texto)


#----------------------------------------
#           librerias importantes
#----------------------------------------
install.packages("stringr")
install.packages("stringi")
install.packages("tokenizers")
install.packages("tidyverse",dependencies = T)
install.packages("cleanNLP")

library(tidyverse)
library(stringr)
library(stringi)
library(tokenizers)
library(cleanNLP)


## ejemplo 6 libreria stringr
str_count(string = correos)
str_count(string = correos,pattern = "hotmail")
str_subset(string = correos,pattern = "hot")

#### observar en html
install.packages("htmlwidgets")
#### library(htmlwidgets)

str_view(string = correos,pattern = "hotmail")


## ejemplo 7 libreria stringi
correos %stri<% "b"
stri_stats_general(str = texto)
stri_stats_latex(str = texto)


## ejemplo 8 libreria tokenizers
tokenize_words(x = lb)

### ejemplo 9 
library(tibble)

a <- tokenize_words(x = lb)
b <- table(a[[1]])
tibble(letras = names(b),repetido = as.numeric(b))



## ejemplo 10
count_words(x = lb)
count_sentences(x = lb)
count_characters(x = lb)



## ejemplo 11
### es necesario instalar python 
### pip install cleanNLP

cnlp_init_stringi(locale="es_ES")
cnlp_init_udpipe(model_name="spanish")
cnlp_init_spacy(model_name="es") # pip install cleanNLP

cnlp_init_corenlp(lang="es")

###--- ejemplo
cnlp_annotate(input = lb)















