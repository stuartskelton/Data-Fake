use 5.008001;
use strict;
use warnings;

package Data::Fake::Phone;
# ABSTRACT: Fake Phone number data generators

our $VERSION = '0.004';

use Exporter 5.57 qw/import/;

our @EXPORT = qw(
  fake_uk_phone_number
);

use Data::Fake::Core  ();


my ( $supported_country_list, $international_codes, $fake_phone_templates );


=func fake_uk_phone_number

    $generator = fake_uk_phone_number();

Returns a generator that randomly creates a UK local (starts with a 0) based phone number, these numbers
are based on the UK telephone numbers from the UK regulator:
https://www.ofcom.org.uk/phones-telecoms-and-internet/information-for-industry/numbering/numbers-for-drama

For an internationalised uk number use C<fake_uk_international_phone_number>

=cut

sub fake_uk_phone_number {
    return sub { Data::Fake::Core::fake_digits($fake_phone_templates->{uk}->{london})->() };
}

$supported_country_list = [
    'uk'
];

$international_codes = {
    uk => '44'
};

$fake_phone_templates = {
    uk => {
        birmingham       => '121 496 0###',
        bristol          => '117 496 0###',
        cardiff          => '29 2018 0###',
        edinburgh        => '131 496 0###',
        glasgow          => '141 496 0###',
        manchester       => '161 496 0###',
        leeds            => '113 496 0###',
        leicester        => '116 496 0###',
        liverpool        => '151 496 0###',
        london           => '20 7946 0###',
        northern_ireland => '28 9649 6###',
        nottingham       => '115 496 0###',
        reading          => '118 496 0###',
        sheffield        => '114 496 0###',
        tyneside         => '191 498 0###',

        no_area   => '1632 960###',
        mobile    => '7700 900###',
        freephone => '8081 570###',
        premium   => '909 8790###',
        uk_wide   => '3069 990###'
    }
};

=for Pod::Coverage BUILD

=head1 SYNOPSIS

    use Data::Fake::Internet;

    fake_tld()->();     # .gov, etc.
    fake_domain()->();  # atqueaut.gov, etc.
    fake_email()->();   # john.smith@atqueaut.gov, etc.

=head1 DESCRIPTION

This module provides fake data generators for Internet-related data.

All functions are exported by default.

=cut

# vim: ts=4 sts=4 sw=4 et tw=75:
