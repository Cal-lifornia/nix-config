{
  modulesPath,
  config,
  pkgs,
  username,
  ...
}:
{
  imports = [
    # Include the default lxc/lxd configuration.
    ../../nixos/common

  ];

  system.stateVersion = "24.11";
  wsl.enable = true;
  wsl.defaultUser = "${username}";
}
