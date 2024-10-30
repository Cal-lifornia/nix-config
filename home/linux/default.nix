{
  hyprland,
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./programs
    hyprland.homeManagerModules.default
    ./scripts
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

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
        wofi
        nitch
        wget
        grim
        slurp
        pamixer
        mpc-cli
        tty-clock
        btop
        tokyo-night-gtk

      ])
      ++ (with pkgs.gnome; [
        nautilus
        zenity
        gnome-tweaks
        eog
      ]);
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
