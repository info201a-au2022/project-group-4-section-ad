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
library(lubridate)
library(shinycssloaders)
library(thematic)

source("chart_1.R")
source("chart_2.R")
source("chart_3.R")

intro_blurb <- "Have you ever wanted to get into working out, but always thought that the IMA was too intimidating?
According to the New York post, almost 50% of Americans are intimidated by the prospect of working out
at a public gym. This project seeks to alleviate this issue for University of Washington students by answering the following question: How many people
are at the IMA at any given time? To answer this question, we are analyzing data gathered on how crowded Berkeley's campus gym is throughout the year.
We hope that by answering this topic, we're able to help students new to the IMA find less crowded times
to workout and get started. Additionally, even seasoned gym-goers will be able to use our project to find the
optimal time to work out for maximum efficiency."

authors <- "David Pham, Justin Dong"

affiliation <- "INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"

research_question <- "Does temperature affect how busy the gym is?
                      Does an holiday or special event affect how busy the gym is?
                      How busy is the gym during each day of the week?"

data_set <- "This dataset is Crowdedness at the Campus Gym (https://www.kaggle.com/datasets/nsrose7224/crowdedness-at-the-campus-gym).
             Our dataset contains information from UC Berkeley on how crowded their gym is at a certain time
             and information during that time that includes temperature, day of week, and relation to holiday.
             The dataset marks the information every 10 minutes and contains over 60,000 lines.This dataset was made 2016 and
             consisted of about 26,000 people."
user_date <- dateInput(
  inputId = "userdate",
  label = "Choose the date of interest",
  value = NULL,
  min = "2022-12-05",
  max = "2023-12-05"
)

user_time_min <- selectInput(
  inputId = "early",
  label = "Input earliest time available in 24 hour time (Format: XX:XX)",
  choices = list("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00",
                 "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                 "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                 "21:00", "22:00", "23:00", "24:00"),
  selected = "05:00"
)

user_time_max <- selectInput(
  inputId = "late",
  label = "Input latest time available in 24 hour time (Format: XX:XX)",
  choices = list("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00",
                 "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                 "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                 "21:00", "22:00", "23:00", "24:00"),
  selected = "12:00"
)

#introduction page
introduction <- tabPanel(
  "Introduction",
  titlePanel("How Crowded is the IMA?"),
  h3("Authors"),
  p(authors),
  h3("Affiliation"),
  p(affiliation),
  h3("Intro"),
  imageOutput("home_pic"),
  p(intro_blurb),
  h3("Research Questions"),
  p(research_question),
  h3("Dataset"),
  p(data_set)
)

#first interactive
interactive_1 <- tabPanel(
  "Interactive",
  h3("How busy is the gym on any given day?"),
  sidebarLayout(
    sidebarPanel(
      user_date,
      p("Using this tool, users can pick any date within the next year and receive an approximation of how busy the gym will be per hour.
        In general, it is best to go during mornings with numbers picking up closer to 5 PM and staying busy throughout the night. "),
      br(),
      user_time_min,
      user_time_max,
      p("Additionally, users can pick a time range within the day that they have chosen in order to receive a filtered view of only
        times that are applicable to them.")
    ),
    mainPanel(plotOutput("heatmap"), plotOutput("selectheatmap"))
  )
)

#second interactive

test123 <- unique(gym_data$number_people)

test321 <- gym_data %>%
  select(is_holiday:is_during_semester) %>%
  names() 

interactive_2 <- tabPanel(
  "Interactive",
  p("The second interactive is planned to focus on the time of day and how busy the gym crowded the gym is"),
  titlePanel("Number of People"),
  sidebarLayout(      
    sidebarPanel(
      selectInput(inputId = "selects", choices = test123,
                  label = "Number of People:", multiple = TRUE),
      selectInput(inputId = "selects2", choices = test321, label = "Select Attribute:",
                  multiple = TRUE)
    ),
    mainPanel(
      plotOutput("barchart")  
    )
  )
)

#third interactive
interactive_3 <- tabPanel(
  "Interactive",
  p("The third interactive is planned to focus on how temperature affects the crowded the gym is."),
  plotOutput("scatterplot3",
             click = "plot_click",
             dblclick = "plot_dblclick",
             hover = "plot_hover",
             brush = "plot_brush"
  ),
  verbatimTextOutput("gym_info")
)

summary_takeaways <- "temp 1"

summary_takeaways_2 <- "temp 2"

summary_takeaways_3 <- "temp 3"

#takeaway page
takeaways <- tabPanel(
  "Takeaways",
  h2("Takeaways:"),
  h3("Heatmap:"),
  p(summary_takeaways),
  h3("Bar Chart:"),
  p(summary_takeaways_2),
  h3("Scatterplot:"),
  p(summary_takeaways_3),
)

#report page
report <- tabPanel(
  "Report"
)

#ui put together
ui <- navbarPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),
  "Crowdedness At the IMA",
  introduction,
  interactive_1,
  interactive_2,
  interactive_3,
  takeaways,
  report
)