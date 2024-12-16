{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsa-lib
    alsa-utils
    alsa-oss
  ];

  hardware.pulseaudio.enable = false;
}
