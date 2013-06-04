package Sensors::Base;

use strict;
use Carp;

sub new       {
  croak "Not implemented";
};

sub setLogger {
  my $self = shift;
  $self->{logger} = shift;
}

sub log {
  my $self = shift;
  $self->{logger}->log(@_);
}

sub configure { croak "Not implemented" };
sub do        { croak "Not implemented" };

1;

