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
library(shinythemes)

source("text.R")

#--------------INPUT FUNCTIONS--------------

#asks user for date of interest
user_date <- dateInput(
  inputId = "userdate",
  label = "Choose the date of interest",
  value = NULL,
  min = "2022-12-05",
  max = "2023-12-05"
)

#asks user for earliest time available
user_time_min <- selectInput(
  inputId = "early",
  label = "Input earliest time available in 24 hour time (Format: XX:XX)",
  choices = list("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", 
                 "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                 "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                 "21:00", "22:00", "23:00"),
  selected = "07:00"
)

#asks user for latest time available
user_time_max <- selectInput(
  inputId = "late",
  label = "Input latest time available in 24 hour time (Format: XX:XX)",
  choices = list("0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", 
                 "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00",
                 "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",
                 "21:00", "22:00", "23:00"),
  selected = "12:00"
)

#asks user whether it is a holiday or not
user_holiday <- selectInput(
  inputId = "holiday",
  label = "Holiday or not?",
  choices = list("Yes", "No"),
  selected = "No"
)

#asks user whether it is a weekend or not
user_weekend <- selectInput(
  inputId = "weekend",
  label = "Weekend or not?",
  choices = list("Yes", "No"),
  selected = "No"
)

#--------------PAGES--------------

#introduction page
introduction <- tabPanel(
  "Introduction",
  imageOutput("home_pic"),
  br(),
  titlePanel("How Crowded is the IMA?"),
  p(intro_blurb),
  br(),
  p(data_set_description)
)

#first interactive
interactive_1 <- tabPanel(
  "Heat Map",
  titlePanel("How busy is the gym on any given day?"),
  sidebarLayout(
    sidebarPanel(
      user_date,
      p(int1_description),
      br(),
      user_time_min,
      user_time_max,
      p(int1_description2)
    ),
    mainPanel(plotOutput("heatmap"), plotOutput("selectheatmap"))
  )
)

#second interactive
interactive_2 <- tabPanel(
  "Barchart",
  titlePanel("Number of People"),
  sidebarLayout(
    sidebarPanel(
      user_holiday,
      user_weekend,
      p(int2_description),
      p(int2_addendum),
    ),
    mainPanel(
      plotOutput("barchart")
    )
  )
)

#third interactive
interactive_3 <- tabPanel(
  "Scatterplot",
  titlePanel("How does temperature affect gym attendance?"),
  plotOutput("scatterplot3",
             click = "plot_click",
             dblclick = "plot_dblclick",
             hover = "plot_hover",
             brush = "plot_brush"
  ),
  p(int3_description),
  verbatimTextOutput("info")
  )

#takeaway page
takeaways <- tabPanel(
  "Takeaways",
  h2("Takeaways"),
  br(),
  imageOutput("pic"),
  h3("Heatmap:"),
  p(summary_takeaways),
  p(findings1),
  h3("Bar Chart:"),
  p(summary_takeaways_2),
  p(findings2),
  h3("Scatterplot:"),
  p(summary_takeaways_3),
  p(findings3)
)

#report page
report <- tabPanel(
  "Report",
  titlePanel("Gym Crowdiness at the Campus Gym"),
  h4("Authors"),
  p(authors),
  h4("Affiliation"),
  p(affiliation),
  h4("Date"),
  p(report_date),
  h4("Abstract"),
  p(abstract),
  h4("Keywords"),
  p(keywords),
  h4("Introduction"),
  p(report_introduction),
  p(report_introduction_2),
  h4("Problem Domain"),
  h5("Values"),
  p(values),
  h5("Direct Stakeholders"),
  p(direct_stakeholders),
  h5("Indirect Stakeholders"),
  p(indirect_stakeholders),
  h5("Harms"),
  p(harms),
  h5("Benefits"),
  p(benefits),
  h4("Research Questions"),
  h5(question_1),
  p(question_1_description),
  h5(question_2),
  p(question_2_description),
  h5(question_3),
  p(question_3_description),
  h4("Dataset"),
  p(dataset1),
  p(dataset2),
  p(dataset3),
  p(dataset4),
  p(dataset_acknowledgement),
  h4("Limitations"),
  p(limitations),
  h4("Findings"),
  p(findings1),
  p(findings2),
  p(findings3),
  h4("Discussion"),
  p(discussion),
  h4("Conclusion"),
  p(conclusion),
  h4("Acknowledgments"),
  p(acknowledgement),
  h4("References"),
  p(reference1),
  p(reference2),
  p(reference3),
  p(reference4),
  p(reference5),
  p(reference6)
)

#ui put together
ui <- navbarPage(
  theme = shinytheme("cosmo"),
  "Crowdedness At the IMA",
  introduction,
  interactive_1,
  interactive_2,
  interactive_3,
  takeaways,
  report
)
