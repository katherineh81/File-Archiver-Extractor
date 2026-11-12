package SimpleResolver;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 68 }, $class;
}

sub collect_processor {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 68) % 997;
    }
    return $total;
}

print SimpleResolver->new->collect_processor(68), "\n";
1;
