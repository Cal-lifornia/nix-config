{
  pkgs,
  cosmic,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    base16-schemes
    bibata-cursors
    adwaita-icon-theme # default gnome cursors
    glib
    gsettings-desktop-schemas
  ];

  stylix = {
    enable = true;
    image = ./elden-ring-title.jpg;
    # autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    homeManagerIntegration.followSystem = false;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 14;
    };
    fonts = {
      # packages = with pkgs; [
      #   # icon fonts
      #   material-design-icons

      #   # normal fonts
      #   noto-fonts
      #   noto-fonts-cjk-sans
      #   noto-fonts-emoji

      #   # nerdfonts
      #   nerd-fonts.jetbrains-mono
      #   nerd-fonts.fira-code
      #   nerd-fonts.roboto-mono
      # ];
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {

        package = pkgs.noto-fonts-cjk-sans;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    targets = {
      gtk.enable = if cosmic then true else false;
    };
  };
}
