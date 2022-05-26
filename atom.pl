use strict;
use warnings;

$gist_path = "gist.json";
$remote->open(original, "<", $gist_path) or die $!;
open(modified, ">", "settings.json");

$in_known = 0;
while (<original>) {
  if ($_ == "\t\t\t\"knownWords\": [") {
    print modified $_;
    open(dictionary, "<", "WORDLIST.dic") or die $!;
    while (<dictionary>) {
      print modified "\t\t\t\t\"", $_, "!\",";
    }
    $in_known = 1;
  }
  if ($in_known) {
    if ($_ == "\t\t\t\t\"\"") {
      $in_known = 0;
    }
  } else {
    print modified $_;
  }
}
