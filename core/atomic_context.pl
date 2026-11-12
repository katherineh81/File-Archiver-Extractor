package FastRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 15 }, $class;
}

sub dispatch_manager {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 15) % 997;
    }
    return $acc;
}

print FastRegistry->new->dispatch_manager(15), "\n";
1;
