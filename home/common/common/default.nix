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
    ./programs
  ];

  home.file = {
    ".config/themes".source = "${configDir}/themes";
    ".config/nvim".source = "${configDir}/nvim";
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
