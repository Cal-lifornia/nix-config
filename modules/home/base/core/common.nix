{pkgs, lib, config, ...}: {
  home.packages = with pkgs; [
    zip
    unzip

    ripgrep
    htop

    libnotify
    xdg-utils
    graphviz

    docker-compose
    kubectl
    
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
      config = {
        pager = "never";
      };
    };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    aria2.enable = true;
    neovim.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
