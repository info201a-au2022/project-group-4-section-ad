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

  titlePanel("Project Introduction: Gym Crowdedness"),

  p(introduction),

  br(), br()
)

# ---------- REPORT PAGE ----------
report_page <- tabPanel("Report",
  h3("Gym Crowdedness"),
  br(),

  p(date), br(),
  p(authors), br(),
  p(affiliation), br(),
  br(),


  h3("Our Process"), br(),

  tabsetPanel(
    tabPanel("Index", br(), br(),
      p(index.rmd_report),
      p(research_questions),
      p(data_set),
      p(expected_implications),
      p(findings),
      p(discussion),
      p(conclusion),
      br(),
    ),

    tabPanel("Aggregate Table", br(), br(),
      p(agg_table_report1),
      p(agg_table_report2), br(), br(),
      DT::dataTableOutput("agg_table"),
      br(),
      br(),
      p(agg_table_report3),
      p(agg_table_report4),
      p(agg_table_report5),
      br(),
      br()
    )
  )
)


# ---------- SUMMARY PAGE ----------
summary_page <- tabPanel("Summary",

  h3("Major Takeaways"), br(),

  tabsetPanel(
    tabPanel("Takeaways",
      br(),
      p(summary_takeaways),
      p(summary_takeaways2),
      p(summary_takeaways3),
    ),
  )
)


# ---------- INTERACTIVE PAGE 1 ----------
interactive_page_1 <- tabPanel("Temperature",

  h3("temp"),
  br(),
)


# ---------- INTERACTIVE PAGE 2 ----------
interactive_page_2 <- tabPanel("Holiday",

  h3("temp"),
  br(),
)