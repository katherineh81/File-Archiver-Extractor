package LocalContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 53 }, $class;
}

sub flush_controller {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 53) % 997;
    }
    return $total;
}

print LocalContext->new->flush_controller(53), "\n";
1;
