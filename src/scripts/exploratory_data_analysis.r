library(ggplot2)
library(dplyr)

# Create mock dataset
set.seed(123)
image_data <- data.frame(
  category = sample(c("cat", "dog", "bird"), 1000, replace = TRUE),
  width = rnorm(1000, mean = 300, sd = 50),
  height = rnorm(1000, mean = 250, sd = 40),
  file_size = rnorm(1000, mean = 500, sd = 100)
)

# Summary statistics
summary_stats <- image_data %>%
  group_by(category) %>%
  summarise(
    count = n(),
    avg_width = mean(width),
    avg_height = mean(height),
    avg_file_size = mean(file_size)
  )

print(summary_stats)

# Visualize distribution of image sizes
ggplot(image_data, aes(x = width, y = height, color = category)) +
  geom_point(alpha = 0.6) +
  labs(title = "Distribution of Image Sizes by Category",
       x = "Width (pixels)",
       y = "Height (pixels)") +
  theme_minimal()

# Save the plot
ggsave("image_size_distribution.png", width = 8, height = 6)