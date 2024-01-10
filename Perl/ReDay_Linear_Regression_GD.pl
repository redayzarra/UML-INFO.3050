use strict;
use warnings;

=pod

Assignment 2 - Complex Perl Program: Linear Regression Gradient Descent

Instructions: I want you to choose something not too simple, but not something too hard for you
either. When figuring out what 'moderate complex' means to you, remember I am only
giving you a short time to write this code (2 weeks), so err on the side of easier rather
than harder. That will be OK. Remember, I prefer higher quality code, complete work,
than a more ambitious, but incomplete or rushed work. 

Requirements: I prefer a high quality to high quantity.

=cut

# Sample data: y = 2x + 1 where 2 is the slope and 1 is the intercept
our @x_values = (
    5.48813504, 7.15189366, 6.02763376, 5.44883183, 4.23654799,
    6.45894113, 4.37587211, 8.91773001, 9.63662761, 3.83441519,
    7.91725038, 5.2889492 , 5.68044561, 9.25596638, 0.71036058,
    0.871293  , 0.20218397, 8.32619846, 7.78156751, 8.70012148,
    9.78618342, 7.99158564, 4.61479362, 7.80529176, 1.18274426,
    6.39921021, 1.43353287, 9.44668917, 5.21848322, 4.1466194 ,
    2.64555612, 7.74233689, 4.56150332, 5.68433949, 0.187898  ,
    6.17635497, 6.12095723, 6.16933997, 9.43748079, 6.81820299,
    3.59507901, 4.37031954, 6.97631196, 0.60225472, 6.66766715,
    6.7063787 , 2.10382561, 1.28926298, 3.15428351, 3.63710771,
    5.7019677 , 4.38601513, 9.88373838, 1.02044811, 2.08876756,
    1.61309518, 6.53108325, 2.53291603, 4.66310773, 2.44425592,
    1.58969584, 1.10375141, 6.56329589, 1.38182951, 1.96582362,
    3.68725171, 8.2099323 , 0.97101276, 8.37944907, 0.96098408,
    9.76459465, 4.68651202, 9.76761088, 6.0484552 , 7.39263579,
    0.39187792, 2.82806963, 1.20196561, 2.96140198, 1.18727719,
    3.17983179, 4.14262995, 0.64147496, 6.92472119, 5.66601454,
    2.65389491, 5.23248053, 0.93940511, 5.75946496, 9.29296198,
    3.18568952, 6.6741038 , 1.31797862, 7.16327204, 2.89406093,
    1.83191362, 5.86512935, 0.20107546, 8.28940029, 0.04695476
);

our @y_values = (
    10.81112024, 16.20461381, 13.52092996, 10.36141997, 10.96134818,
    15.81377144, 10.9305238, 18.65553518, 19.20250259, 9.7232821,
    16.43132381, 12.80034347, 12.5691662, 20.4885718, 2.77708756,
    3.44915916, 1.41486797, 19.4382674, 16.69004711, 18.80223233,
    22.45551754, 15.63541222, 8.95910225, 17.57998023, 2.19236511,
    15.74204161, 3.45344677, 19.14592353, 13.35990846, 10.77375359,
    8.1586712, 17.39071845, 9.26178096, 14.27874393, 1.10779264,
    14.15516634, 14.18916642, 13.18366984, 20.48904094, 15.55861265,
    8.56658354, 8.64123829, 15.25086209, 3.53089533, 13.64076645,
    14.26312285, 4.77249767, 5.42778968, 7.98086178, 8.68167726,
    11.63401933, 10.31127946, 20.0931441, 3.07272677, 4.54168904,
    4.90262365, 14.63875733, 5.8575333, 10.72222217, 4.79545033,
    2.68813408, 3.64689452, 14.29326528, 4.39869046, 7.31479201,
    9.3189829, 16.50704237, 4.0590418, 16.44299074, 2.46038355,
    20.46094769, 12.08636675, 19.79046694, 12.27047186, 15.68681906,
    1.12027756, 7.78277517, 2.32399972, 5.7753353, 2.93673433,
    6.86163114, 11.21479194, 3.23237073, 14.93699363, 11.10659357,
    7.1521528, 10.46474572, 1.33403912, 13.7069597, 19.90286656,
    8.29223787, 14.66693525, 4.49278786, 14.67551849, 5.75387902,
    5.34542176, 11.92684903, 0.71260115, 17.12326808, 1.11138868
);

my $expected_theta_0 = 1; # Intercept
my $expected_theta_1 = 2; # Slope

# Number of training examples: same as the data points
our $n = scalar @x_values;

# Theta parameters for bias and slope coefficients
our $theta_0 = 0; # Intercept
our $theta_1 = 0; # Slope

# The learning rate - decides how big of a step we take in any direction
my $alpha = 0.01;

# Number of iterations
my $iterations = 1000;

# Print initial data and $n
print "Number of data points (n): $n\n\n";

# Too many points, but in case you want to see it... uncomment below
# print "Initial X values: @x_values\n\n";
# print "Initial Y values: @y_values\n\n";

# Print expected theta values
print "Expected Theta 0 (Intercept): $expected_theta_0\n";
print "Expected Theta 1 (Slope): $expected_theta_1\n\n";

# Gradient Descent Algorithm: Ensure @x_values and @y_values are defined 
# and $n is set - in test script 
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

# Output the learned parameters with rounding to 2 decimal points
print "Calculated Theta 0 (Intercept): " . sprintf("%.4f", $theta_0) . "\n";
print "Calculated Theta 1 (Slope): " . sprintf("%.4f", $theta_1) . "\n\n";

# Output the expected and predicted linear formulas
print "Expected Linear Formula: y = $expected_theta_1 x + $expected_theta_0\n";
print "Predicted Linear Formula: y = " . sprintf("%.3f", $theta_1) . " x + " . sprintf("%.3f", $theta_0) . "\n\n";
