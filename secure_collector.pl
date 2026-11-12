package HybridContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 53 }, $class;
}

sub collect_handler {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 53) % 997;
    }
    return $value;
}

print HybridContext->new->collect_handler(53), "\n";
1;
