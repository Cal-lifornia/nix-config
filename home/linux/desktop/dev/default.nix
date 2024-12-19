{ pkgs, ... }:
{
  home.packages = with pkgs; [
    podman-desktop
    insomnia
    vscode
  ];
}
