{pkgs, ...}: {
  imports = [
    ../../modules/home/core.nix
  ];

  programs.git = {
    userName = "William Hobson";
    userEmail = "willhobson@live.com.au";
  };
}
