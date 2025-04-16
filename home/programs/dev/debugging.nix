{
  pkgs,
  isDesktop,
  lib,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      hexyl
      fq
      binsider
      lldb
    ]
    ++ (lib.optionals isDesktop [
      imhex
      ghidra-bin
    ]);
}
