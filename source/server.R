source("chart_1.R")
source("chart_2.R")
source("chart_3.R")
library(ggplot2)
library(dplyr)

server <- function(input, output) {
  output$heatmap <- renderPlot{(
    heatmap <- average_people_chart
    heatmap
  )}
}