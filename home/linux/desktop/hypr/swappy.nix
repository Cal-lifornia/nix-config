{
  pkgs,
  ...
}:
let
  swappy = import (
    pkgs.fetchFromGitHub {
      owner = "jtheoof";
      repo = "swappy";
      rev = "v1.5.1";
      sha256 = "sha256-/XPvy98Il4i8cDl9vH6f0/AZmiSqseSXnen7HfMqCDo=";
    }
  );
in
{
  home.packages = [
    swappy
  ];
}
