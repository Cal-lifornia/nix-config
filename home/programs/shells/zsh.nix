{
  pkgs,
  isMac,
  isLinux,
  isDesktop,
  lib,
  ...
}:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        cat = "bat --paging=never";
        el = "eza -l";
        zs = "~/.local/scripts/zellij-sessioniser";
      };
      initContent =
        let
          confExtraFirst = lib.mkBefore ''
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          '';
          confExtra = ''
            source ~/.config/themes/p10k.zsh

            export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
            export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
            ${if isMac then "export PATH=$PATH:/opt/homebrew/bin" else ""}
            ${if isLinux && !isDesktop then "export COLORTERM=truecolor" else ""}
          '';
        in
        lib.mkMerge [
          confExtra
          confExtraFirst
        ];
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
        ];
      };
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
