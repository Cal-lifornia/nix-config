{ stylix, pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schema}/share/themes/catppuccin-macchiato.yaml";
  };

}
