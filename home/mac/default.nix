{ pkgs, username, ... }:
{
  home = {
    username = "${username}";
    homeDirectory = "/Users/${username}";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
