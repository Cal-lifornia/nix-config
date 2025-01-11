{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      userEmail = "willhobson@live.com.au";
      userName = "William Hobson";
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
