library("readxl")
library("writexl")
library("ggplot2")
library("hrbrthemes")

data <- read_excel("XLSX/DatosLimpios.xlsx")

summary(data$AMT_ANNUITY)
summary(data$AMT_CREDIT)

data = data[c("AMT_CREDIT","AMT_ANNUITY")]
colnames(data) <- c("CREDITO","PAGOS_ANUALES")

data$CREDITO_N = 
data$ANUALES_N = 
  
boxplot(data$AMT_ANNUITY)
boxplot(data$AMT_CREDIT)

p3 <- ggplot(data, aes(x=AMT_ANNUITY, y=AMT_CREDIT)) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_ipsum()
p3
