{ stylix, pkgs, ... }:
{
  stylix = {
    enable = true;
    # autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schema}/share/themes/catppuccin-macchiato.yaml";
    # targets = {
    #   cavalier.enable = false;
    # };
  };

}
