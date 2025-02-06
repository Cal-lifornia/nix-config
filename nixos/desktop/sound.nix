{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsa-lib
    alsa-utils
    alsa-oss
  ];

  services.pulseaudio.enable = false;
}
