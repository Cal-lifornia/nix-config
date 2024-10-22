{pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    obsidian

    insomnia

    parsec-bin
    termius
    spotify
    discord
    
    vial
  ];

  programs = {
    alacritty.enable = true;
  };
}
