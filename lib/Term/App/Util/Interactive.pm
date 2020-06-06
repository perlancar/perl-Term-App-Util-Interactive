package Term::App::Util::Interactive;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

our %SPEC;

$SPEC{term_app_is_interactive} = {
    v => 1.1,
    summary => 'Determine whether terminal application is running interactively',
    args => {},
    description => <<'_',

Try to determine whether terminal application is running interactively. Will
first check the INTERACTIVE environment variable, and use that if defined.
Otherwise will check using C<-t STDOUT>.

_
};
sub term_app_is_interactive {
    my $self = shift;
    if (defined $ENV{INTERACTIVE}) {
        $self->{_termattr_debug_info}{interactive_from} = 'INTERACTIVE env';
        return $ENV{INTERACTIVE};
    } else {
        $self->{_termattr_debug_info}{interactive_from} = '-t STDOUT';
        return (-t STDOUT);
    }
}

1;
# ABSTRACT:

=head1 DESCRIPTION


=head1 ENVIRONMENT

=head2 INTERACTIVE


=head1 SEE ALSO

Other C<Term::App::Util::*> modules.
