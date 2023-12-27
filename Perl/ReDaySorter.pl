# Perl has been added to system path at Strawberry/perl/bin

use strict;
use warnings;

# Check for valid number of arguments
if (@ARGV < 2) {
    print "Please supply two or more input values to start.\n";
    exit;
}

# Initialize the reverse sorting boolean (0 or 1) and the strings array
my $reverse_sort = 0;
my @strings;

# Iterate through every argument to find the -r or --reverse switch 
# Since they are not guaranteed to be in the beginning.
foreach my $arg (@ARGV) {
    # Turn on sorting if -r or --reverse is provided at any point
    if ($arg eq '-r' || $arg eq '--reverse') {
        $reverse_sort = 1;

    # Throw an error if any invalid switch is detected at any point
    } elsif ($arg =~ /^--/) {
        print "Invalid switch $arg. Use -r or --reverse for reverse sorting.\n";
        exit;
    
    # Add to the list of strings to sort
    } else {
        push @strings, $arg; 
    }
}

# Throw error if we only got a switch and not any strings.
if (@strings == 0) {
    print "No strings provided to sort. Please provide one or more strings.\n";
    exit;
}

# Sort the strings based on the reverse sorting boolean (0 or 1)
@strings = $reverse_sort ? reverse sort @strings : sort @strings;

# Print the sorted strings to the command line
print join(' ', @strings) . "\n";