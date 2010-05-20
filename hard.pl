#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my @sches = ();
my @countOfMap = ();

&main();
exit(0);

sub main {
    my @lines = <STDIN>;
    # 入力を２次元配列に。
    foreach my $line (@lines) {
        chomp($line);
        my @days = split(/ /, $line);
        push(@sches, \@days);
    }
#    warn Dumper $#{$sches[0]}+1;
    @countOfMap = &initOwner($#sches + 1);
    # 各人のスケジュールについて他の人のスケジュールに同じ日があるか見ていく
    # 前提としてはi郎の方が空いてる日が少ない。ので他の人に渡したい。
    for(my $i=0; $i <= $#sches; $i++) {
        if(0 == $countOfMap[$i]) {
            next;
        }
        for(my $j=$i+1; $j <= $#sches; $j++) {
            my ($ret, $day) = &merge($i, $j);
            # 地図を渡したら次の人に。
            if(1 == $ret) {
                # j郎の地図の数が人数と同じなら全部集まった！
                if($countOfMap[$j] == ($#sches+1)) {
                    print("$day \n");
                    return;
                }
                last;
            }
        }
    }
}

sub initOwner {
    my $numberOfOwner = shift;
    my @countOfMap = ();
    for(my $i = 0; $i < $numberOfOwner; $i++) {
        $countOfMap[$i] = 1;
    }
    return @countOfMap;
}

sub merge {
    my $i = shift;
    my $j = shift;
    for(my $indexOfDay_i=0;$indexOfDay_i <= $#{$sches[$i]}; $indexOfDay_i++) {
        for(my $indexOfDay=0;$indexOfDay <= $#{$sches[$j]}; $indexOfDay++) {
            if($sches[$i][$indexOfDay_i] < $sches[$j][$indexOfDay]) {
                last;
            } elsif($sches[$i][$indexOfDay_i] > $sches[$j][$indexOfDay]) {
                next;
            } elsif($sches[$i][$indexOfDay_i] == $sches[$j][$indexOfDay]) {
                # i郎の持っている地図をj郎に渡す
                $countOfMap[$j] += $countOfMap[$i];
                $countOfMap[$i] = 0;
                return (1, $sches[$j][$indexOfDay]);
            }
        }
    }
    return 0;
}
