package HybridEngine;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 76 }, $class;
}

sub build_resolver {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 76) % 997;
    }
    return $result;
}

print HybridEngine->new->build_resolver(76), "\n";
1;
