{
  pkgs,
  username,
  ...
}:
{
  imports = [
    ../common
    ./common
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

  };
}
