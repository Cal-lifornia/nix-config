{ pkgs, ... }:
{
  imports = [
    ./alacritty
    #./media
    ../common
    ./kitty
  ];
  home.packages = (
    with pkgs;
    [
      obsidian
      zoom-us
    ]
  );
}
