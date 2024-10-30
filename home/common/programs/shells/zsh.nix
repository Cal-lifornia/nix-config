{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        cat = "bat --paging=never";
      };
      promptInit = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      '';
      initExtra = ''
        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
        export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "direnv"
        ];
        theme = "powerlevel10k";
      };
      initExtraFirst = "source ~/dotfiles/.zshrc";
      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-autosuggestions"
          "MichaelAquilina/zsh-you-should-use"
          "zsh-users/zsh-syntax-highlighting"
        ];
      };
    };
  };
}
