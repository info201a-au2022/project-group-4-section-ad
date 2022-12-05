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
interactive_1 <- tabPanel(
  "Interactive"
)
interactive_2 <- tabPanel(
  "Interactive"
)
interactive_3 <- tabPanel(
  "Interactive"
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