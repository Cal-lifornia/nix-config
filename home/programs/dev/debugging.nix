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
      termshark
    ]
    ++ (lib.optionals isDesktop [
      imhex
      ghidra-bin
    ]);
}
