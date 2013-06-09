package Sensors::Http;

use parent 'Sensors::Base';
use strict;
use IO::Socket::INET;

sub new       {
  return bless {}, shift;
};

sub configure {
  my $self = shift;
  $self->{host} = shift;
}

sub check {
  my $self = shift;
  
  my $socket = IO::Socket::INET->new(
    PeerAddr => $self->{host},
    PeerPort => 80,
    Proto    => 'tcp',
  ) || return 0;

  print($socket "GET / HTTP/1.1\n");
  print($socket "Host: " . $self->{host} ."\n");
  print($socket "\n");

  $socket->timeout(2);

  my $received = <$socket>;
  
  return ( $received =~ /^HTTP.... [23]/ ? "OK" : "NOK" );
}

sub do {
  my $self = shift;
  my $status = ( $self->check() ? "OK" : "NOK");
  $self->log("Http", $status, $self->{host});
}
1;
