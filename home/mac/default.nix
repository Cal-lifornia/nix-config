{ pkgs, username, ... }:
{
  imports = [
    ../home.nix
  ];
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
