{
  pkgs,
  username,
  ...
}:
{
  imports = [
    ../home.nix
    ./common
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

  };
}
