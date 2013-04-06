use 5.008001;
use strict;
use warnings;

package U;
# ABSTRACT: UNIVERSAL::new alias for the command line
# VERSION

use UNIVERSAL::new;

1;

=for Pod::Coverage method_names_here

=head1 SYNOPSIS

  $ perl -MU -we 'HTTP::Tiny->new->mirror(...)'

=head1 DESCRIPTION

The L<U> module loads L<UNIVERSAL::new>.  That's it.

=cut

# vim: ts=4 sts=4 sw=4 et:
