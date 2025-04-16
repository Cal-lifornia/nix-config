{ pkgs, isLinuxDesktop, ... }:
{
  home.packages =
    with pkgs;
    [
    ]
    ++ (lib.optionals isLinuxDesktop [
      steam
      steam-run
      lutris
      xorg.xandr
    ]);
}
