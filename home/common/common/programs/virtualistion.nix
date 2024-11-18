{ pkgs, ... }:
{
  home.programs = with pkgs; [
    lazydocker
  ];
}
