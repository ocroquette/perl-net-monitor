package Sensors::Ping;

use parent 'Sensors::Base';
use strict;
use File::Spec;

sub new {
  return bless {}, shift;
};

sub configure {
  my $self = shift;
  $self->{host} = shift ;
}

sub do {
  my $self = shift;
  my $status = ( $self->check() ? "OK" : "NOK");
  $self->log("Ping", $status, $self->{host});
}

sub check {
  my $self = shift;
  my @cmd = qw/ping -o -c 1 -t 2/;
  push @cmd, $self->{host};

  # Discard STDOUT
  open my $saveout, ">&STDOUT";
  open STDOUT, '>', File::Spec->devnull();

  my $code = system(@cmd);

  # Restore STDOUT
  open STDOUT, ">&", $saveout;
  return ($code == 0);
}

1;
