#!c:/perl/bin/perl.exe

use strict;
use warnings;
# use diagnostics;
# Perl is not letting me use 'diagnostics' on Windows 10 for some reason.


#Script is used to convert output of Leica files into format more
#amenable to further analysis.  Takes concatenated *.csv files as 
#input. Puts the three lines of data for one sample onto a single
#line.  This makes it easier to calculate the % occlusion figures.


my $file = 'input_file_stage_1.txt';
my $linecount = 1;

open (my $in, $file) or die "Can't open file $file: $!";
open (my $out, '>', 'outfile_stage_1.txt') or die "Can't write to file: $!";

#Print header line
print $out 'Sample,Feature,Length(um),Area(um2),' x3, "\n";

#Print three lines of input file on one line.
#Then start a new line and repeat until eof.
while (<$in>) {
	chomp;
	print $out $_, ',';
	print $ out "\n" if (($linecount % 3) == 0);
	++$linecount;
}

close $in or die "Can't close the file $file: $!";
close $out or die "Can't close file: $!";
