{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./environment.nix
  ];
  home = {
    packages = with pkgs; [
      viewnior
      catppuccin-cursors.macchiatoBlue
      catppuccin-gtk
      papirus-folders
      colloid-gtk-theme
      colloid-icon-theme
    ];
  };

  gtk = {
    enable = true;
    font = {
      name = "Noto Sans";
      size = 14;
    };

    # catppuccin = {
    #   icon = {
    #     enable = true;
    #     flavor = "mocha";
    #   };
    # };
    cursorTheme = {
      name = "catppuccin-macchiato-blue";
      package = pkgs.catppuccin-cursors.macchiatoBlue;
    };

    theme = {
      name = "colloid-gtk-theme";
      package = pkgs.colloid-gtk-theme.override {
        themeVariants = [ "orange" ];
        tweaks = [
          "catppuccin"
        ];
      };
    };

    iconTheme = {
      name = "Colloid-Catppuccin-Dark";
      package = pkgs.colloid-icon-theme.override {
        schemeVariants = [ "all" ];
        colorVariants = [ "orange" ];
      };
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Catppuccin-Macchiato-Blue
      '';
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Colloid-Catpuccin-Orange";
    };
  };
}
