{inputs, ...}
{
  pkgs,
  lib,
  username,
  isLinux
  ...
}:

let
in
{

  programs = {
    home-manager.enable = true;
  };
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./programs
  ];

  home = {
    username = "${username}";
    homeDirectory = if isLinux then "/home/${username}" else "/Users/${username}";
  };

  home.stateVersion = "24.11";
}
