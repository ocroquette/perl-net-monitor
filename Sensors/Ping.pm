package Sensors::Ping;

use parent 'Sensors::Base';
use strict;

sub new {
  return bless {}, shift;
};

sub configure {
  my $self = shift;
  $self->{host} = shift ;
}

sub do {
  my $self = shift;
  $self->log("Ping", "OK", $self->{host});
}

1;
