package HybridCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 44 }, $class;
}

sub sync_session {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 44) % 997;
    }
    return $count;
}

print HybridCollector->new->sync_session(44), "\n";
1;
