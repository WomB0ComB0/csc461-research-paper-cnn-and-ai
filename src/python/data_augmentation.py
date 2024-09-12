from tensorflow.keras.preprocessing.image import ImageDataGenerator
import numpy as np
import matplotlib.pyplot as plt

# Create a mock image
mock_image = np.random.rand(1, 100, 100, 3)

# Create an ImageDataGenerator with augmentation parameters
datagen = ImageDataGenerator(
    rotation_range=20,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    fill_mode="nearest",
)

# Generate augmented images
augmented_images = [next(datagen.flow(mock_image, batch_size=1))[0] for i in range(9)]

# Visualize augmented images
fig, axes = plt.subplots(3, 3, figsize=(10, 10))
for i, img in enumerate(augmented_images):
    ax = axes[i // 3, i % 3]
    ax.imshow(img.squeeze())
    ax.axis("off")
    ax.set_title(f"Augmented {i+1}")

plt.tight_layout()
plt.savefig("augmented_images.png")
plt.close()

print("Data augmentation example completed. Check 'augmented_images.png' for results.")
