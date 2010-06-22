#! /opt/local/bin/perl5.10.0
use 5.010;
use warnings;
use Test::More 'no_plan';

use IO::Prompter;

local *ARGV;
open *ARGV, '<', \<<END_INPUT or die $!;

Non-default

END_INPUT

if (prompt "Enter line 1", -default=>'foo' ) {
    is $_, 'foo'  => 'First default used';
}
else {
    fail 'First default used'; 
}

if (prompt "Enter line 1", -default=>'foo' ) {
    is $_, 'Non-default'  => 'First non-default';
}
else {
    fail 'First non-default'; 
}

if (prompt "Enter line 1", -dFOO ) {
    is $_, 'FOO'  => '-d default';
}
else {
    fail '-d default'; 
}
