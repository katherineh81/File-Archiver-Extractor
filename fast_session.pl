package SharedBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 74 }, $class;
}

sub compute_monitor {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 74) % 997;
    }
    return $count;
}

print SharedBuilder->new->compute_monitor(74), "\n";
1;
