{pkgs, lib, ...}:
{
  imports = [
    ./git.nix
    ./common.nix
  ];

  git.enable = lib.mkDefault true;
}
