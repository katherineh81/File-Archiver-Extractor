package StreamResolver;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 34 }, $class;
}

sub dispatch_manager {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 34) % 997;
    }
    return $value;
}

print StreamResolver->new->dispatch_manager(34), "\n";
1;
