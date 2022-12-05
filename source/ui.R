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

source("chart_1.R")
source("chart_2.R")
source("chart_3.R")

introduction <- tabPanel(
  "Introduction",
  titlePanel("How Crowded is the IMA?"),
  p("Have you ever wanted to get into working out, but always thought that the IMA was too intimidating?
    According to the New York post, almost 50% of Americans are intimidated by the prospect of working out
    at a public gym. This project seeks to alleviate this issue for University of Washington students by answering the following question: How many people
    are at the IMA at any given time? To answer this question, we are analyzing data gathered on how crowded Berkeley's campus gym is throughout the year.
    We hope that by answering this topic, we're able to help students new to the IMA find less crowded times
    to workout and get started. Additionally, even seasoned gym-goers will be able to use our project to find the
    optimal time to work out for maximum efficiency."),
)

authors <- "David Pham, Justin Dong"

affiliation <- "INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"

research_question <- "Does temperature affect how busy the gym is?
                      Does an holiday or special event affect how busy the gym is?
                      How busy is the gym during each day of the week?"

data_set <- "This dataset is Crowdedness at the Campus Gym (https://www.kaggle.com/datasets/nsrose7224/crowdedness-at-the-campus-gym).
             Our dataset contains information from UC Berkeley on how crowded their gym is at a certain time
             and information during that time that includes temperature, day of week, and relation to holiday.
             The dataset marks the information every 10 minutes and contains over 60,000 lines.This dataset was made 2016 and
             consisted of about 26,000 people.
             "

interactive_1 <- tabPanel(
  "Interactive"
  p("The first interactive is planned to be an heat map that shows days of week against and how crowded
     the gym is.")
)
interactive_2 <- tabPanel(
  "Interactive"
  p("The second interactive is planned to focus on the time of day and how busy the gym crowded the gym is")
)
interactive_3 <- tabPanel(
  "Interactive"
  p("The third interactive is planned to focus on how temperature affects the crowded the gym is.")
)
takeaways <- tabPanel(
  "Takeaways"
)
report <- tabPanel(
  "Report"
)


ui <- navbarPage(
  "Crowdedness At the IMA",
  introduction,
  interactive_1,
  interactive_2,
  interactive_3,
  takeaways,
  report
)