{ pkgs-unstable, ... }:
{
  imports = [
    ./git.nix
    ./yazi.nix
    ./multiplexers
    ./virtualistion.nix
  ];

  home.packages = with pkgs-unstable; [
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
