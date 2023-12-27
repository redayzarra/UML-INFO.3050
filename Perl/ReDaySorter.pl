# Make sure Perl has been added to system path at Strawberry/perl/bin

"""
Assignment One:  Simple Sort Program Written in Perl

Instructions: Please write a simple Perl script (carefully) following 
the instructions below.

Hint: After studying the problem, you should able to write this program in only a few lines of
code. If you are having trouble, first identify each thing this program must be able to do, and
then solve that particular piece. Then move onto the new piece. (There are only a couple of
parts).

Requirements:
- Write a Perl program that reads in an arbitrary number of strings from the command line and
displays them sorted alphabetically.
Here are some example interactions

From the command line type:
> perl mySorter.pl spencer able delta

See:
able delta spencer

Type:
> perl mySorter.pl
See:
Invalid command line arguments to program. Please supply two or more strings
to sort.

- Name your program yourname_sort.pl
- Make sure you handle the invalid number of argument case. 
""" 

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