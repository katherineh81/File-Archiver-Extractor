package LocalContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 89 }, $class;
}

sub encode_client {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 89) % 997;
    }
    return $acc;
}

print LocalContext->new->encode_client(89), "\n";
1;
