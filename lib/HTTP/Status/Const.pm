package HTTP::Status::Const;

use v5.10.0;

use strict;
use warnings;

use version 0.77; our $VERSION = version->declare('v0.2.0');

use Const::Exporter;
use HTTP::Status ();
use Package::Stash;

=head1 NAME

HTTP::Status::Const - interpolable HTTP status constants

=for readme plugin version

=head1 SYNOPSIS

  use HTTP::Status::Const;

  ...

  $response->status( $HTTP_NOT_FOUND );

  ...

  my %handlers => (
    $HTTP_OK      => sub { ... },
    $HTTP_CREATED => sub { ... },
    ...
  );

=head1 DESCRIPTION

This module is basically a wrapper around L<HTTP::Status> that allows
you to use the constants as read-only scalar variables instead of
function names.

This means the constants can be used in contexts where you need
interpolated variables, such as hash keys or in strings.

=begin :readme

See the L<Pod::Readme> documentation for more details on the POD
syntax that this module recognizes.

See L<pod2readme> for command-line usage.

=head1 INSTALLATION

See
L<How to install CPAN modules|http://www.cpan.org/modules/INSTALL.html>.

=for readme plugin requires heading-level=2 title="Required Modules"

=for readme plugin changes

=end :readme

=head1 SEE ALSO

L<HTTP::Status>

=head1 AUTHOR

Robert Rothenberg, C<< <rrwo at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2014 Robert Rothenberg.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

=for readme stop

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=for readme continue

=cut

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
