{ lib, inputs, ... }:
let
  configDir = ./config;
in
{
  programs.starship = {
    enable = false;

    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      palette = "opal";
    } // builtins.fromTOML (builtins.readFile "${configDir}/starship.toml");
  };
}
