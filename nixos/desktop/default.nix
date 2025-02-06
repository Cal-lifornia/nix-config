{
  pkgs,
  lib,
  catppuccin,
  ...
}:
{
  # ============================= User related =============================

  imports = [
    ../common
    ./hyprland.nix
    ./packages.nix
    ./programs.nix
    ./steam.nix
    ./theme.nix
    ./bluetooth.nix
    ./sound.nix
    # ./stylix.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    xfce.thunar # xfce4's file manager
  ];

  # Enable sound with pipewire.
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

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

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
    displayManager = {
      defaultSession = "hyprland";
      sddm.enable = true;
      sddm.wayland.enable = true;
      sddm.enableHidpi = true;
      sddm.package = pkgs.kdePackages.sddm;
      # sddm.catppuccin = {
      #   enable = true;
      #   flavor = "frappe";
      #   font = "Noto Sans";
      # };
      sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
  };

}
