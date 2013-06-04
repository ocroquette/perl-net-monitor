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

sub do {
  my $self = shift;
  # $self->log("Http", "OK", $self->{host});
  
  my $socket = IO::Socket::INET->new(
    PeerAddr => $self->{host},
    PeerPort => 80,
    Proto    => 'tcp',
  ) or die("Error :: $!");

  print($socket "GET / HTTP/1.1\n");
  print($socket "Host: " . $self->{host} ."\n");
  print($socket "\n");
  my $received = <$socket>;
  # print $received;

  
  my $status = ( $received =~ /^HTTP.... [23]/ ? "OK" : "NOK" );
  $self->log("Http", $status, $self->{host});
}

1;
