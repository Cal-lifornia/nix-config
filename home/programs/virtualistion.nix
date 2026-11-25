{
  pkgs,
  isLinuxDesktop,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    lazydocker
    # podman
    # podman-tui
    # podman-compose
  ];

  home.file = lib.optionalAttrs isLinuxDesktop {
    ".local/scripts/vfio-binds" = {
      source = ./scripts/vfio-binds.sh;
      executable = true;
    };
  };

  home.shellAliases = lib.optionalAttrs isLinuxDesktop {
    vfio-binds = "~/.local/scripts/vfio-binds";
  };
}
