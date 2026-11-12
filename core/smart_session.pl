package SecureSession;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 85 }, $class;
}

sub fetch_session {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 85) % 997;
    }
    return $total;
}

print SecureSession->new->fetch_session(85), "\n";
1;
