{
  stylix,
  pkgs,
  pkgs-stable,
  ...
}:
{
  home.packages = with pkgs-stable; [
    base16-schemes
  ];

  stylix = {
    enable = true;
    image = ./elden-ring-title.jpg;
    autoEnable = true;
    polarity = "dark";
    # base16Scheme = "${pkgs-stable.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
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
      dunst.enable = false;
      cava.enable = false;
      kitty.enable = false;
      alacritty.enable = false;
      bat.enable = false;
      helix.enable = false;
      yazi.enable = false;
      zellij.enable = false;
    };
  };

}
