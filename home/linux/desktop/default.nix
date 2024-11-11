let
  configDir = ../configs;
in
{
  hyprland,
  pkgs,
  username,
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
        vscode
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
        btop

        insomnia
        parsec-bin
        _1password-gui
        nautilus
        zenity
        gnome-tweaks
        eog
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
