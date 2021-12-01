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

denegados <- read_excel("DatosParaMostrar/Denegados.xlsx")
aceptados <- read_excel("DatosParaMostrar/Aceptados.xlsx")
estudiar <- read_excel("DatosParaMostrar/AEstudiar.xlsx")

# Define UI for application that draws a histogram
library(shiny)

ui <- fluidPage(
  titlePanel("Basic widgets"),
  actionButton("tdt", "Pieplot con tipos de trabajo"),
  actionButton("go", "Pieplot con tipos de trabajo"),
)

server <- function(input, output) {
  
  output$pieplot <- renderPlot({
    pie(table(aceptados$NAME_EDUCATION_TYPE))
  })
  
  observeEvent(
    input$tdt, {
    showModal(modalDialog(
      plotOutput("pieplot"),
      footer = NULL,
      easyClose = TRUE
    ))
  })
}

shinyApp(ui, server)

# Run the application 
shinyApp(ui = ui, server = server)

