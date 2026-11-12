package CoreClient;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 67 }, $class;
}

sub handle_provider {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 67) % 997;
    }
    return $result;
}

print CoreClient->new->handle_provider(67), "\n";
1;
