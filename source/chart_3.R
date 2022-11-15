# david pham scatter plot
install.packages("installr")
library(installr)
updateR()
library(tidyverse)
library(stringr)
library(ggplot2)
gym <- read.csv("data/data.csv")

remove_rows_chart <- special[,!names(special) %in% c("day_of_week","is_start_of_semester", "is_during_semester", "timestamp")]
temp_filter <- remove_rows_chart %>% filter (hour > 10 & hour < 18)
colnames(temp_filter)[colnames(temp_filter) == "number_people"] ="Number_of_People"
colnames(temp_filter)[colnames(temp_filter) == "temperature"] ="Temperature"

# Scatter plot with the 2d density estimation
sp <- ggplot(temp_filter, aes(x=Number_of_People, y=Temperature)) +
  geom_point()
sp + geom_density_2d()
# Gradient color
sp + stat_density_2d(aes(fill = ..level..), geom="polygon")
sp + stat_density_2d(aes(fill = ..level..), geom="polygon")+
  scale_fill_gradient(low="yellow", high="gold")