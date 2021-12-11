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
  actionButton("aIteracionesCantidad", "Aceptados en cada iteracion"),
  actionButton("dIteracionesCantidad", "Denegados en cada iteracion"),
  actionButton("piramide", "piramide"),
)

server <- function(input, output) {
  
  output$tiposCantidad <- renderPlot({
    ggplot(data,aes(x=NAME_INCOME_TYPE,y=AMT_CREDIT))+geom_boxplot()
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
    ggplot(aceptados, aes(x=ITERATION, fill=ITERATION )) + 
      geom_bar( ) +
      scale_fill_brewer(palette = "Set1") +
      theme(legend.position="none")
    
  })
  observeEvent(
    input$aIteracionesCantidad, {
      showModal(modalDialog(
        plotOutput("aIteracionesCantidad"),
        footer = NULL,
        easyClose = TRUE
      ))
    })
  
  
  output$dIteracionesCantidad <- renderPlot({
    ggplot(denegados, aes(x=ITERATION, fill=ITERATION )) + 
      geom_bar( ) +
      scale_fill_brewer(palette = "Set1") +
      theme(legend.position="none")
    
  })
  observeEvent(
    input$dIteracionesCantidad, {
      showModal(modalDialog(
        plotOutput("dIteracionesCantidad"),
        footer = NULL,
        easyClose = TRUE
      ))
    })
  
  output$piramide <- renderPlot({
    data <- data.frame(
      var1 = rnorm(aceptados),
      var2 = rnorm(denegados)
    )
    
    # Chart
    ggplot(data, aes(x=x) ) +
      # Top
      geom_density( aes(x = var1, y = ..density..), fill="#69b3a2" ) +
      geom_label( aes(x=4.5, y=0.25, label="variable1"), color="#69b3a2") +
      # Bottom
      geom_density( aes(x = var2, y = -..density..), fill= "#404080") +
      geom_label( aes(x=4.5, y=-0.25, label="variable2"), color="#404080") +
      theme_ipsum() +
      xlab("value of x")
  })
  observeEvent(
    input$piramide, {
      showModal(modalDialog(
        plotOutput("piramide"),
        footer = NULL,
        easyClose = TRUE
      ))
    })
  
  
}



shinyApp(ui, server)

# Run the application 
shinyApp(ui = ui, server = server)

