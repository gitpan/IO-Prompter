#! /opt/local/bin/perl5.10.0
use 5.010;
use warnings;

use Test::More tests => 1;

BEGIN {
    use_ok( 'IO::Prompter' );
}

diag( "Testing IO::Prompter $IO::Prompter::VERSION" );
