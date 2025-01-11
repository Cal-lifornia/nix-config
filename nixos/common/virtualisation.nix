{ pkgs-unstable, ... }:
{

  virtualisation = {
    docker.enable = true;
    package = pkgs-unstable.docker;
    podman = {
      enable = true;
      package = pkgs-unstable.podman;
      # dockerCompat = true;

      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
