{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ldtk
  ];
}
