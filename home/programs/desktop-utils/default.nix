{ nixgl, pkgs, ... }:
{
  imports = [
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
