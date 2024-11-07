{ pkgs, ... }:
{
  imports = [
    ./alacritty
    #./media
    ../common
  ];
  home.packages = (
    with pkgs;
    [
      obsidian
      zoom-us
    ]
  );
}
