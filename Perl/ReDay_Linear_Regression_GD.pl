# Make sure Perl has been added to system path at Strawberry/perl/bin

use strict;
use warnings;
"""
Assignment 2 - Complex Perl Program: Linear Regression Gradient Descent

Instructions: I want you to choose something not too simple, but not something too hard for you
either. When figuring out what 'moderate complex' means to you, remember I am only
giving you a short time to write this code (2 weeks), so err on the side of easier rather
than harder. That will be OK. Remember, I prefer higher quality code, complete work,
than a more ambitious, but incomplete or rushed work. 

Requirements: I prefer a high quality to high quantity.
"""

# Theta parameters for bias and slope coefficients
my $theta_0 = 0; # Intercept
my $theta_1 = 0; # Slope

# The learning rate - decides how big of a step we take in any direction
my $alpha = 0.01;

# Number of iterations which need to played around with - ensemble method
# in machine learning is when another model would manipulate these variables.
my $iterations = 1000;

# Number of training examples
my $n = scalar @x_values;

# Gradient Descent Algorithm - from notes
for (1..$iterations) {
    my $sum_error_0 = 0;
    my $sum_error_1 = 0;

    for (my $i = 0; $i < $n; $i++) {
        my $y_pred = $theta_0 + $theta_1 * $x_values[$i];
        $sum_error_0 += ($y_pred - $y_values[$i]);
        $sum_error_1 += ($y_pred - $y_values[$i]) * $x_values[$i];
    }

    # Simultaneous update of parameters
    $theta_0 -= $alpha * $sum_error_0 / $n;
    $theta_1 -= $alpha * $sum_error_1 / $n;
}

# Output the learned parameters
print "Theta 0: $theta_0\n";
print "Theta 1: $theta_1\n";