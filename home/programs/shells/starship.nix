{ lib, inputs, ... }:
let
  configDir = ./config;
in
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
    } // builtins.fromTOML (builtins.readFile "${configDir}/starship.toml");
  };
}
