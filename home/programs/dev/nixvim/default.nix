{ ... }:
{
  programs.nixvim.enable = true;
  programs.nixvim.imports = [ ./init.nix ];
}
