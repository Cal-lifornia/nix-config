let
  configDir = ../configs;
in
{
  hyprland,
  pkgs,
  ...
}:
{
  imports = [
    ./hypr
    ./media
    ./utils
    ./scripts
    ./browsers
    ./swww
    ../../common/desktop
    ./gtk
    ./gaming
    ./dev
    hyprland.homeManagerModules.default
  ];
  home = {
    packages = (
      with pkgs;
      [
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
      ]
    );

    file = {
      ".config/hypr".source = "${configDir}/hypr";
      ".config/wlogout".source = "${configDir}/wlogout";
      ".config/wofi".source = "${configDir}/wofi";
      ".config/waybar".source = "${configDir}/waybar";
      ".config/satty".source = "${configDir}/satty";
      ".config/swww/swww_randomize_multi.sh" = {
        source = "${configDir}/swww/swww_randomize_multi.sh";
        executable = true;
      };
    };
  };
}
