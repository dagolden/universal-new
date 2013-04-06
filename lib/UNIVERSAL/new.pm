use 5.008001;
use strict;
use warnings;

package UNIVERSAL::new;
# ABSTRACT: Load a module when you call the new method on it
# VERSION

use Carp;
use Module::Runtime qw/require_module/;

sub _new {
    my ($class) = @_;
    $class = ref $class || $class;
    eval { require_module($class) };
    croak($@) if $@;
    my $ctor;
    if ( $ctor = $class->can('new') and $ctor != \&UNIVERSAL::new::_new ) {
        goto $ctor;
    }
    else {
        croak(qq{Can't locate object method new via package "$class"});
    }
}

no warnings 'once';
*UNIVERSAL::new = \&_new;

1;

=for Pod::Coverage method_names_here

=head1 SYNOPSIS

  $ perl -MU -we 'HTTP::Tiny->new->mirror(...)'

=head1 DESCRIPTION

This module installs a universal C<new> method.  When called, it loads the
invoking module like C<require> would.  If the module has a C<new> method,
control is transfered to that method.

This is most useful for command line scripts when used via the L<U> shortcut:

  # with -MU

  $ perl -MU -we 'HTTP::Tiny->new->mirror(...)'

  # without -MU

  $ perl -MHTTP::Tiny -we 'HTTP::Tiny->new->mirror(...)'

B<Warning>: Mucking with L<UNIVERSAL> is a potentially fragile, global hack
that could have unintended consequences.  B<You should not use it in production
unless you are willing to accept that risk.>

=head1 SEE ALSO

=for :list
* L<http://neilb.org/reviews/module-loading.html|CPAN modules that (can) load other modules> by Neil Bowers

=cut

# vim: ts=4 sts=4 sw=4 et:
