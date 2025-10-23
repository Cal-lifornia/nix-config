{ nixgl, pkgs, ... }:
{
  imports = [
    ./rofi.nix
  ];

  qt.enable = true;
  qt.style.name = "adwaita-dark";
  nixGL.defaultWrapper = "mesa";
  nixGL.packages = nixgl.packages;
  # catppuccin.kvantum = {
  #   enable = true;
  #   apply = true;
  #   flavor = "macchiato";
  # };

}
