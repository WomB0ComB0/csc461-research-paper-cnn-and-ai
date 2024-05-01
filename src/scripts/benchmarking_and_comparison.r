# Load required libraries
library(ggplot2)
library(dplyr)

# Create dummy data
data <- data.frame(
  n = c(100, 200, 300, 400, 500),
  time = c(10, 20, 30, 40, 50),
  method = rep(c("Method A", "Method B"), each = 5)
)

# Plot the data
ggplot(data, aes(x = n, y = time, color = method)) +
  geom_point() +
  geom_line() +
  labs(title = "Benchmarking and Comparison",
      x = "Number of observations",
      y = "Time (seconds)",
      color = "Method") +
  theme_minimal() +
  theme(legend.position = "bottom")
