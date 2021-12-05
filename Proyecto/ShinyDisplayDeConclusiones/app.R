#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#    https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/
#

library("readxl")
library("writexl")
library("ggplot2")

data <- read_excel("DatosParaMostrar/DataProcesado.xlsx")
aceptados <- data[data$STATE == TRUE,]
denegados <- data[data$STATE == FALSE,]

# Define UI for application that draws a histogram
library(shiny)

ui <- fluidPage(
  titlePanel("Basic widgets"),
  actionButton("tiposCantidad", "Tipos de trabajo con cantidad solicitada"),
  actionButton("aIteracionesCantidad", "Aceptados en cada iteracion con cantidad solicitada"),
)

server <- function(input, output) {
  
  output$tiposCantidad <- renderPlot({
    ggplot(data,aes(x=NAME_EDUCATION_TYPE,y=AMT_CREDIT))+geom_boxplot()
  })
  observeEvent(
    input$tiposCantidad, {
      showModal(modalDialog(
        plotOutput("tiposCantidad"),
        footer = NULL,
        easyClose = TRUE
      ))
  })
  
  
  output$aIteracionesCantidad <- renderPlot({
    ggplot(aceptados,aes(x=ITERATION,y=AMT_CREDIT))+geom_boxplot()
  })
  observeEvent(
    input$aIteracionesCantidad, {
      showModal(modalDialog(
        plotOutput("aIteracionesCantidad"),
        footer = NULL,
        easyClose = TRUE
      ))
    })
}

shinyApp(ui, server)

# Run the application 
shinyApp(ui = ui, server = server)

