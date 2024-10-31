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
    ./terminal
    ./tmux
  ];

  home.file = {
    ".config/themes".source = "${configDir}/themes";
  };

  home.packages = (
    with pkgs;
    [
      stow
    ]
  );
}
