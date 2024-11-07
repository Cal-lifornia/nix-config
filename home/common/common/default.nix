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
    ./dev
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

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
}
