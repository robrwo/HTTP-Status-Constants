package HTTP::Status::Constants;

use strict;
use warnings;

use version 0.77; our $VERSION = version->declare('v0.2.0');

use Exporter qw/ import /;
use HTTP::Status::Const qw/ :all /;

our @EXPORT;
our @EXPORT_OK;
our %EXPORT_TAGS;

BEGIN {
  *EXPORT = \@HTTP::Status::Const::EXPORT;
  *EXPORT_OK = \@HTTP::Status::Const::EXPORT_OK;
  *EXPORT_TAGS = \%HTTP::Status::Const::EXPORT_TAGS;
}

=head1 NAME

HTTP::Status::Constants - deprecated

=head1 DESCRIPTION

This module is deprecated. Use L<HTTP::Status::Const> instead.

=cut

1;


