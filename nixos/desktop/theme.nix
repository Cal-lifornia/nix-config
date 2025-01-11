{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    adwaita-icon-theme # default gnome cursors
    glib
    gsettings-desktop-schemas

  ];
}
