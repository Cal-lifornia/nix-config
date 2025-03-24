{ pkgs, ... }:
{
  imports = [
    ./gamedev.nix
  ];

  home.packages = with pkgs; [
    podman-desktop
    insomnia
    vscode
  ];
}
