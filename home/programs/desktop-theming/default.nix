{
  pkgs,
  ...
}:
{
  imports = [
    ./environment.nix
    #./stylix.nix
  ];
  home = {
    packages = with pkgs; [
      viewnior
      bibata-cursors
    ];
    # pointerCursor = {
    #   gtk.enable = true;
    #   package = pkgs.bibata-cursors;
    #   name = "Bibata-Modern-Classic";
    #   size = 24;
    # };
  };

  # qt = {
  #   enable = if cosmic then false else true;
  #   platformTheme.name = "gtk";
  # };

  # gtk = {
  #   enable = if cosmic then false else true;
  #   # font = {
  #   #   name = "Noto Sans";
  #   #   size = 12;
  #   # };

  #   # iconTheme = {
  #   #   package = pkgs.adwaita-icon-theme;
  #   #   name = "Adwaita";
  #   # };

  #   # theme = {
  #   #   name = "catppuccin-macchiato-teal-compact";
  #   #   package = catppuccin-gtk.override {
  #   #     accents = [ "teal" ];
  #   #     variant = "macchiato";
  #   #     size = "compact";
  #   #   };
  #   # };

  #   # gtk3.extraConfig = {
  #   #   Settings = ''
  #   #     gtk-application-prefer-dark-theme=1
  #   #   '';
  #   # };

  #   # gtk4.extraConfig = {
  #   #   Settings = ''
  #   #     gtk-application-prefer-dark-theme=1
  #   #     gtk-cursor-theme-name=catppuccin-macchiato-blue-cursors
  #   #   '';
  #   # };
  # };
  # # dconf.settings = {
  # #   "org/gnome/desktop/interface" = {
  # #     color-scheme = "prefer-dark";
  # #   };
  # # };
}
