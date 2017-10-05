use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Test::Deep;

use Data::Fake::Phone;

subtest 'fake_uk_local_phone_number' => sub {
    for my $i ( 0 .. 5 ) {
        my $got = Data::Fake::Phone::fake_uk_phone_number()->();
        like( $got, qr/20 7946 0\d{3}/, "like $i" );
    }
};

done_testing;

# COPYRIGHT

# vim: ts=4 sts=4 sw=4 et tw=75:
