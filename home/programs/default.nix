{
  pkgs,
  lib,
  config,
  isDesktop,
  isMac,
  isLinux,
  isLinuxDesktop,
  ...
}:
let
  configDir = ../configs;
in
{
  imports = [
    ./shells
    ./dev
    ./multiplexers
    # ./gaming.nix
    ./yazi.nix
    ./git.nix
    ./media.nix
    # ./browsers.nix
    ./virtualistion.nix
  ]
  ++ (lib.optionals isDesktop [
    ./terminals
  ])
  ++ (lib.optionals isLinuxDesktop [
    # ./hypr
    ./desktop-utils
    # ./desktop-theming
  ])
  ++ (lib.optionals isMac [
    ./mac.nix
  ]);
  home.sessionVariables = {

  }
  // (
    if isLinuxDesktop then
      {
        BROWSER = "firefox";
        TERM = "alacritty";
        # QT_QPA_PLATFORMTHEME = "qt5ct";
      }
    else
      { }
  );

  home.file = {
    ".config/themes".source = "${configDir}/themes";
    ".config/nvim".source = "${configDir}/nvim";
    ".config/zellij".source = "${configDir}/zellij";
    ".config/eza/theme.yml".source = "${configDir}/eza/theme.yml";
  }
  // (
    if isLinuxDesktop then
      {
        ".config/alacritty".source = "${configDir}/alacritty";
        # ".config/hypr".source = "${configDir}/hypr";
        # ".config/wlogout".source = "${configDir}/wlogout";
        # ".config/wofi".source = "${configDir}/wofi";
        # ".config/waybar".source = "${configDir}/waybar";
        # ".config/satty".source = "${configDir}/satty";
        # ".config/swaylock".source = "${configDir}/swaylock";
        # ".config/mako".source = "${configDir}/mako";
        # ".config/Kvuntum".source = "${configDir}/Kvantum";
        # ".config/gtk-3.0".source = "${configDir}/gtk-3.0";
        # ".config/gtk-4.0".source = "${configDir}/gtk-4.0";
        # ".config/qtc5t".source = "${configDir}/qt5ct";
        # ".config/swww/swww_randomize_multi.sh" = {
        #   source = "${configDir}/swww/swww_randomize_multi.sh";
        #   executable = true;
        # };
      }
    else
      { }
  );
  home.packages =
    with pkgs;
    [
      vhs
      glow
      unzip
      curl
      btop
      jq
      lazygit
      tldr
      sd
    ]
    ++ (lib.optionals isDesktop [
      obsidian
      gifski
    ])
    ++ (lib.optionals isLinux [
      gnumake
      nano
      wget
      sysz
      tailscale
      dua
    ])
    ++ (lib.optionals isLinuxDesktop [

      #User Apps
      # vesktop
      lollypop
      # lutris
      openrgb
      # nwg-look
      (config.lib.nixGL.wrap zoom-us)

      #misc
      nano
      nitch
      # grim
      # slurp
      pamixer
      mpc-cli
      tty-clock
      gearlever
      gtk3
      (config.lib.nixGL.wrap blender)
      unityhub

      zenity
      eog

      # Touchpad Gestures
      # fusuma
    ]);

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableSshSupport = true;
      enableNushellIntegration = true;
    };
  };
}
