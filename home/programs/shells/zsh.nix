{
  isMac,
  isLinux,
  isDesktop,
  lib,
  ...
}:
{
  nixpkgs.overlays = [
    (final: prev: {
      zsh = prev.zsh.overrideAttrs (
        old:
        prev.lib.optionalAttrs prev.stdenv.isDarwin {
          preConfigure = (old.preConfigure or "") + ''
            export zsh_cv_sys_sigsuspend=yes
          '';
        }
      );
    })

  ];
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      initContent =
        let
          confExtra = ''
            export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
            export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
            export PATH=$PATH:~/.local/scripts
            # [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
            ${if isLinux && !isDesktop then "export COLORTERM=truecolor" else ""}
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
          "zsh-users/zsh-autosuggestions"
          "MichaelAquilina/zsh-you-should-use"
          "zsh-users/zsh-syntax-highlighting"
        ];
      };
    };
  };
}
