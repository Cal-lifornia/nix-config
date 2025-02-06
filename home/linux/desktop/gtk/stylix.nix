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
    # autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs-stable.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    # targets = {
    #   cavalier.enable = false;
    #   cava.enable = false;
    # };
  };

}
