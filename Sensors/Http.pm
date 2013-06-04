package Sensors::Http;

use parent 'Sensors::Base';
use strict;

sub new       {
  return bless {}, shift;
};

sub configure {
  my $self = shift;
  $self->{host} = shift;
}

sub do {
  my $self = shift;
  $self->log("Http", "OK", $self->{host});
}

1;
