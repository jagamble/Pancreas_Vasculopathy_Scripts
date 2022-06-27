#!c:/perl/bin/perl.exe

use strict;
use warnings;
# use diagnostics;
# Perl is not letting me use 'diagnostics' on Windows 10 for some reason.


# Script takes as input the % occlusion data for each of the four blood vessels
# on a single slide and puts these figures all on one line. This makes it easier 
# to calculate the statistics for the occlusion data for each slide.


my $file = 'infile_stage_2.txt';
my $linecount = 0;
my @line_data;

open (my $in, $file) or die "Can't open file $file: $!";
open (my $out, '>', 'outfile_stage_2.txt') or die "Can't write to file: $!";

# Print header line
print $out 'Sample,1,2,3,4', "\n";


# Read input file, split on the comma and put data from each group of
# four lines on a single line.  From first line of group, write sample ID
# and occlusion data.  For subsequent three lines of group, write only 
# occlusion data.

while (<$in>) {
	s/[\r\n]//g;
	my @sections = split(",", $_);
	
	if (@sections < 2) {
		warn "Skipping '$_' - not enough data";
		continue;
	}
	
	unless (@line_data) {
		push @line_data, $sections[0];
	}
	
	push @line_data, $sections[1];

	++$linecount;
	
	if (($linecount % 4) == 0) {
		print $out join(",", @line_data), "\n";
		@line_data = ();
	}
}

if (@line_data) {
	print $out join(",", @line_data), "\n";
}

close $in or die "Can't close input file $in: $!";
close $out or die "Can't close output file: $!";
