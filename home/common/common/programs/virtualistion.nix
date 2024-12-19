{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lazydocker
    podman
    podman-tui
    podman-compose
  ];
}
