{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hexyl
    fq
    binsider
    lldb
    imhex
    ghidra-bin
  ];
}
