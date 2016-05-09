#!/usr/bin/perl
# copied from https://forum.ubuntu-kr.org/viewtopic.php?f=9&t=8044#p40719
use strict;
use Encode;
use Archive::Zip;
binmode(STDOUT, ":utf8");
my $zip = Archive::Zip->new();
$zip->read($ARGV[0]) == 0 or
   die "$0: couldn't read $ARGV[0]\n";
foreach my $mref ($zip->members) {
    my $n = decode("cp949",$mref->fileName);
    print "Extracting $n\n";
    $zip->extractMember($mref,$n) == 0 or
   die "$0: couldn't extract $n\n";
}
