{ ... }:
{
  programs.nixvim.enable = true;
  programs.nixvim.nixpkgs.config.allowUnfree = true;
  programs.nixvim.imports = [ ./init.nix ];
}
