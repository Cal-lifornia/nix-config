{
  pkgs,
  lib,
  catppuccin,
  cosmic,
  ...
}:
{
  # ============================= User related =============================

  imports = [
    ../common
    (if cosmic then ./cosmic.nix else ./hyprland.nix)
    ./packages.nix
    ./programs.nix
    ./steam.nix
    ./theme.nix
    ./bluetooth.nix
    ./sound.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    xfce.thunar # xfce4's file manager
  ];

  services.flatpak.enable = true;

  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;

  # programs.regreet.enable = true;
  # services.greetd = {
  #  enable = true;
  #  settings = {
  #    initial_session = {
  #      user = "whobson";
  #      command = "$SHELL -l";
  #    };
  #  };
  # };

  services = {
    dbus.packages = [ pkgs.gcr ];

    geoclue2.enable = true;

    # Enables Vial to see and manage my keyboard
    udev = {
      packages = with pkgs; [
        gnome-settings-daemon
        openocd
      ];
      extraRules = ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
      '';

    };

    xserver.enable = false;
  };

}
