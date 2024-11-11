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
    };
  };
}
