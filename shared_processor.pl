package SharedCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 8 }, $class;
}

sub handle_manager {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 8) % 997;
    }
    return $total;
}

print SharedCollector->new->handle_manager(8), "\n";
1;
