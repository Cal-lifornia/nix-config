let
  configDir = ../configs;
in
{
  pkgs,
  lib,
  isDesktop,
  isMac,
  isLinux,
  isLinuxDesktop,
  hyprland,
  ...
}:
{
  imports =
    [
      ./shells
      ./dev
      ./multiplexers
    ]
    ++ (lib.optionals isDesktop [
      ./terminals
    ])
    ++ (lib.optionals isLinuxDesktop [
      hyprland.homeManagerModules.default
      ./hypr
      ./desktop-utils
      ./desktop-theming
    ])
    ++ (lib.optionals isMac [
      ./mac.nix
    ]);

  home.file =
    {
      ".config/themes".source = "${configDir}/themes";
      ".config/nvim".source = "${configDir}/nvim";
      ".config/zellij".source = "${configDir}/zellij";
    }
    // (
      if isLinuxDesktop then
        {

          ".config/hypr".source = "${configDir}/hypr";
          ".config/wlogout".source = "${configDir}/wlogout";
          ".config/wofi".source = "${configDir}/wofi";
          ".config/waybar".source = "${configDir}/waybar";
          ".config/satty".source = "${configDir}/satty";
          ".config/swww/swww_randomize_multi.sh" = {
            source = "${configDir}/swww/swww_randomize_multi.sh";
            executable = true;
          };
        }
      else
        { }
    );
  home.packages =
    with pkgs;
    [
    ]
    ++ (lib.optionals isDesktop [
      obsidian
      zoom-us
      gifski
    ])
    ++ (lib.optionals isLinux [
      gnumake
      nano
      wget
      sysz
    ])
    ++ (lib.optionals isLinuxDesktop [
      virtualbox
      #User Apps
      celluloid
      vesktop
      cool-retro-term
      lollypop
      lutris
      openrgb
      nwg-look

      #misc
      nano
      nitch
      grim
      slurp
      pamixer
      mpc-cli
      tty-clock
      gearlever

      parsec-bin
      _1password-gui
      zenity
      gnome-tweaks
      eog
      libreoffice-qt6-fresh
    ]);

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
}
