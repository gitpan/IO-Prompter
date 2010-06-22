use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'IO::Prompter',
    license             => 'perl',
    dist_author         => 'Damian Conway <DCONWAY@CPAN.org>',
    dist_version_from   => 'lib/IO/Prompter.pm',
    requires => {
        'Test::More'         => 0,
        'Contextual::Return' => 0,
    },
    add_to_cleanup      => [ 'IO-Prompter-*' ],
);

$builder->create_build_script();
