# Include the main script
require './ReDay_Linear_Regression_GD.pl';

# Ensure the number of data points is defined
my $n = scalar @x_values;

# Calculated Theta values
my $theta_0 = 0.876332021468342;
my $theta_1 = 1.03425404703086;

my $sum_of_squared_errors = 0;
for (my $i = 0; $i < scalar @x_values; $i++) {
    my $predicted = $theta_0 + $theta_1 * $x_values[$i];
    my $observed = $y_values[$i];
    $sum_of_squared_errors += ($predicted - $observed) ** 2;
}
# Calculate the Mean Squared Error
my $mse = $sum_of_squared_errors / $n;

# Round the Mean Squared Error to 2 decimal places
my $rounded_mse = sprintf("%.5f", $mse);

# Print the Mean Squared Error
print "Mean Squared Error: $rounded_mse\n";
