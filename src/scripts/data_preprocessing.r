# Load required libraries
library(magick)
library(purrr)

# Function to preprocess an image
preprocess_image <- function(image_path, target_size = c(224, 224)) {
  image <- magick::image_read(image_path)  # Use explicit package reference
  image <- magick::image_scale(image, paste(target_size, collapse = "x"))
  image <- magick::image_convert(image, colorspace = "srgb")
  image_array <- as.numeric(image[[1]])
  image_array <- array_reshape(image_array, c(1, target_size[1], target_size[2], 3))
  return(image_array / 255.0)  # Normalize pixel values
}

# Mock image paths
image_paths <- c("path/to/image1.jpg", "path/to/image2.jpg", "path/to/image3.jpg")

# Preprocess images
preprocessed_images <- map(image_paths, preprocess_image)

# Print dimensions of preprocessed images
print(paste("Number of preprocessed images:", length(preprocessed_images)))
print(paste("Dimensions of each preprocessed image:", paste(dim(preprocessed_images[[1]]), collapse = " x ")))