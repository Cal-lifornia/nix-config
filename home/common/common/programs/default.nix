{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./yazi.nix
    ./multiplexers
    ./virtualistion.nix
  ];

  home.packages = with pkgs; [
    eza
    vhs
    wtf
    lazygit
    glow
    unzip
    curl
    btop
    tailscale
    jq
    navi
  ];

}
