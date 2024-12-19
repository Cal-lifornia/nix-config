{
  modulesPath,
  config,
  pkgs,
  ...
}:
{
  imports = [
    # Include the default lxc/lxd configuration.
    ../../nixos/vm
  ];

  system.stateVersion = "24.11";
}
