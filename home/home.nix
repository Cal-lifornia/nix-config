{ hyprland, pkgs, username, ...}: {

  imports = [
    hyprland.homeManagerModules.default
    ./programs
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.packages = (with pkgs; [
    

    #User Apps
    celluloid
    vesktop
    cool-retro-term
    bibata-cursors
    vscode
    lollypop
    lutris
    openrgb
    parsec-bin
    obsidian
    insomnia
    _1password-gui
    stow
   

    #misc 
    nano
    wofi
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    #exa
    btop
    tokyo-night-gtk

  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
  ]);


  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };

  programs = {
    home-manager.enable = true;
      };

  home.stateVersion = "24.05";
}
