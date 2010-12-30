# 
# Copyright (C) 2010, Jens Luedicke <jensl@cpan.org>.
# 
# This module is free software; you can redistribute it and/or modify 
# it under the same terms as Perl 5.10.0. For more details, see the
# full text of the licenses in the directory LICENSES.

# This program is distributed in the hope that it will be
# useful, but without any warranty; without even the implied
# warranty of merchantability or fitness for a particular purpose.

package Class::Bind;
use base qw(Exporter);

use strict;
use warnings;

use Class::Bind::Argument;

our $VERSION = '0.2';
our $DEBUG = 0;

our @EXPORT   = qw(bind _1 _2 _3 _4 _5 _6 _7 _8 _9 _10);

sub bind {
    my ($func, @args) = @_;

    my $functor = sub {
        my (@arguments) = @_;
        my @processed_arguments = @args; 
        
        foreach my $arg (@processed_arguments) { 
            if (ref($arg) eq "Class::Bind::Argument") {
                $arg = $arguments[$$arg-1];
            }
        }

        &{*$func}(@processed_arguments);
    };

    return $functor;
}

1;

=head1 NAME

Class::Bind - bind arguments to functions.

=head1 SYNOPSIS

    use Class::Bind;

    my $object = MyPackage->new;
    my $functor = bind(\*MyPackage::method, $object, _1, _2);

$functor can be called as a function with two arguments:

    &$functor("argument1", 2);

The functor will call

    $object->method("argument1", 2);

=head1 DESCRIPTION

Class::Bind provides a bind function which can bind arguments and placeholders
to methods and other functions. The resulting anonymous function reference
can be passed as a callback to other functions.

The functionality is similar to the Bind C++ library from Boost L<http://boost.org/>

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
