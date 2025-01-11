{
  pkgs-unstable,
  lib,
  ...
}:
{
  programs = {
    ssh.setXAuthLocation = lib.mkForce false;

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    mtr.enable = true;
    zsh.enable = true;
    zsh.package = pkgs-unstable.zsh;
    #bash = {
    #  interactiveShellInit = ''
    #    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    #       WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
    #    fi
    #  '';
    #};
  };
}
