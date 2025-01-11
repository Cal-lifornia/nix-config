{ pkgs-unstable, ... }:
let
  configDir = ./config;
in
{
  programs.starship = {
    enable = true;
    package = pkgs-unstable.starship;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      palette = "amethyst";
    } // builtins.fromTOML (builtins.readFile "${configDir}/starship.toml");
  };
}
