package Tenjin::Preprocessor;

use strict;
use warnings;

our $VERSION = "0.070001";
$VERSION = eval $VERSION;

our @ISA = ('Tenjin::Template');

=head1 NAME

Tenjin::Preprocessor - Preprocessing Tenjin templates

=head1 VERSION

version 0.070001

=head1 SYNOPSIS

	used internally.

=head1 DESCRIPTION

This module provides some methods needed for preprocessing templates.

=head1 INTERNAL METHODS

=head2 stmt_pattern()

=cut

sub stmt_pattern {
	return shift->SUPER::compile_stmt_pattern('PL');
}

=head2 expr_pattern()

=cut

sub expr_pattern {
	return qr/\[\*=(=?)(.*?)(=?)=\*\]/s;
}

=head2 add_expr()

=cut

sub add_expr {
	my ($self, $bufref, $expr, $flag_escape) = @_;

	$expr = "decode_params($expr)";
	$self->SUPER::add_expr($bufref, $expr, $flag_escape);
}

1;

=head1 SEE ALSO

L<Tenjin>, L<Tenjin::Template>.

=head1 AUTHOR

The CPAN version of Tenjin was forked by Ido Perlmuter E<lt>ido at ido50.netE<gt>
from version 0.0.2 of the original plTenjin, which is developed by Makoto Kuwata
at L<http://www.kuwata-lab.com/tenjin/>.

Development of Tenjin is done with github at L<http://github.com/ido50/Tenjin>.

=head1 LICENSE AND COPYRIGHT

Tenjin is licensed under the MIT license.

	Copyright (c) 2007-2010 the aforementioned authors.

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut