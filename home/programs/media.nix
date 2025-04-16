{
  pkgs,
  isLinuxDesktop,
  isDesktop,
  ...
}:
# media - control and enjoy audio/video
{
  # imports = [
  # ];

  home.packages =
    with pkgs;
    [

    ]
    ++ (lib.optionals isDesktop [
      spotify
    ])
    ++ (lib.optionals isLinuxDesktop [
      # audio control
      pavucontrol
      playerctl
      pulsemixer
      # images
      imv
      spotifywm
      pavucontrol
      gimp

      # music
      cider-2

    ]);

  programs = {
    mpv = {
      enable = if isLinuxDesktop then true else false;
      defaultProfiles = [ "gpu-hq" ];
      #scripts = [pkgs.mpvScripts.mpris];
    };

    obs-studio.enable = if isLinuxDesktop then true else false;
  };

  services = {
    playerctld.enable = if isLinuxDesktop then true else false;
  };
}
