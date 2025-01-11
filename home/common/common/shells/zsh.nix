{ pkgs-unstable, ... }:
{
  programs = {
    zsh = {
      enable = true;
      package = pkgs-unstable.zsh;
      autosuggestion.enable = true;
      shellAliases = {
        cat = "bat --paging=never";
        el = "eza -l";
        zs = "~/.local/scripts/zellij-sessioniser";
      };
      initExtraFirst = ''
        source ${pkgs-unstable.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      '';
      initExtra = ''
        source ~/.config/themes/p10k.zsh

        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
        export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
      oh-my-zsh = {
        enable = true;
        package = pkgs-unstable.oh-my-zsh;
        plugins = [
          "git"
          "direnv"
        ];
      };
      antidote = {
        enable = true;
        package = pkgs-unstable.antidote;
        plugins = [
          "zsh-users/zsh-autosuggestions"
          "MichaelAquilina/zsh-you-should-use"
          "zsh-users/zsh-syntax-highlighting"
        ];
      };
    };
  };
}
