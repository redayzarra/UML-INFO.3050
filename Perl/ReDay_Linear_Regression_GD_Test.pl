# Include the main script
require './ReDay_Linear_Regression_GD.pl';

# Calculate Mean Squared Error
my $mse = 0;
for (my $i = 0; $i < $n; $i++) {
    my $y_pred = $theta_0 + $theta_1 * $x_values[$i];
    $mse += ($y_pred - $y_values[$i])**2;
}
$mse /= $n;

# Print Mean Squared Error with rounding to 4 decimal points
print "Mean Squared Error: " . sprintf("%.4f", $mse) . "\n\n\n";
