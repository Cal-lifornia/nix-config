{
  pkgs,
  lib,
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
  imports =
    [
      ./shells
      ./dev
      ./multiplexers
      ./gaming.nix
      ./yazi.nix
      ./git.nix
      ./media.nix
      ./browsers.nix
      ./virtualistion.nix
    ]
    ++ (lib.optionals isDesktop [
      ./terminals
    ])
    ++ (lib.optionals isLinuxDesktop [
      ./hypr
      ./desktop-utils
      ./desktop-theming
    ])
    ++ (lib.optionals isMac [
      ./mac.nix
    ]);

  home.file =
    {
      ".config/themes".source = "${configDir}/themes";
      ".config/nvim".source = "${configDir}/nvim";
      ".config/zellij".source = "${configDir}/zellij";
      ".config/eza/theme.yml".source = "${configDir}/eza/theme.yml";
    }
    // (
      if isLinuxDesktop then
        {

          ".config/hypr".source = "${configDir}/hypr";
          ".config/wlogout".source = "${configDir}/wlogout";
          ".config/wofi".source = "${configDir}/wofi";
          ".config/waybar".source = "${configDir}/waybar";
          ".config/satty".source = "${configDir}/satty";
          ".config/swww/swww_randomize_multi.sh" = {
            source = "${configDir}/swww/swww_randomize_multi.sh";
            executable = true;
          };
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
    ])
    ++ (lib.optionals isLinuxDesktop [
      virtualbox
      #User Apps
      celluloid
      vesktop
      cool-retro-term
      lollypop
      lutris
      openrgb
      nwg-look
      zoom-us

      #misc
      nano
      nitch
      grim
      slurp
      pamixer
      mpc-cli
      tty-clock
      gearlever

      parsec-bin
      zenity
      gnome-tweaks
      eog
      libreoffice-qt6-fresh
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
