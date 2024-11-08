{ pkgs, ... }:
{
  programs = {
    zsh = {
      initExtra = ''
        export PATH=$PATH:/opt/homebrew/bin
      '';
    };
  };
}
