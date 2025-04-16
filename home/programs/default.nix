let
  configDir = ../configs;
in
{
  pkgs,
  lib,
  isDesktop,
  isMac,
  isLinux,
  isLinuxDesktop,
  ...
}:
{
  imports =
    [
      ./shells
      ./dev
      ./multiplexers
    ]
    ++ (lib.optionals isDesktop [
      ./terminals
    ]);

  home.file = {
    ".config/themes".source = "${configDir}/themes";
    ".config/nvim".source = "${configDir}/nvim";
    ".config/zellij".source = "${configDir}/zellij";
  };
  home.packages =
    with pkgs;
    [
    ]
    ++ (lib.optionals isDesktop [
      obsidian
      zoom-us
      gifski
    ])
    ++ (lib.optionals pkgs.stdenv.isLinux [
      gnumake
      nano
      wget
      sysz
    ]);

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
}
