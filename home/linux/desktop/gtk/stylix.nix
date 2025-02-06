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
    base16Scheme = "${pkgs-stable.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    targets = {
      dunst.enable = false;
      cava.enable = false;
      kitty.enable = false;
    };
  };

}
