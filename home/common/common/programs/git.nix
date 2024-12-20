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
    };
  };
}
