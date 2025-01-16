{ pkgs, lib, ... }:
{
  imports = [
    ./terminal
  ];
  home.packages = with pkgs; [
    virtualbox
  ];
}
