{ isDesktop, inputs, ... }:
{ pkgs, lib, ... }:

let
  isMac = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
  isLinuxDesktop = isLinux && isLinuxDesktop;
in
{

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.11";
}
