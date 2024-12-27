{ pkgs, ... }:
{
  imports = [
    ../../home/linux
  ];
  programs.zsh.initExtra = ''
    export COLORTERM=truecolor
  '';
}
