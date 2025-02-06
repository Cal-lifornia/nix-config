{
  config,
  lib,
  pkgs,
  ...
}:
let
  catppuccin-gtk = pkgs.catppuccin-gtk.overrideAttrs {
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "gtk";
      rev = "v1.0.3";
      fetchSubmodules = true;
      hash = "sha256-q5/VcFsm3vNEw55zq/vcM11eo456SYE5TQA3g2VQjGc=";
    };

    postUnpack = "";
  };
in
{
  imports = [
    ./environment.nix
    ./stylix.nix
  ];
  home = {
    packages = with pkgs; [
      viewnior
      bibata-cursors
    ];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  gtk = {
    enable = true;
    font = {
      name = "Noto Sans";
      size = 12;
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    theme = {
      name = "catppuccin-macchiato-teal-compact";
      package = catppuccin-gtk.override {
        accents = [ "teal" ];
        variant = "macchiato";
        size = "compact";
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
        gtk-cursor-theme-name=catppuccin-macchiato-blue-cursors
      '';
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
