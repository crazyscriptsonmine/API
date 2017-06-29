#1/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $usage = "specify the gene symbol to get the entrez id:\n\t $0 <genename>\n";
my $i = $ARGV[0];
@ARGV == 1 or die $usage;

my $einfo = "https://www.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=gene&term=".$i.'[sym]+and+"Gallus%20gallus"[organism]';
my $getinfo = get($einfo);

$getinfo =~ /Id>(\d+)<\/Id.*/;
my $all = $1;
if ($all) {
	print $all;
} else { print "";}
#print $getinfo;
