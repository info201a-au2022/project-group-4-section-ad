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
  
  #imports theme
  thematic_shiny()
  
  #list of hours in ascending order
  hours_ascending <- list("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", 
                       "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                       "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                       "21:00", "22:00", "23:00")

  #creates heatmap for gym traffic based on user selected date  
  output$heatmap <- renderPlot({
    
    #dataframe containing attendance data for selected date in 2016
    heatdata2 <- gym_data %>%
      mutate(
        date = as.Date(date),
        new_date = date %m+% years(6)
      ) %>%
      filter(new_date == input$userdate) %>%
      group_by(hour) %>%
      summarise(
        number_people = max(number_people)
      ) %>%
      mutate(
        hour = paste0(hour, ":00")
      )
    
    #dataframe containing attendance data for selected date in 2015, averages attendence
    #with that of the same date in 2016
    heatdata <- gym_data %>%
      mutate(
        date = as.Date(date),
        day = weekdays(as.Date(date)),
        new_date = date %m+% years(7)
      ) %>%
      filter(new_date == input$userdate) %>%
      group_by(hour) %>%
      summarise(
        number_people = max(number_people)
      ) %>%
      mutate(
        hour = paste0(hour, ":00")
      ) %>% 
      full_join(heatdata2) %>%
      group_by(hour) %>%
      summarise(
        number_people = mean(number_people)
      )
    
    #reorders heatmap x axis data into ascending hour order
    heatdata$hour <- factor(heatdata$hour, levels = hours_ascending)

    #plots heatmap of predicted attendence throughout selected day based on 2016-2017 data
    heatmap <- ggplot(heatdata) +
      geom_tile(mapping = aes(x = hour, y = 1, fill = number_people, color = "black")) + 
      guides(color = FALSE) + 
      labs(fill = "Foot Traffic") + 
      xlab("Time") +
      theme(axis.title.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.x = element_blank()) + 
      scale_fill_gradient(low = "orange", high = "red")
    heatmap
  })
  
#only shows barchart with heatmap elements for gym traffic between user selected times
  output$selectheatmap <- renderPlot({
    
    #takes indicated times as integers
    early = as.integer(substring(input$early, 1, nchar(input$early)-3))
    late = as.integer(substring(input$late, 1, nchar(input$late)-3))
    
    #dataframe containing attendance data for selected date/time in 2016
    heatdata2 <- gym_data %>%
      mutate(
        date = as.Date(date),
        new_date = date %m+% years(6)
      ) %>%
      filter(new_date == input$userdate, hour > early, hour < late) %>%
      group_by(hour) %>%
      summarise(
        number_people = max(number_people)
      ) %>%
      mutate(
        hour = paste0(hour, ":00")
      )
    
    #dataframe containing attendance data for selected date/time in 2015
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
      full_join(heatdata2) %>%
      group_by(hour) %>%
      summarise(
        number_people = mean(number_people)
      )
    
    #reorders barchart x axis data into ascending hour order
    heatdata$hour <- factor(heatdata$hour, levels = hours_ascending)
    
    #plots bargraph of predicted attendence throughout indicated times on selected day based on 2016-2017 data
    heatbar <- ggplot(heatdata) +
      geom_bar(mapping = aes(x = hour, y = number_people, fill = number_people, color = "black"), stat = "identity") + 
      guides(color = FALSE) +
      xlab("Time") +
      ylab("Number of People") +
      labs(fill = "Foot Traffic") +
      scale_fill_gradient(low = "orange", high = "red")
    heatbar
  })
  
  #interactive 2
  
  test123 <- unique(gym_data$number_people)
  
  test321 <- gym_data %>%
    select(is_holiday:is_weekend, -temperature) %>%
    names() 
  
  output$barchart <- renderPlot({
    data = gym_data %>%
      filter(number_people %in% input$selects) %>%
      select(one_of(c("number_people", input$selects2))) %>%
      gather(is_holiday, is_weekend, -number_people)
    
    ggplot(data = data, aes(x = input$selects, y= input$selects2)) + 
      geom_bar(aes(group = input$selects2, fill = input$selects2), stat = "identity", color = "light blue")
  })
  
  #interactive 3
  output$scatterplot3 <- renderPlot({
    plot(gym_data$number_people, gym_data$temperature)
  })
  
  output$info <- renderText({
    xy_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("x=", round(e$x, 1), " y=", round(e$y, 1), "\n")
    }
    xy_range_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("xmin=", round(e$xmin, 1), " xmax=", round(e$xmax, 1),
             " ymin=", round(e$ymin, 1), " ymax=", round(e$ymax, 1))
    }
    
    paste0(
      "click: ", xy_str(input$plot_click),
      "dblclick: ", xy_str(input$plot_dblclick),
      "hover: ", xy_str(input$plot_hover),
      "brush: ", xy_range_str(input$plot_brush)
    )
  })
  
  #Renders home banner image
  output$home_pic <- renderImage({
    list(src = "www/banner2.png", width = "100%", height = 370)
  }, deleteFile = F)
}