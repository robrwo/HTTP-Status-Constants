package HTTP::Status::Constants;

use v5.10.0;

use strict;
use warnings;

use version 0.77; our $VERSION = version->declare('v0.1.0');

use Const::Exporter;
use HTTP::Status ();
use Package::Stash;

BEGIN {
  my $stash = Package::Stash->new('HTTP::Status');
  my $syms  = $stash->get_all_symbols('CODE');

  my @exports;

  foreach my $sym (keys %{$syms}) {
    next unless $sym =~ /^HTTP_/;
    my $val = &{$syms->{$sym}};
    push @exports, '$' . $sym => $val;
  }

  Const::Exporter->import( default => \@exports );
}


1;
