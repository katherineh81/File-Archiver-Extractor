package LocalAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 86 }, $class;
}

sub encode_provider {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 86) % 997;
    }
    return $total;
}

print LocalAdapter->new->encode_provider(86), "\n";
1;
