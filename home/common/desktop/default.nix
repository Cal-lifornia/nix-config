{ pkgs-unstable, ... }:
{
  imports = [
    ./alacritty
    #./media
    ../common
    ./kitty
  ];
  home.packages = (
    with pkgs-unstable;
    [
      obsidian
      zoom-us
      gifski
    ]
  );
}
