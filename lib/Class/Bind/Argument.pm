# 
# Copyright (C) 2010, Jens Luedicke <jensl@cpan.org>.
# 
# This module is free software; you can redistribute it and/or modify 
# it under the same terms as Perl 5.10.0. For more details, see the
# full text of the licenses in the directory LICENSES.

# This program is distributed in the hope that it will be
# useful, but without any warranty; without even the implied
# warranty of merchantability or fitness for a particular purpose.

package Class::Bind::Argument;
use base qw(Exporter);

use strict;
use warnings;

our @EXPORT = qw(_1 _2 _3 _4 _5 _6 _7 _8 _9 _10);

sub _1 { return Class::Bind::Argument->new(1); }
sub _2 { return Class::Bind::Argument->new(2); }
sub _3 { return Class::Bind::Argument->new(3); }
sub _4 { return Class::Bind::Argument->new(4); }
sub _5 { return Class::Bind::Argument->new(5); }
sub _6 { return Class::Bind::Argument->new(6); }
sub _7 { return Class::Bind::Argument->new(7); }
sub _8 { return Class::Bind::Argument->new(8); }
sub _9 { return Class::Bind::Argument->new(9); }
sub _10 { return Class::Bind::Argument->new(10); }

sub new {
    my ($class,$num) = @_;
    my $self = bless \$num, $class;

    return $self;
}

sub num {
    my ($self) = @_;
    return $$self;
}

1;

=head1 NAME

Class::Bind::Argument - helper class to create placeholder arguments.

=head1 DESCRIPTION

This module is used by Class::Bind.

=head1 BUGS

Please mail the author if you encounter any bugs.

=head1 AUTHOR

Jens Luedicke E<lt>jensl@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENCE

Copyright (C) 2010, Jens Luedicke E<lt>jensl@cpan.orgE<gt>.

This module is free software; you can redistribute it and/or modify 
it under the same terms as Perl 5.10.0. For more details, see the
full text of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be
useful, but without any warranty; without even the implied
warranty of merchantability or fitness for a particular purpose.
