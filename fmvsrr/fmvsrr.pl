#!/usr/bin/perl
use strict;
no warnings;
use utf8;

=head1 Description
Configuration Cost Comparison.
BGP as iGP with next-hop-self in a fully connected mesh
vs
BGP as iGP with next-hop-self with 2 Route Reflectors.

L< http://sl.ipduh.com/fmvsrr >

=cut

=head1 Author
g0 , L< http://ipduh.com/contact >
=cut

my $USAGE = <<"EOU";
=head1 Usage
% fmvsrr n
Prints a table with the configuration cost for all numbers of routers from 2 to n.
More at http://sl.ipduh.com/fmvsrr

=cut
EOU


my $n= $ARGV[0];


if(@ARGV != 1 || $n !~ /\d+/){
  for my $line (split /\n/,$USAGE){
    print "$line\n" unless ($line =~ /^=.*/);
  }
  exit 3;
}

if($n < 2){
  print "No point in doing any of these setups if there is only one router in the AS.\n";
  exit 0;
}

print <<EOHD;
N    = Number of routers
Πfm  = Maintenance Cost in a Fully Connected Mesh
Πrr  = Maintenance Cost in a Two Route Reflectors Setup
Kfm  = Total Configuration Cost in a Fully Connected Mesh
Krr  = Total Configuration Cost in a Two Route Reflectors Setup
Nfm  = Cost of adding one router in a Fully Connected Mesh
Nrr  = Cost of adding one router in a Two Route Reflectors Setup
EOHD

print "\n\n";
print "N=2\tΠfm=2\t\tΠrr=2+\t\tKfm=2\t\tKrr=2+\t\tNfm=2\t\tNrr=2+\n" if($n > 1);
print "N=3\tΠfm=3\t\tΠrr=3+\t\tKfm=6\t\tKrr=3+\t\tNfm=6\t\tNrr=3\n" if($n > 2);

if($n > 3){
  for(my $i=4; $i<=$n; $i++){
    print "Ν=$i \tΠfm=", ($i*$i-$i)/2 , "\t\tΠrr=", $i+2 , "\t\tKfm=",$i*($i-1),"\t\tKrr=",2*$i+1,"\t\tNfm=",2*($i-1),"\t\tNrr=3\n";
  }
}

exit 0;
