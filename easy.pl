#!/usr/bin/perl -w
my $DEBUG = 0;

&main();
exit(0);

sub main {
    my $input = <STDIN>;
    chomp($input);
    my @strs = split(/[0]/, $input);
    foreach my $c (@strs) {
        debug("[$c]\n");
        my $charConv = &getConvertedChar($c);
        print("$charConv");
    }
    print("\n");
}

sub getKeyMap {
    my @list = (
            ['.', ',', '!', '?', ' ']
            , ['a', 'b', 'c']
            , ['d', 'e', 'f']
            );
}

sub getConvertedChar {
    my $inputStr = $_[0];
    my @chars = split(//, $inputStr);
    my $i = 0;
    for($i=0; $i <= $#chars; $i++) {
        my $before = '';
        if(0 == $i) {
            $before = $chars[0];
        } else {
            $before = $chars[$i-1];
        }
        debug("current = $chars[$i], before = $before");
        if ($chars[$i] != $before) {
            last;
        }
    }
    debug("i=[$i]");
    my @keyList = &getKeyMap();
    my $rowIndex = $chars[0] - 1; 
    my $colIndex = $i -1;
    return $keyList[$rowIndex][$colIndex] 
}

sub debug {
    if(1 == $DEBUG) {
        print($_[0] . "\n");
    }
}
