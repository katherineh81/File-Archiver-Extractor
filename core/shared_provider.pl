package AtomicAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 75 }, $class;
}

sub load_controller {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 75) % 997;
    }
    return $count;
}

print AtomicAdapter->new->load_controller(75), "\n";
1;
