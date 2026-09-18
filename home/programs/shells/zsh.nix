{
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
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      initContent =
        let
          confExtra = ''
            export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
            export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
            export PATH=$PATH:~/.local/scripts
            # [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
            ${if isLinux && !isDesktop then "export COLORTERM=truecolor" else ""}
            ${if isMac then "export PATH=$PATH:/opt/homebrew/bin" else ""}
            fastfetch
          '';
        in
        lib.mkMerge [
          confExtra
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
          "MichaelAquilina/zsh-you-should-use"
        ];
      };
    };
  };
}
