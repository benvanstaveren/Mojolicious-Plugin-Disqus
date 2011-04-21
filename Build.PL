use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Mojolicious::Plugin::Disqus',
    license             => 'perl',
    dist_author         => q{Ben van Staveren <madcat@cpan.org>},
    dist_abstract       => 'Access Disqus.com API from your Mojolicious apps',
    dist_version_from   => 'lib/Mojolicious/Plugin/Disqus.pm',
    build_requires => {
        'Test::More'    => 0,
        'Test::Mojo'    => 0,
    },
    requires => {
        'Mojolicious'   =>  '1.21',
        'Net::Disqus'   =>  '0.1.3',
    },
    add_to_cleanup      => [ 'Mojolicious-Plugin-Disqus-*' ],
);

$builder->create_build_script();
