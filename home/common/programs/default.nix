let
  configDir = ../configs;
in
{
  pkgs,
  ...
}:
{
  imports = [
    ./shells
    ./browsers
    ./terminal
    ./media
  ];

  home.file = {
    ".config/themes".source = "${configDir}/themes";
  };

  home.packages = (
    with pkgs;
    [

      parsec-bin
      obsidian
      insomnia
      _1password-gui
      stow
    ]
  );
}
