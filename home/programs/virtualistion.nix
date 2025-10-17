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
        ".local/scripts/vfio_binds" = {
          source = "./scripts/vfio_binds";
          executable = true;
        };

      }
    else
      { };

  home.shellAliases =
    if isLinuxDesktop then
      {
        vfio_binds = "~/.local/scripts/vfio_binds";
      }
    else
      { };
}
