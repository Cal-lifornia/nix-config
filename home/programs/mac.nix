{ pkgs, ... }:
{

  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      !include ./extra.conf
      experimental-features = nix-command flakes
    '';
  };
}
