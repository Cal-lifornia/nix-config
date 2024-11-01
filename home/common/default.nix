{ hyprland, pkgs, ... }:
{

  imports = [
    ./common
  ];
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
