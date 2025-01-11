{ pkgs-unstable, lib, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs-unstable.steam;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;

      gamescopeSession.enable = true;

      extraCompatPackages = [
        pkgs-unstable.proton-ge-bin
      ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };
}
