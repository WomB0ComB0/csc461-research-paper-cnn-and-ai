# Load required libraries
library(ggplot2)
library(dplyr)

# Create mock data
mock_data <- data.frame(
  model = c("CNN", "R-CNN", "YOLO", "SSD", "Faster R-CNN"),
  accuracy = c(0.85, 0.88, 0.82, 0.79, 0.91),
  inference_time = c(0.05, 0.08, 0.03, 0.04, 0.07)
)

# Create a scatter plot
ggplot(mock_data, aes(x = inference_time, y = accuracy, color = model)) +
  geom_point(size = 3) +
  geom_text(aes(label = model), vjust = -1, hjust = 0.5) +
  labs(title = "Model Performance Comparison",
       x = "Inference Time (seconds)",
       y = "Accuracy",
       color = "Model") +
  theme_minimal()

# Save the plot
ggsave("model_comparison.png", width = 8, height = 6)