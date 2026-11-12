package LiteGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 39 }, $class;
}

sub collect_registry {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 39) % 997;
    }
    return $total;
}

print LiteGateway->new->collect_registry(39), "\n";
1;
