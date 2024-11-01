{ pkgs, username, ... }:
{
  imports = [
    ../common
  ];
  services.qemuGuest.enable = true;
}
