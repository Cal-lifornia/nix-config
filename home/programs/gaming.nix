{ pkgs, isLinuxDesktop, ... }:
{
  home.packages =
    with pkgs;
    [
    ]
    ++ (lib.optionals isLinuxDesktop [
      gamma-launcher
      # steam
      # steam-run
      # lutris
      # xorg.xandr
    ]);
}
