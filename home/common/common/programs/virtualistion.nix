{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    lazydocker
    podman
    podman-tui
    podman-compose
    qemu
  ];
}
