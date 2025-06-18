{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pinentry-all
  ];
  programs = {
    ssh.setXAuthLocation = lib.mkForce false;

    gnupg = {
      agent = {
        pinentryPackage = pkgs.pinentry-all;
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
