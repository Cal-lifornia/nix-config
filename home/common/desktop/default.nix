{ pkgs, ... }:
{
  imports = [
    ./alacritty
    ./media
  ];
  home.packages = (
    with pkgs;
    [
      obsidian
    ]
  );
}
