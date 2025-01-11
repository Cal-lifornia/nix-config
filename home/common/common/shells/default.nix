{ pkgs-unstable, ... }:
{
  imports = [
    ./zsh.nix
    ./starship.nix
  ];

  home.packages = with pkgs-unstable; [
    zsh-powerlevel10k
    nnn
    curl
    eza
  ];
  catppuccin = {
    bat = {
      enable = true;
      flavor = "macchiato";
    };
  };

  programs = {
    bash.enable = true;
    nushell = {
      enable = true;
      package = pkgs-unstable.nushell;
    };
    ripgrep = {
      enable = true;
      package = pkgs-unstable.ripgrep;
    };
    fd = {
      enable = true;
      package = pkgs-unstable.fd;
    };

    zoxide = {
      enable = true;
      package = pkgs-unstable.zoxide;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    bat = {
      enable = true;
      package = pkgs-unstable.bat;
    };
    fzf = {
      enable = true;
      package = pkgs-unstable.fzf;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs-unstable.direnv;
      nix-direnv = {
        enable = true;
        package = pkgs-unstable.nix-direnv;
      };
      enableNushellIntegration = true;
    };
    carapace = {
      enable = true;
      package = pkgs-unstable.carapace;
      enableNushellIntegration = true;
    };
    # atuin = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   enableBashIntegration = true;
    # };
  };

}
