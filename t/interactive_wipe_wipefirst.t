#! /opt/local/bin/perl5.10.0
use 5.010;
use warnings;
use Test::More;

use IO::Prompter;

if (!-t *STDIN || !-t *STDERR) {
    plan('skip_all' => 'Non-interactive test environment');
}
else {
    plan('no_plan');
}

my %ok = (
    'Pure prompt'       => 0,
    'Assignment prompt' => 0,
    '$_ unaffected'     => 0,
);

if (prompt -i, -wipe, -out=>\*STDERR,
           "\n\tShould have cleared screen. Enter an integer: ") {
    $ok{'Pure prompt'} = m{ ^ \s* [+-]? \d++ \s* $ }x;
}

$_ = 'UNDERBAR';
if (my $input = prompt -i, -wipefirst, -out=>\*STDERR,
                    "\tShould NOT have cleared again. Enter another integer: "
) {
    $ok{'Assignment prompt'} = $input =~ m{ ^ \s* [+-]? \d++ \s* $ }x;
    $ok{'$_ unaffected'} = $_ eq 'UNDERBAR';
}

for my $test (keys %ok) {
    ok $ok{$test} => $test;
}


