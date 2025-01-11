{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    alsa-lib
    alsa-utils
    alsa-oss
  ];

  hardware.pulseaudio.enable = false;
}
