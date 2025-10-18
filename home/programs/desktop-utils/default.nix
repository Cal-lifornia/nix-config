{ pkgs, ... }:
{
  imports = [
    ./rofi.nix
  ];

  qt.enable = true;
  qt.style.name = "adwaita-dark";
  # catppuccin.kvantum = {
  #   enable = true;
  #   apply = true;
  #   flavor = "macchiato";
  # };

}
