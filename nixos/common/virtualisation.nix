{ pkgs, lib, ... }:
{
  virtualisation = {
    docker.enable = true;
    podman = {
      enable = true;
      # dockerCompat = true;

      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
