{ lib, inputs, ... }:
{
  programs.starship = {
    enable = false;

    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
}
