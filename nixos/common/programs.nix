{ config, pkgs, ... }:
{
  programs = {

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    mtr.enable = true;
    zsh.enable = true;
    #bash = {
    #  interactiveShellInit = ''
    #    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    #       WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
    #    fi
    #  '';
    #};
  };
}
