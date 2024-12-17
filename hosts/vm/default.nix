{
  modulesPath,
  config,
  pkgs,
  ...
}:
{
  imports = [
    # Include the default lxc/lxd configuration.
    ../../nixos/server
  ];

  system.stateVersion = "24.11";
}
