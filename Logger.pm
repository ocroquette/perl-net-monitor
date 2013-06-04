package Logger;

use strict;
use POSIX qw(strftime);

sub new {
  return bless {}, shift;
};


sub timestamp {
  my $now = time();
  # We need to munge the timezone indicator to add a colon between the hour and minute part
  my $tz = strftime("%z", localtime($now));
  $tz =~ s/(\d{2})(\d{2})/$1:$2/;
  # ISO8601
  return strftime("%Y-%m-%dT%H:%M:%S", localtime($now)) . $tz;
  # RFC822 (actually RFC2822, as the year has 4 digits)
  # print strftime("%a, %d %b %Y %H:%M:%S %z", localtime($now)) . "\n";
}

sub log {
  my $self = shift;
  print join("\t", timestamp(), @_) . "\n";
}

1;
