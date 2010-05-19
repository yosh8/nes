#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

&main();
exit(0);

sub main {
    my @lines = <STDIN>;
    my @sches = ();
    foreach my $line (@lines) {
        chomp($line);
        my @days = split(//, $line);
        push(@sches, \@days);
    }
    warn Dumper @sches;
#    warn Dumper $#{$sches[0]}+1;
    my @ownerOfMap = &initOwner($#sches + 1);
    warn Dumper @ownerOfMap;
}

sub initOwner {
    my $numberOfOwner = shift;
    my @ownerOfMap = ();
    for(my $i = 0; $i < $numberOfOwner; $i++) {
        $ownerOfMap[$i] = $i;
    }
    return @ownerOfMap;
}

