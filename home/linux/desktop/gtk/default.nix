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
    ];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.macchiatoBlue;
      name = "Catppuccin-Macchiato-Blue 24";
      size = 24;
    };
  };

  gtk = {
    font = {
      name = "Noto Sans";
      size = 14;
    };

    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      icon = {
        enable = true;
        flavor = "mocha";
      };
      size = "compact";
    };
    # cursorTheme = {
    #   name = "Catppuccin-Macchiato-Blue";
    #   package = pkgs.catppuccin-cursors.macchiatoBlue;
    # };

    # theme = {
    #   name = "Catppuccin-Macchiato-Compact-Blue-dark";
    #   package = pkgs.catppuccin-gtk.override {
    #     size = "compact";
    #     accents = [ "blue" ];
    #     variant = "macchiato";
    #   };
    # };
    #
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-folders;
    # };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
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
