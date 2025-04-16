{
  imports = [
    # Include the default lxc/lxd configuration.
    ../nixos/vm

  ];

  system.stateVersion = "24.11";
  services.qemuGuest.enable = true;
  users.users.root.password = "";
}
