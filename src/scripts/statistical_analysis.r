# Load required libraries
library(stats)

# Create mock data
model_a <- c(0.82, 0.85, 0.81, 0.84, 0.83)
model_b <- c(0.87, 0.89, 0.86, 0.88, 0.90)

# Perform t-test
t_test_result <- t.test(model_a, model_b)

# Print results
print(t_test_result)

# Calculate effect size (Cohen's d)
cohens_d <- (mean(model_b) - mean(model_a)) / sqrt((sd(model_a)^2 + sd(model_b)^2) / 2)
print(paste("Cohen's d:", cohens_d))