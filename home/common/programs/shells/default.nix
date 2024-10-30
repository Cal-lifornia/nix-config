{ config, pkgs, ... }: {

  programs = {
    zsh = {
      enable = true;
      oh-my-zsh.enable = true;
      initExtraFirst = "source ~/dotfiles/.zshrc";
    };

    bash.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    nix-direnv.enable = true;
  };

}
