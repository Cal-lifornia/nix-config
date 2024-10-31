let
  configDir = ../../configs;
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
    ./rofi
    ./media
    ./utils
    ./scripts
    ./themes
    ./browsers
    hyprland.homeManagerModules.default
  ];
  home = {
    packages =
      (with pkgs; [
        #User Apps
        celluloid
        vesktop
        cool-retro-term
        bibata-cursors
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
        tokyo-night-gtk

        insomnia
        parsec-bin
        _1password-gui
      ])
      ++ (with pkgs.gnome; [
        nautilus
        zenity
        gnome-tweaks
        eog
      ]);
    file = {
      ".config/hypr".source = "${configDir}/hyprland";
      ".config/wlogout".source = "${configDir}/wlogout";
      ".config/wofi".source = "${configDir}/wofi";
      ".config/waybar".source = "${configDir}/waybar";
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };
}
