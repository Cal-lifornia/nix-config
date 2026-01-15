{ nixgl, pkgs, ... }:
{
  imports = [
    ./rofi.nix
  ];

  qt.enable = true;
  qt.style.name = "adwaita-dark";
  targets.genericLinux.nixGL.defaultWrapper = "mesa";
  targets.genericLinux.nixGL.packages = nixgl.packages;
  # catppuccin.kvantum = {
  #   enable = true;
  #   apply = true;
  #   flavor = "macchiato";
  # };

}
