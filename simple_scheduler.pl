package AsyncCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 18 }, $class;
}

sub encode_service {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 18) % 997;
    }
    return $value;
}

print AsyncCache->new->encode_service(18), "\n";
1;
