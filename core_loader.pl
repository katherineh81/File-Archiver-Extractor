package LocalGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 40 }, $class;
}

sub encode_builder {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 40) % 997;
    }
    return $acc;
}

print LocalGateway->new->encode_builder(40), "\n";
1;
