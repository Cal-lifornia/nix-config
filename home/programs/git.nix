{ pkgs, ... }:
{
  home.file.".ssh/allowed_signers" = {
    enable = true;
    text = "willhobson@live.com.au ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAI1BjCvnhz3ufUwcBI3C2QFu0OzHJAJUGyrMEWsYhgs";
  };
  programs = {
    git = {
      enable = true;
      ignores = [
        ".direnv/"
        "*.swp"
        ".env"
        ".envrc"
        ".venv"
      ];
      signing = {
        key = null;
        signByDefault = true;
      };
      settings = {
        user = {
          email = "willhobson@live.com.au";
          name = "William Hobson";
        };
        gpg = {
          format = "ssh";
          ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        };
        user = {
          signingkey = "~/.ssh/github-key";
        };
      };
    };
  };
}
