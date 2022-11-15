# This file calculates a few summary statistics

# Loading tidyverse package
library(tidyverse)

# Loading dataset
gym_data <- read.csv("data/data.csv")


# A list containing summary information regarding our dataset
summary_data <- list(
  num_observations = nrow(gym_data),
  num_metrics = ncol(gym_data),
  max_crowdedness = max(gym_data$number_people),
  average_crowdedness = mean(gym_data$number_people),
  average_temperature = mean(gym_data$temperature)
)



