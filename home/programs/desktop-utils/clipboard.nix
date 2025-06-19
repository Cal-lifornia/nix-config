{ pkgs, ... }:
{
  services.cliphist = {
    enable = true;
    extraOptions = [
      "wl-paste --type image --watch cliphist store"
      "wl-paste --type text --watch cliphist store"
    ];

  };
}
