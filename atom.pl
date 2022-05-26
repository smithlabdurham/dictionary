$gist_path = "https://gist.githubusercontent.com/ms609/b4fb9f3bf414261615dc1ba3ae76fd0a/raw/99b367ed777f494969c332396aecee1d6e5eabe0/settings.json";
open(original, "<", $gist_path) or die $!;
open(modified, ">", "settings.json");

$in_known = 0;
while (<original>) {
  if ($_ == "\t\t\t\"knownWords\": [") {
    print modified $_;
    open(dictionary, "<", "WORDLIST.dic") or die $!;
    while (<dictionary>) {
      print modified "\t\t\t\t\"", $_, "\",";
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
