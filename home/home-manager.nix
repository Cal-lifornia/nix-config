{ isDesktop, inputs, ... }:
{
  pkgs,
  lib,
  username,
  ...
}:

let
  isMac = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
  isLinuxDesktop = isLinux && isLinuxDesktop;
in
{

  programs = {
    home-manager.enable = true;
  };
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    (import ./programs {
      inherit isMac;
      inherit isLinux;
      inherit isLinuxDesktop;
      inherit isDesktop;
    })
  ];

  home = {
    username = "${username}";
    homeDirectory = if isLinux then "/home/${username}" else "/Users/${username}";
  };

  home.stateVersion = "24.11";
}
