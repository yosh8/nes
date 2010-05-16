#!/usr/bin/perl -w

&main();
exit(0);

sub main() {
    my $input = <STDIN>;
    chomp($input);
    my @chars = split(//, $input);
    #my $count = @chars;
    foreach my $c (@chars) {
        print "[$c]\n";
    }
}
