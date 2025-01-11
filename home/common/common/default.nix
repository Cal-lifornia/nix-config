let
  configDir = ../configs;
in
{
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./shells
    ./dev
    ./programs
  ];

  home.file = {
    ".config/themes".source = "${configDir}/themes";
    ".config/nvim".source = "${configDir}/nvim";
    ".config/zellij".source = "${configDir}/zellij";
  };

  home.packages = (
    with pkgs-unstable;
    [
      stow
    ]
  );

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
}
