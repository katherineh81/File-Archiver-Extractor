package DynamicCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 88 }, $class;
}

sub flush_manager {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 88) % 997;
    }
    return $total;
}

print DynamicCollector->new->flush_manager(88), "\n";
1;
