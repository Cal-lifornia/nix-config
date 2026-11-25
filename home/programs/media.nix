{
  pkgs,
  lib,
  config,
  isLinuxDesktop,
  ...
}:
# media - control and enjoy audio/video
{
  home.packages =
    with pkgs;
    lib.optionals isLinuxDesktop [
      # audio control
      pavucontrol
      playerctl
      pulsemixer
      # images
      imv
      spotifywm
      gimp
      (config.lib.nixGL.wrap sabnzbd)

      # # music
      # cider-2
      # spotify
    ];

  programs = {
    mpv = {
      enable = isLinuxDesktop;
      defaultProfiles = [ "gpu-hq" ];
      #scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    playerctld.enable = isLinuxDesktop;
  };
}
