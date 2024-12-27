{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      ignores = [
        ".direnv/"
        "*.swp"
        ".env"
        ".envrc"
      ];
      signing = {
        key = null;
        signByDefault = true;
      };
      extraConfig = {
        gpg = {
          format = "ssh";
        };
        user = {
          signingkey = "~/.ssh/github-key";
        };
      };
    };
  };
}
