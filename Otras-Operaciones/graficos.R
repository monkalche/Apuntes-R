#------------------
# graficos
#------------------
install.packages("ggrepel") # ggplot2 comp.
install.packages("wordcloud2")
install.packages("webshot")
install.packages("ggplot2")
install.packages("plotly")
webshot::install_phantomjs()

## Wordcloud
library(webshot) #sirve para generar html
library(wordcloud2)
library(tokenizers)