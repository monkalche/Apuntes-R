#-------------------------------
#   librerias
#-------------------------------
install.packages("officer")  # Si aún no has instalado
install.packages("magrittr") # Si aún no has instalado
install.packages("ggplot2")  # Si aún no has instalado
install.packages("plotrix")  # Si aún no has instalado
#-------------------
library(officer)
library(magrittr)
library(ggplot2)
library(plotrix)
#-------------------

#-----------------
directorio <- "D:/reporte/word/" # use otro directorio o dejelo asi | directorio <- ""|
#------------------------------- 
sp <- c(1,1,1,4,4,4,4,4,4,4,3,3,3,3,3,2,
        2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
indicador <- factor(x = sp ,levels = c(1:4),
             labels = c("Nada Satisfecho",
                        "Poco Satisfecho",
                        "Satisfecho",
                        "Muy Satisfecho"))
tab <- as.data.frame(table(indicador))
#------------------------------- 
grafico3 <- ggplot(tab,aes(x="",y=tab$Freq,
                    fill=factor(tab$indicador))) +
  geom_bar(width = 1,stat = "identity") +
  coord_polar("y") +
  geom_text(aes(label = 
                paste(round(Freq/sum(Freq)*100,1),"%")),
                       position=position_stack(vjust = 0.5))+
  theme_void(base_size = 18)+labs(fill="Indicador")
#-------------------------------  
fig <- paste(directorio,"figura.wmf",sep = "")
ggsave(plot = grafico3,filename = fig,device = "wmf",
                                   dpi = 72,limitsize = T)
#-------------------------------  
color <- c("#526189","#f6f6f6","#d3d9e7","#a3acc5")
#-----------
fan <- paste(directorio,"figura2.wmf",sep = "")
win.metafile(file = fan,height = 5,width = 10,
                                        pointsize = 14)
fan.plot(x = tab$Freq,labels=as.character(tab$indicador),
         col = color,ticks = 30)
dev.off()
#-------------------------------
parrafo = " Se ha hecho una investigación en una empresa 
          que cuentra con 32 empleados, cuyo objetivo es 
          saber si estan satisfechos en su desempeño laboral 
          dentro de la empresa:"
#-------------------------------
guardar <- paste(directorio,"archivo.docx",sep="")
docu <- read_docx()
docu <- docu %>%
    body_add_par("Reporte ...",style = "heading 1") %>%
    body_add_par("Satisfacción Laboral",
                             style = "heading 2") %>%
    body_add_par(parrafo,style = "Normal") %>%
    body_add_table(tab,style = "Light List Accent 2") %>%
    body_add_gg(docu, value = grafico3, 
                style = "centered",width=5,height=5) %>%
    body_add_par(value = "Grafico Pie", 
                            style = "graphic title") %>%
    body_add_par("",style = "Normal") %>% #-- nueva linea --
    body_add_par(parrafo,style = "Normal") %>%
    body_add_par("Amabilidad en su atención",
                                style = "heading 2") %>%
    body_add_img(src = fan,height = 3,
                            width = 6,pos = "after"  )%>%
    body_add_par(value = "Grafico abanico", 
                             style = "graphic title") %>%
    body_add_par("",style = "Normal") %>% #-- nueva linea --
    body_add_par(parrafo,style = "Normal") %>%
    body_add_par("Representación personal",
                                    style = "heading 2")
print(docu,target = guardar )  