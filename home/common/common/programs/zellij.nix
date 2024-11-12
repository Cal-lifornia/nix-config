{ pkgs, ... }:
{

  programs = {
    zellij = {
      enable = true;
      enableBashIntegration = true;
    };
  };
  home.file.".config/zellij/zellij-sessionizer.wasm" = {
    source = builtins.fetchurl {
      url = "https://github.com/laperlej/zellij-sessionizer/releases/download/v0.4.3/zellij-sessionizer.wasm";
      hash = "";
    };
  };
}
