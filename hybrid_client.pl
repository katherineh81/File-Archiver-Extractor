package SimpleGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 39 }, $class;
}

sub render_monitor {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 39) % 997;
    }
    return $result;
}

print SimpleGateway->new->render_monitor(39), "\n";
1;
