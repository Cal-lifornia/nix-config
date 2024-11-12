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
    ./programs
  ];

  home.file = {
    ".config/themes".source = "${configDir}/themes";
    ".config/zellij".source = "${configDir}/zellij";
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
