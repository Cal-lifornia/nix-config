{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsa-lib
    alsa-utils
  ];
}
