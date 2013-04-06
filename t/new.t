use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Test::Fatal;
use Test::FailWarnings;

use UNIVERSAL::new;

my $err;

my $obj = Digest::MD5->new;
isa_ok( $obj, 'Digest::MD5' );

$err = exception { DoesNotExist->new };
like( $err, qr/Can't locate DoesNotExist\.pm/, "missing module croaks" );

$err = exception { File::Spec->new };
like( $err, qr/Can't locate object method new/, "missing new method croaks" );

done_testing;
# COPYRIGHT
# vim: ts=4 sts=4 sw=4 et:
