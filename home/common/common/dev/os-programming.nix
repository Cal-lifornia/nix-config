{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hexyl
    fq
    binsider
  ];
}
