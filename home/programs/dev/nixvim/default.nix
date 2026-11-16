{ ... }:
{
  programs.nixvim.enable = false;
  programs.nixvim.nixpkgs.config.allowUnfree = true;
  programs.nixvim.imports = [ ./init.nix ];
}
