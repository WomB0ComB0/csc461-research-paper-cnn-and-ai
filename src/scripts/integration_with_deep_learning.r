# Load required libraries
library(keras)

# Create mock data
x_train <- matrix(rnorm(1000 * 784), nrow = 1000, ncol = 784)
y_train <- to_categorical(sample(0:9, 1000, replace = TRUE), num_classes = 10)

# Define model architecture
model <- keras_model_sequential() %>%
  layer_dense(units = 256, activation = "relu", input_shape = c(784)) %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 10, activation = "softmax")

# Compile the model
model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(),
  metrics = c("accuracy")
)

# Train the model
history <- model %>% fit(
  x_train, y_train,
  epochs = 30, batch_size = 128,
  validation_split = 0.2
)

# Plot training history
plot(history)