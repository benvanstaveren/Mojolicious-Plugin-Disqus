package Mojolicious::Plugin::Disqus;
use warnings;
use strict;
use Mojo::Base 'Mojolicious::Plugin';
use Net::Disqus;

our $VERSION = '0.01';

sub register {
    my ($self, $app, $args) = @_;

    $args ||= {};

    $app->attr(disqus => sub {
        Net::Disqus->new(%$args);
    });
}

1;
__END__
=head1 NAME

Mojolicious::Plugin::Disqus - Interface with Disqus comments from your Mojolicious app

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    use Mojolicious::Plugin::Disqus

    $self->plugin('disqus' => {
        'api_secret' => 'your_api_secret',
        %options,
    });

=head1 CONFIGURATION

The following options can be set for the plugin:

    api_secret      (REQUIRED)  Your Disqus API secret (L<http://disqus.com/api/applications/>)
    secure          (optional)  When set, L<Net::Disqus> will use SSL to communicate with the Disqus API
    pass_api_errors (optional)  When set, any API errors are returned as a JSON object instead of
                                throwing an exception.

=head1 METHODS

For a full list of supported methods, please see L<http://disqus.com/api/docs/>. You can call
these methods as follows (using /applications/listUsage as an example):

    $app->disqus->applications->listUsage();
    $app->disqus->fetch('/applications/listUsage');

The above two are equivalent. See the L<Net::Disqus> documentation, as well as the Disqus site at L<http://disqus.com/api/docs> for more information.

=head1 AUTHOR

Ben van Staveren, C<< <madcat at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests through the web interface at L<https://bitbucket.org/xirinet/mojolicious-plugin-disqus/issues>.

=head1 CONTRIBUTING

If you want to contribute changes or otherwise involve yourself in development, feel free to fork the Mercurial repository from
L<http://bitbucket.org/xirinet/mojolicious-plugin-disqus/> and make pull requests for any patches you have.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Mojolicious::Plugin::Disqus


You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Mojolicious-Plugin-Disqus>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Mojolicious-Plugin-Disqus>

=item * Search CPAN

L<http://search.cpan.org/dist/Mojolicious-Plugin-Disqus/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Ben van Staveren.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
