{ pkgs, username, ... }:
{
  imports = [
    ../../home/common
    ../../home/common/desktop
    ./shell.nix
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
