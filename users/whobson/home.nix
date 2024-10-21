{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/core.nix
  ];

  programs.git = {
    userName = "William Hobson";
    userEmail = "willhobson@live.com.au";
  };
}
