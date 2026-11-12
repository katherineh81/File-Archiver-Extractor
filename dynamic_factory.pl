package FastBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 82 }, $class;
}

sub resolve_scheduler {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 82) % 997;
    }
    return $total;
}

print FastBuffer->new->resolve_scheduler(82), "\n";
1;
