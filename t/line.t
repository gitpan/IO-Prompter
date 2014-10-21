#! /opt/local/bin/perl5.10.0
use 5.010;
use warnings;
use Test::More 'no_plan';

use IO::Prompter;

local *ARGV;
open *ARGV, '<', \<<END_INPUT or die $!;
Line 1
Line 2
END_INPUT

if (prompt "Enter line 1", -line) {
    is $_, "Line 1\n"  => 'First line retrieved';
}
else {
    fail 'First line retrieved'; 
}

$_ = 'UNDERBAR';
if (my $input = prompt "Enter line 2", -l_) {
    is $input, "Line 2\n" => 'Second line retrieved';
    is $_,     'UNDERBAR'  => 'Second line left $_ alone'
}
else {
    fail 'Second line retrieved'; 
}

