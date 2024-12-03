{
  pkgs,
  ...
}:
let
  swappy = import (
    pkgs.fetchFromGithub {
      owner = "jtheoof";
      repo = "swappy";
      rev = "v1.5.1";
      sha256 = "";
    }
  );
in
{
  home.packages = [
    swappy
  ];
}
