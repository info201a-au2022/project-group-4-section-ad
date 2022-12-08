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

gym_data <- read.csv("C:/Users/Phamily/Documents/info201/group project/project-group-7-section-ad/data/data.csv")

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
  output$barchart <- renderPlot({

    #dataframe filtered depending on whether user indicated if it was a holiday and if it was a weekend
    bardata <- gym_data %>%
      mutate(
        date = as.Date(date)
      ) %>%
      filter(if (input$holiday == "Yes") is_holiday == 1 else is_holiday == 0) %>%
      filter(if (input$weekend == "Yes") is_weekend == 1 else is_weekend == 0) %>%
      group_by(hour) %>%
      summarise(
        number_people = mean(number_people)
      ) %>%
      mutate(
        hour = paste0(hour, ":00")
      )

    #reorders barchart x axis data into ascending hour order
    bardata$hour <- factor(bardata$hour, levels = hours_ascending)

    #plots bargraph of average hourly attendance for holiday and weekend data
    bargraph <- ggplot(bardata) +
      geom_bar(mapping = aes(x = hour, y = number_people, fill = number_people), stat = "identity") +
      guides(color = FALSE) +
      xlab("Time") +
      ylab("Number of People") +
      labs(fill = "Foot Traffic") +
      scale_fill_gradient(low = "black", high = "black")
    bargraph
  })

  #interactive 3

  # plots scatter plot of number of people against temperature from the data
  output$scatterplot3 <- renderPlot({
    plot(gym_data$number_people, gym_data$temperature, xlab = "Number of People", ylab = "Temperature")
  })

  # sets up the interactive and the box that shows what the user clicked.
  output$info <- renderText({
    xy_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("Number of people:", round(e$x, 1), "Temperature:", round(e$y, 1), "\n")
    }
    xy_range_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("Lowest people count: ", round(e$xmin, 1), " Highest people count: ", round(e$xmax, 1),
             " Lowest temperature count:", round(e$ymin, 1), " Highest temperature count:", round(e$ymax, 1))
    }
    
    # the output of what the user clicked.
    paste0(
      "click: ", xy_str(input$plot_click),
      "double click: ", xy_str(input$plot_dblclick),
      "hover: ", xy_str(input$plot_hover),
      "brush: ", xy_range_str(input$plot_brush)
    )
  })

  #Renders home banner image
  output$home_pic <- renderImage({
    list(src = "www/banner_sharpened.png", width = "100%", height = 400)
  }, deleteFile = F)

  #Renders takeaway image
  output$pic <- renderImage({
    list(src = "www/pic.jpg", width = 500, height = 370)
  }, deleteFile = F)

}