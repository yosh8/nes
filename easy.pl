#!/usr/bin/perl -w

my $input = <STDIN>;
chomp($input);
my @chars = split(//, $input);
#my $count = @chars;
foreach my $c (@chars) {
    print "[$c]\n";
}
