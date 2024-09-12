import tensorflow as tf
from tensorflow.keras import layers, models
import numpy as np
import matplotlib.pyplot as plt


# Create a simple CNN model
def create_cnn_model(input_shape=(28, 28, 1), num_classes=10):
    model = models.Sequential(
        [
            layers.Conv2D(32, (3, 3), activation="relu", input_shape=input_shape),
            layers.MaxPooling2D((2, 2)),
            layers.Conv2D(64, (3, 3), activation="relu"),
            layers.MaxPooling2D((2, 2)),
            layers.Conv2D(64, (3, 3), activation="relu"),
            layers.Flatten(),
            layers.Dense(64, activation="relu"),
            layers.Dense(num_classes, activation="softmax"),
        ]
    )
    return model


# Generate mock data
def generate_mock_data(num_samples=1000, input_shape=(28, 28, 1), num_classes=10):
    x = np.random.rand(num_samples, *input_shape)
    y = np.random.randint(0, num_classes, num_samples)
    return x, y


# Train the model
def train_model(model, x_train, y_train, epochs=10, batch_size=32):
    model.compile(
        optimizer="adam", loss="sparse_categorical_crossentropy", metrics=["accuracy"]
    )

    history = model.fit(
        x_train, y_train, epochs=epochs, batch_size=batch_size, validation_split=0.2
    )
    return history


# Plot training history
def plot_history(history):
    plt.figure(figsize=(12, 4))

    plt.subplot(1, 2, 1)
    plt.plot(history.history["accuracy"], label="Training Accuracy")
    plt.plot(history.history["val_accuracy"], label="Validation Accuracy")
    plt.title("Model Accuracy")
    plt.xlabel("Epoch")
    plt.ylabel("Accuracy")
    plt.legend()

    plt.subplot(1, 2, 2)
    plt.plot(history.history["loss"], label="Training Loss")
    plt.plot(history.history["val_loss"], label="Validation Loss")
    plt.title("Model Loss")
    plt.xlabel("Epoch")
    plt.ylabel("Loss")
    plt.legend()

    plt.tight_layout()
    plt.savefig("cnn_training_history.png")
    plt.close()


if __name__ == "__main__":
    # Generate mock data
    x_train, y_train = generate_mock_data()

    # Create and train the model
    model = create_cnn_model()
    history = train_model(model, x_train, y_train)

    # Plot and save training history
    plot_history(history)

    print("CNN model training completed. Check 'cnn_training_history.png' for results.")
