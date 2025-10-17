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

  home.file =
    if isLinuxDesktop then
      {
        ".local/scripts/vfio-binds" = {
          source = ./scripts/vfio-binds.sh;
          executable = true;
        };

      }
    else
      { };

  home.shellAliases =
    if isLinuxDesktop then
      {
        vfio-binds = "~/.local/scripts/vfio-binds";
      }
    else
      { };
}
