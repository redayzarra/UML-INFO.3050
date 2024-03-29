use strict;
use warnings;
use Test::Simple tests => 4;

=pod
Assignment One: Extra Credit

- Add support for optional command line parameters that controls the 
sort order. 

Type:
> perl mySorter.pl -r spencer able delta

or

> perl mySorter.pl --reverse spencer able delta

See:
spencer delta able

Type:
> perl mySorter.pl --foo spencer able delta

See:
The most useful error message you can think of. 
=cut

# Test 1: Normal Ascending Sort
ok(`perl ReDaySorter.pl apple banana cherry` eq "apple banana cherry\n", 'Test Ascending Sort');

# Test 2: Normal Descending Sort
ok(`perl ReDaySorter.pl -r apple banana cherry` eq "cherry banana apple\n", 'Test Descending Sort');

# Test 3: Invalid Switch
ok(`perl ReDaySorter.pl --foo apple banana cherry` eq "Invalid switch --foo. Use -r or --reverse for reverse sorting.\n", 'Test Invalid Switch');

# Test 4: No Strings Provided
ok(`perl ReDaySorter.pl` eq "Please supply two or more input values to start.\n", 'Test No Input');