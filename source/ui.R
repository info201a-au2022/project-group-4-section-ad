# frontend shiny r file

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

introductory_page <- tabPanel("Introduction",

  titlePanel("Project Introduction: Gym Crowdiness"),

  p(introduction),

  br(), br()
)