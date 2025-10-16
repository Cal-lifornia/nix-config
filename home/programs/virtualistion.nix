{
  pkgs,
  isLinuxDesktop,
  lib,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      lazydocker
      podman
      podman-tui
      podman-compose
    ]
    ++ (lib.optionals isLinuxDesktop [
      # dnsmasq
    ]);
}
