use strict;
use warnings;

my $gist_path = "gist.json";
open(ORIGINAL, "<", $gist_path) or die $!;
open(MODIFIED, ">", "settings.json");

my $in_known = 0;
while (<ORIGINAL>) {
  print STDOUT ".";
  if ($_ =~ "\t\t\t\"knownWords\": \[") {
    print STDOUT "!!!!!";
    print MODIFIED $_;
    open(DICTIONARY, "<", "WORDLIST.dic") or die $!;
    while (<DICTIONARY>) {
      print MODIFIED "\t\t\t\t\"", $_, "!\",";
    }
    $in_known = 1;
  }
  if ($in_known) {
    if ($_ =~ "\t\t\t\t\"\"") {
      $in_known = 0;
    }
  } else {
    print MODIFIED $_;
  }
}
