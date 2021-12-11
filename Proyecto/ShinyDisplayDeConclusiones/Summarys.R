library("readxl")
library("writexl")
library("ggplot2")

data <- read_excel("DatosParaMostrar/DataProcesado.xlsx")
aceptados <- data[data$STATE == TRUE,]
denegados <- data[data$STATE == FALSE,]

summary(data$AMT_CREDIT)
filtro = data$NAME_INCOME_TYPE == "Commercial associate"
variable = data[filtro,]
summary(variable$AMT_CREDIT)
filtro = data$NAME_INCOME_TYPE == "Pensioner"
variable = data[filtro,]
summary(variable$AMT_CREDIT)
filtro = data$NAME_INCOME_TYPE == "State servant"
variable = data[filtro,]
summary(variable$AMT_CREDIT)
filtro = data$NAME_INCOME_TYPE == "Unemployed"
variable = data[filtro,]
summary(variable$AMT_CREDIT)
filtro = data$NAME_INCOME_TYPE == "Working"
variable = data[filtro,]
summary(variable$AMT_CREDIT)
