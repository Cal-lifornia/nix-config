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
      initContent = ''
        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
        export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        export PATH=$PATH:~/.local/scripts
        ${lib.optionalString (isLinux && !isDesktop) "export COLORTERM=truecolor"}
        ${lib.optionalString isMac "export PATH=$PATH:/opt/homebrew/bin"}
        fastfetch
      '';
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
