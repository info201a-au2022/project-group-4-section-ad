library(rsconnect)
library(dplyr)
library(ggplot2)
library(shiny)
library(reshape2)
library(tidyverse)
library(data.table)
library(mapdata)
library(ggmap)
library(maps)
library(viridis)
library(DT)
library(plotly)
library(gganimate)
library(gifski)
library(shinycssloaders)
library(thematic)

gym_data <- read.csv("data.csv") 

server <- function(input, output) {
  thematic_shiny()
#creates heatmap for gym traffic based on user selected date  
  output$heatmap <- renderPlot({
    heatdata <- gym_data %>%
      mutate(
        date = as.Date(date),
        day = weekdays(as.Date(date)),
        new_date = date %m+% years(7)
      ) %>%
      filter(new_date == input$userdate) %>%
      mutate(
        hour = paste0(hour, ":00")
      ) %>%
      rename("Time" = "hour")
    heatdata$Time <- factor(heatdata$Time, levels = c("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", 
                                                      "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                                                      "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                                                      "21:00", "22:00", "23:00", "24:00"))
    heatmap <- ggplot(heatdata) +
      geom_tile(mapping = aes(x = Time, y = 1, fill = number_people, color = "black")) + 
      guides(color = FALSE) + 
      theme(axis.title.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.x = element_blank()) + 
      scale_fill_gradient(low = "orange", high = "red")
    heatmap
  })
#only shows heatmap for gym traffic between user selected times
  output$selectheatmap <- renderPlot({
    early = as.integer(substring(input$early, 1, nchar(input$early)-3))
    late = as.integer(substring(input$late, 1, nchar(input$late)-3))
    heatdata <- gym_data %>%
      mutate(
        date = as.Date(date),
        day = weekdays(as.Date(date)),
        new_date = date %m+% years(7)
      ) %>%
      filter(new_date == input$userdate, hour > early, hour < late) %>%
      mutate(
        hour = paste0(hour, ":00")
      ) %>%
      rename("Time" = "hour")
    heatdata$Time <- factor(heatdata$Time, levels = c("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", 
                                                      "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                                                      "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                                                      "21:00", "22:00", "23:00", "24:00"))
    heatmap <- ggplot(heatdata) +
      geom_tile(mapping = aes(x = Time, y = 1, fill = number_people, color = "black")) + 
      guides(color = FALSE) + 
      theme(axis.title.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.x = element_blank()) + 
      scale_fill_gradient(low = "orange", high = "red")
    heatmap
  })
  
  
  #scatterplot
  output$scatterplot <- renderPlot({
    plot_scatter <- scatterplot
    plot_scatter
  })
  
  output$scatterplot2 <- renderPlot({
    plot_scatter2 <- temp_variance_plot
    plot_scatter2
  })
  
  output$home_pic <- renderImage({
    list(src = "www/photo.jpg", width = "50%", height = 330)
  }, deleteFile = F)
}