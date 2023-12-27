use strict;
use warnings;
use Test::Simple tests => 4;

# Test 1: Normal Ascending Sort
ok(`perl ReDaySorter.pl apple banana cherry` eq "apple banana cherry\n", 'Test Ascending Sort');

# Test 2: Normal Descending Sort
ok(`perl ReDaySorter.pl -r apple banana cherry` eq "cherry banana apple\n", 'Test Descending Sort');

# Test 3: Invalid Switch
ok(`perl ReDaySorter.pl --foo apple banana cherry` eq "Invalid switch --foo. Use -r or --reverse for reverse sorting.\n", 'Test Invalid Switch');

# Test 4: No Strings Provided
ok(`perl ReDaySorter.pl` eq "Please supply two or more input values to start.\n", 'Test No Input');