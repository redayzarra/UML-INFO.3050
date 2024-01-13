import numpy as np

# Set the random seed 
np.random.seed(0)

n_samples = 100

# Generate random x values
x_values = np.random.rand(n_samples) * 10  # x values between 0 and 10

# Generate y values using the formula y = 2x + 1 plus some random noise
noise = np.random.randn(n_samples)  # Gaussian noise
y_values = 2 * x_values + 1 + noise

x_values, y_values